// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {IERC20, ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Capped} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {VestingWallet} from "@openzeppelin/contracts/finance/VestingWallet.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IUniswapV2Factory} from "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import {IUniswapV2Pair} from "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";
import {IUniswapV2Router02} from "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

import {Governable} from "./Governable.sol";

/**
 * @title Axé Token
 * @dev A XERC20 token that can collect a tax on trade activity in a configurable Uniswap v2 pool. 
 * The token is controlled by a governor who can change fees and withdraw accumulated assets into
 * a treasury.
 * This token symbolizes positive energy in reference to the term and concept of "Axé" in Capoeira and Candomblé.
 */
contract AXE is Ownable, Governable, ERC20Capped {
    using SafeERC20 for IERC20;

    /// @dev MAX SUPPLY honors Mestre Pastinha and Mestre Bimba by encoding their birthdays.
    /// M. Pastinha was born 10 years before M. Bimba, so going backwards in order of their birthdays gets us
    /// close to a target of 10 billion tokens: 18[99]/[11]/[23], 18[89]/0[4]/0[5]
    uint256 internal constant _MAX_SUPPLY = 9_911_238_945;
    uint256 internal constant _VESTING_AMOUNT = 25_000_000; // ~0.05% of total supply
    uint64 internal constant _VESTING_DURATION = 94_608_000; // 3 years
    string internal constant _NAME = unicode"Axé";
    string internal constant _TICKER = unicode"AXÉ";

    address private governorTreasury;
    address public vestingWallet;
    uint256 public buyTax = 300;
    uint256 public sellTax = 500;
    address public uniswapV2Router;
    address public uniswapV2Pair;
    mapping(address => bool) private taxablePairs;
    mapping(address => bool) private excluded;
    
    /// @dev Stores the history of liquidityTokens that were used to swap AXE. Can contain duplicates
    address[] private tokenHistory;

    /** EVENTS */
    event AxeIssued(uint256 amount);
    event SellTaxChanged(uint256 value);
    event BuyTaxChanged(uint256 value);
    event TaxablePairAdded(address pair);
    event TaxablePairRemoved(address pair);
    event AxeLiquidated(uint256 amount, address swapToken);
    event AllWithdrawn(uint256 native, uint256 axe, address[] tokens);
    event BalanceRescued(address token, uint256 amount);
    event LiquidationSettingsChanged(address router, address swapToken, address pair);
    event BuyTaxApplied(uint256 tradeAmount, uint256 basisPoints, uint256 feeAmount, address indexed spender);
    event SellTaxApplied(uint256 tradeAmount, uint256 basisPoints, uint256 feeAmount, address indexed spender);

    modifier onlyBasisPoints(uint256 value) {
        require(value <= 10000, "Value must be in basis points (0-10000): E.g. 50 = 0.5%, 9990 = 99.9%");
        _;
    }

    /**
     * @dev Constructor - Mints the vesting amount for the governor into the governor's treasury.
     * @param _founder - the founder's address for vesting
     * @param _governor - the DAO's multisig
     * @param _governorTreasury - the DAO's treasury
     */
    constructor(
        address _founder,
        address _governor,
        address _governorTreasury
    ) Ownable(_governor) Governable(_governor) ERC20(_NAME, _TICKER) ERC20Capped(_MAX_SUPPLY * (10 ** decimals())) {
        require(_founder != address(0), "AXE requires a founder");
        require(_governor != address(0), "AXE requires a governor");
        require(_governorTreasury != address(0), "AXE requires a governor's treasury");
        governorTreasury = _governorTreasury;
        //exclude treasury and this contract from fees
        excluded[governorTreasury] = true;
        excluded[address(this)] = true;
        // Set up founder's vesting wallet
        VestingWallet vWallet = new VestingWallet(_founder, uint64(block.timestamp), _VESTING_DURATION);
        vestingWallet = address(vWallet);
        _mint(vestingWallet, _VESTING_AMOUNT * (10 ** decimals()));
    }

    /**
     * @dev Allows the governor to issue additional supply to its treasury up to max supply.
     * @param _amount - amount of AXE to issue
     */
    function issue(uint256 _amount) external onlyGovernor {
        _mint(governorTreasury, _amount);
        emit AxeIssued(_amount);
    }

    /**
     * Sets a new buy tax in basis points.
     * @param basisPoints must be between 0 and 10000d
     */
    function setBuyTax(uint256 basisPoints) external onlyGovernor onlyBasisPoints(basisPoints) {
        buyTax = basisPoints;
        emit BuyTaxChanged(buyTax);
    }

    /**
     * Sets a new sell tax in basis points.
     * @param basisPoints must be between 0 and 10000
     */
    function setSellTax(uint256 basisPoints) external onlyGovernor onlyBasisPoints(basisPoints) {
        sellTax = basisPoints;
        emit SellTaxChanged(sellTax);
    }

    /**
     * @dev Adds the given pair to the list of taxable pools
     * @param pair - a UniswapV2Pair
     */
    function addTaxablePair(address pair) external onlyGovernor {
        require(pair != address(0), "Cannot add zero address");
        require(IUniswapV2Pair(pair).token0() == address(this) || IUniswapV2Pair(pair).token1() == address(this), "Pair must contain this token");
        taxablePairs[pair] = true;
        emit TaxablePairAdded(pair);
    }

    /**
     * @dev Removes the given pair from the list of taxable pools
     * @param pair - a UniswapV2Pair, but not the current {uniswapV2Pair} used for swapping
     */
    function removeTaxablePair(address pair) external onlyGovernor {
        require(pair != uniswapV2Pair, "Cannot remove the pair currently used for liquidation");
        taxablePairs[pair] = false;
        emit TaxablePairRemoved(pair);
    }

    /**
     * @dev Returns the top of the {tokenHistory} list which corresponds to the token currently used for Axé liquidation.
     * Returns 0x0 if no token has been set, yet, via #setLiquidationRouterAndToken(address,address).
     */
    function getLiquidationToken() public view returns (address swapToken) {
        swapToken = tokenHistory.length > 0 ? tokenHistory[tokenHistory.length - 1] : address(0);
    }

    /**
     * @dev Attempts to swap the given amount of AXE for the liquidity token.
     * @param amount how much AXE to swap
     */
    function liquidate(uint256 amount) public onlyGovernor {
        require(_hasRouter(), "Invoking this function requires a router and a liquidity pair to be set up!");
        require(
            amount > 0 && amount <= balanceOf(address(this)),
            "Liquidation amount must be between 0 and max balance."
        );
        // Grant allowance for swapping
        _approve(address(this), uniswapV2Router, amount);
        uint deadline = block.timestamp + (10 * 60); // 10 min
        address[] memory path;
        path[0] = address(this);
        path[1] = getLiquidationToken();
        IUniswapV2Router02(uniswapV2Router).swapExactTokensForTokens(amount, 0, path, address(this), deadline);
        emit AxeLiquidated(amount, path[1]);
    }

    /**
     * @dev Withdraws accumulated AXE, liquidityTokens (from history), and native tokens, for any existing balances to the treasury.
     */
    function withdrawAll() external onlyGovernor {
        // Native token
        uint256 nativeBalance = address(this).balance;
        if (nativeBalance > 0) payable(governorTreasury).transfer(nativeBalance);
        // AXE
        uint256 axeBalance = balanceOf(address(this));
        if (axeBalance > 0) _transfer(address(this), governorTreasury, axeBalance);
        // Other tokens from history
        uint256 numTokens = tokenHistory.length;
        IERC20 token;
        uint256 tokenBalance;
        address[] memory tokens;
        for (uint256 i = 0; i < numTokens; i++) {
            token = IERC20(tokenHistory[i]);
            tokenBalance = token.balanceOf(address(this));
            if (tokenBalance > 0) {
                token.transfer(governorTreasury, tokenBalance);
                tokens[tokens.length] = address(token);
            }
        }
        emit AllWithdrawn(nativeBalance, axeBalance, tokens);
    }

    // TODO need individual functions to withdraw eth, axe, or a specific token! withdrawAll is kind of too broad a sweep

    /**
     * @dev Fallback function to withdraw an ERC20 token that might've been sent to this contract, but is not in the tokenHistory.
     * @param _token the ERC20 to rescue
     */
    function rescueBalance(address _token) external onlyGovernor {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        if (balance > 0) IERC20(_token).transfer(governorTreasury, balance);
        emit BalanceRescued(_token, balance);
    }

    /**
     * Sets a new router and liquidity token. If the router does not have an existing pair of AXE <-> liquidityToken,
     * a pair will be automatically created. The liquidityToken is added to the tokenHistory to be able to withdraw it later.
     * @param _router the UniswapV2Router to use
     * @param _swapToken an IERC20 token used to liquidate AXE
     */
    function setLiquidationRouterAndToken(
        address _router,
        address _swapToken
    ) public onlyGovernor returns (address) {
        require(_router != address(0), "Router cannot be zero address");
        require(_swapToken != address(0), "Liquidity token cannot be zero address");
        //  IUniswapV2Router02(uniswapV2Router).
        // set router for swapping
        uniswapV2Router = _router;
        // Check for existing pair or create a new one
        address existingPair = IUniswapV2Factory(IUniswapV2Router02(uniswapV2Router).factory()).getPair(
            address(this),
            _swapToken
        );
        if (address(0) == existingPair) {
            // Create a uniswap pair for the new token
            uniswapV2Pair = IUniswapV2Factory(IUniswapV2Router02(uniswapV2Router).factory()).createPair(
                address(this),
                _swapToken
            );
        } else {
            uniswapV2Pair = existingPair;
        }
        // Keep a reference to the liquidity token to access any accumulated balance in the future
        tokenHistory.push(_swapToken); // TODO: does not check if the same token has been used in the past and would store a duplicate. Should manipulate array to move existing token to the top
        // Add pair to be taxed
        taxablePairs[uniswapV2Pair] = true;

        emit LiquidationSettingsChanged(_router, _swapToken, uniswapV2Pair);
        return uniswapV2Pair;
    }

    /**
     * @dev Overrides ERC20._update to impose buy/sell fees
     */
    function _update(address from, address to, uint256 value) internal override {
        // Don't intervene on minting/burning
        if (from == address(0) || to == address(0)) {
            return super._update(from, to, value);
        }
        uint256 fee;
        uint256 adjustedValue = value;
        if (!excluded[from] && !excluded[to]) {
            // BUY
            if (taxablePairs[from] && buyTax > 0) {
                fee = _calculateFee(buyTax, value);
                super._update(from, address(this), fee);
                adjustedValue -= fee;
                emit BuyTaxApplied(value, buyTax, fee, to);
            }
            // SELL
            else if (taxablePairs[to] && sellTax > 0) {
                fee = _calculateFee(sellTax, value);
                super._update(from, address(this), fee);
                adjustedValue -= fee;
                emit SellTaxApplied(value, buyTax, fee, from);
            }
        }
        super._update(from, to, adjustedValue);
    }

    /**
     * Applies the given tax to the given amount and returns the result.
     * @param basisPoints the tax in basis points
     * @param amount the amount on which to apply the tax
     */
    function _calculateFee(uint256 basisPoints, uint256 amount) internal pure returns (uint256) {
        return amount == 0 ? 0 : (amount * basisPoints) / 10 ** 4;
    }

    function _hasRouter() internal view returns (bool success) {
        return uniswapV2Router != address(0) && uniswapV2Pair != address(0);
    }

    //to receive native tokens
    receive() external payable {}
}

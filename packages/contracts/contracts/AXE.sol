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

import "hardhat/console.sol";

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
    address public liquidationPair;
    address public liquidationToken;
    mapping(address => bool) private taxablePairs;
    mapping(address => bool) private excluded;
    
    /** EVENTS */
    event AxeIssued(uint256 amount);
    event SellTaxChanged(uint256 value);
    event BuyTaxChanged(uint256 value);
    event TaxablePairAdded(address pair);
    event TaxablePairRemoved(address pair);
    event AxeLiquidated(address swapToken, uint256 axeAmount, uint256 outputAmount);
    event BalanceRescued(address token, uint256 amount);
    event LiquidationSettingsChanged(address router, address swapToken, address pair);
    event BuyTaxApplied(uint256 tradeAmount, uint256 basisPoints, uint256 feeAmount, address indexed spender);
    event SellTaxApplied(uint256 tradeAmount, uint256 basisPoints, uint256 feeAmount, address indexed spender);
    event NativeWithdrawn(uint256 amount);
    event TokenWithdrawn(address indexed token, uint256 amount);

    /// @dev Value between 0-10000: E.g. 50 = 0.5%, 9990 = 99.9%
    modifier onlyBasisPoints(uint256 value) {
        require(value <= 10000, "Value must be in basis points");
        _;
    }

    /**
     * @dev Constructor - Mints the vesting amount for the founder into a VestingWallet and gives control to the governor.
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
     * @dev Removes the given pair from the list of taxable pairs
     * @param pair - a UniswapV2Pair
     */
    function removeTaxablePair(address pair) external onlyGovernor {
        taxablePairs[pair] = false;
        emit TaxablePairRemoved(pair);
    }

    /**
     * Sets a new router and liquidity token. If the router does not have an existing pair of AXE <-> liquidityToken,
     * a pair will be automatically created.
     * @param _router the UniswapV2Router
     * @param _swapToken an IERC20 token used to liquidate AXE
     */
    function setLiquidationRouterAndToken(
        address _router,
        address _swapToken
    ) public onlyGovernor returns (address) {
        require(_router != address(0), "Router cannot be zero address");
        require(_swapToken != address(0), "Liquidity token cannot be zero address");
        //  IUniswapV2Router02(uniswapV2Router).
        // set router and token for swapping
        uniswapV2Router = _router;
        liquidationToken = _swapToken;
        // Check for existing pair or create a new one
        address existingPair = IUniswapV2Factory(IUniswapV2Router02(uniswapV2Router).factory()).getPair(
            address(this),
            _swapToken
        );
        if (address(0) == existingPair) {
            // Create a uniswap pair for the new token
            liquidationPair = IUniswapV2Factory(IUniswapV2Router02(uniswapV2Router).factory()).createPair(
                address(this),
                _swapToken
            );
        } else {
            liquidationPair = existingPair;
        }
        // Add pair to be taxed
        taxablePairs[liquidationPair] = true;

        emit LiquidationSettingsChanged(_router, _swapToken, liquidationPair);
        return liquidationPair;
    }

    /**
     * @dev Attempts to swap the given amount of AXE for the liquidity token and deposits the output into
     * the #governorTreasury (since UniswapV2Router02 does not allow the recipient to be part of the pair).
     * @param _amount how much AXE to swap
     * @param _slippage how much slippage to set for the swap to the liquidityToken
     */
    function liquidate(uint256 _amount, uint256 _slippage) external onlyGovernor onlyBasisPoints(_slippage) {
        require(_canLiquidate(), "Invoking this function requires a router and a liquidity pair to be set up!");
        require(
            _amount > 0 && _amount <= balanceOf(address(this)),
            "Liquidation amount must be between 0 and max balance."
        );
        // Approve router spending AXÉ
        _approve(address(this), uniswapV2Router, _amount);
        uint deadline = block.timestamp + (10 * 60); // 10 min
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = liquidationToken;

        // calculate slippage and set amountOut accordingly
        uint256 amountOut = 0;
        IUniswapV2Router02 router = IUniswapV2Router02(uniswapV2Router);
        (uint112 axeReserve, uint112 tokenReserve) = _getLiquidationReserves();
        amountOut = router.getAmountOut(_amount, axeReserve, tokenReserve);
        amountOut = amountOut - _applyBasisPoints(_slippage, amountOut);

        uint[] memory amounts = router.swapExactTokensForTokens(_amount, amountOut, path, governorTreasury, deadline);
        emit AxeLiquidated(path[1], _amount, amounts[0]);
    }

    /**
     * Withdraws the specified amount of native currency to the treasury. If the amount exceeds the balance,
     * the available balance is transfered.
     * This function is only needed in case anyone sent native tokens by accident to this contract.
     * @param _amount The amount to withdraw
     */
    function withdraw(uint256 _amount) external onlyGovernor returns (uint256 transferAmount) {
        transferAmount = address(this).balance;
        if (transferAmount > 0 && _amount > 0) {
            if (_amount < transferAmount ) {
                transferAmount = _amount;
            }
            payable(governorTreasury).transfer(transferAmount);
            emit NativeWithdrawn(transferAmount);
        }
    }

    /**
     * Withdraws the specified amount of the given token to the treasury. If the amount exceeds the balance,
     * the available balance is transfered.
     * This function is used to withdraw accumulated AXÉ fees, but can also be used to rescue any ERC20 token
     * accidentally sent to this contract.
     * @param _token the token to withdraw from
     * @param _amount the amount to withdraw
     */
    function withdrawToken(address _token, uint256 _amount) external onlyGovernor returns (uint256 transferAmount) {
        IERC20 token = IERC20(_token);
        transferAmount = token.balanceOf(address(this));
        if (transferAmount > 0 && _amount > 0) {
            if (_amount < transferAmount ) {
                transferAmount = _amount;
            }
            token.transfer(governorTreasury, transferAmount);
            emit TokenWithdrawn(_token, transferAmount);
        }
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
                fee = _applyBasisPoints(buyTax, value);
                super._update(from, address(this), fee);
                adjustedValue -= fee;
                emit BuyTaxApplied(value, buyTax, fee, to);
            }
            // SELL
            else if (taxablePairs[to] && sellTax > 0) {
                fee = _applyBasisPoints(sellTax, value);
                super._update(from, address(this), fee);
                adjustedValue -= fee;
                emit SellTaxApplied(value, buyTax, fee, from);
            }
        }
        super._update(from, to, adjustedValue);
    }

    /**
     * Applies the speciied percentage in basis points to the given amount and returns the result.
     * @param basisPoints a fee/tax in basis points
     * @param amount the amount on which to apply the percentage
     */
    function _applyBasisPoints(uint256 basisPoints, uint256 amount) internal pure returns (uint256 result) {
        result = (amount * basisPoints) / (10 ** 4);
    }

    function _canLiquidate() internal view returns (bool success) {
        return uniswapV2Router != address(0) && liquidationPair != address(0) && liquidationToken != address(0);
    }

    /// @dev Sorts the liquidationPair reserves to return AXÉ reserves first.
    function _getLiquidationReserves() internal view returns (uint112, uint112) {
        (uint112 reserve0, uint112 reserve1, ) = IUniswapV2Pair(liquidationPair).getReserves();
        return IUniswapV2Pair(liquidationPair).token0() == address(this) ? (reserve0, reserve1) : (reserve1, reserve0);
    }

    //to receive native tokens
    receive() external payable {}
}

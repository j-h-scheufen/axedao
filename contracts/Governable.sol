// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Context} from '@openzeppelin/contracts/utils/Context.sol';

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an governor) that can be granted exclusive access to
 * specific functions.
 *
 * The initial governor is set to the address provided by the deployer. This can
 * later be changed with {transferGovernorship}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyGovernor`, which can be applied to your functions to restrict their use to
 * the governor.
 */
abstract contract Governable is Context {
    address private _governor;

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error GovernableUnauthorizedAccount(address account);

    /**
     * @dev The governor is not a valid governor account. (eg. `address(0)`)
     */
    error GovernableInvalidGovernor(address governor);

    event GovernorshipTransferred(address indexed previousGovernor, address indexed newGovernor);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial governor.
     */
    constructor(address initialGovernor) {
        if (initialGovernor == address(0)) {
            revert GovernableInvalidGovernor(address(0));
        }
        _transferGovernorship(initialGovernor);
    }

    /**
     * @dev Throws if called by any account other than the governor.
     */
    modifier onlyGovernor() {
        _checkGovernor();
        _;
    }

    /**
     * @dev Returns the address of the current governor.
     */
    function governor() public view virtual returns (address) {
        return _governor;
    }

    /**
     * @dev Throws if the sender is not the governor.
     */
    function _checkGovernor() internal view virtual {
        if (governor() != _msgSender()) {
            revert GovernableUnauthorizedAccount(_msgSender());
        }
    }

    /**
     * @dev Leaves the contract without governor. It will not be possible to call
     * `onlyGovernor` functions. Can only be called by the current governor.
     *
     * NOTE: Renouncing governorship will leave the contract without an governor,
     * thereby disabling any functionality that is only available to the governor.
     */
    // function renounceGovernorship() public virtual onlyGovernor {
    //     _transferGovernorship(address(0));
    // }

    /**
     * @dev Transfers governorship of the contract to a new account (`newGovernor`).
     * Can only be called by the current governor.
     */
    function transferGovernorship(address newGovernor) public virtual onlyGovernor {
        if (newGovernor == address(0)) {
            revert GovernableInvalidGovernor(address(0));
        }
        _transferGovernorship(newGovernor);
    }

    /**
     * @dev Transfers governorship of the contract to a new account (`newGovernor`).
     * Internal function without access restriction.
     */
    function _transferGovernorship(address newGovernor) internal virtual {
        address oldGovernor = _governor;
        _governor = newGovernor;
        emit GovernorshipTransferred(oldGovernor, newGovernor);
    }
}

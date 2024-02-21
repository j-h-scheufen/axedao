// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4 <0.9.0;

interface IXERC20Factory {
  /**
   * @notice Emitted when a new XERC20 is deployed
   */

  event XERC20Deployed(address _xerc20);

  /**
   * @notice Reverts when a non-owner attempts to call
   */

  error IXERC20Factory_NotOwner();

  /**
   * @notice Reverts when a the length of arrays sent is incorrect
   */
  error IXERC20Factory_InvalidLength();

  /**
   * @notice Deploys an XERC20 contract using CREATE3
   * @dev _limits and _minters must be the same length
   * @param _name The name of the token
   * @param _symbol The symbol of the token
   * @param _burnerLimits The array of limits that you are adding (optional, can be an empty array)
   * @param _bridges The array of burners that you are adding (optional, can be an empty array)
   */

  function deployXERC20(
    string memory _name,
    string memory _symbol,
    uint256[] memory _minterLimits,
    uint256[] memory _burnerLimits,
    address[] memory _bridges
  ) external returns (address _xerc20);
}

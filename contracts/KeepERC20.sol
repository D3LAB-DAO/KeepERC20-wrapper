// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "@chainlink/contracts/src/v0.8/AutomationCompatible.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract KeepERC20 is AutomationCompatibleInterface, ERC20, Ownable {
    using SafeERC20 for ERC20;

    IERC20 internal _token;

    constructor(address token_, uint256 updateInterval)
        ERC20(
            string.concat("Keep ", "IERC20Metadata(token_).name()"),
            string.concat("K", IERC20Metadata(token_).symbol())
        )
    {
        _token = IERC20(token_);
    }

    function checkUpkeep(
        bytes calldata /* checkData */
    )
        external
        view
        override
        returns (
            bool upkeepNeeded,
            bytes memory /* performData */
        )
    {
        // upkeepNeeded = (block.timestamp - lastTimeStamp) > interval;
        // // We don't use the checkData in this example. The checkData is defined when the Upkeep was registered.
    }

    function performUpkeep(
        bytes calldata /* performData */
    ) external override {
        // //We highly recommend revalidating the upkeep in the performUpkeep function
        // if ((block.timestamp - lastTimeStamp) > interval) {
        //     lastTimeStamp = block.timestamp;
        //     counter = counter + 1;
        // }
        // // We don't use the performData in this example. The performData is generated by the Automation Node's call to your checkUpkeep function
    }
}

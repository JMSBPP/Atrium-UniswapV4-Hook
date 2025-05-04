// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IOptimalController} from "./IOptimalController.sol";
import "./IFeeStimuliVariable.sol";
interface IFeePriceDiffOptimalController is IOptimalController {
    function getOptimalFeePriceDiffRate() external view returns(FeeStimuliVariable memory)
}

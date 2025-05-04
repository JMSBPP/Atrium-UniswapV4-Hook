// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Fee {
    uint256 fee;
    uint32 timeStamp;
    uint160[] feeStimuliValues;
}

interface IFeeFeed {
    // need to ensure that the sumOfFeeStimuliValues is = 1
    function getLatestFee() external view returns (Fee memory);
    function getRateChange(
        uint8 stimuliVariableFlag
    ) external view returns (uint256 feeStimuliValue);
}

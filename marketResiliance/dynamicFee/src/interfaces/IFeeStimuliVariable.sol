// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct FeeStimuliVariable {
    uint160 value;
    uint32 timeStamp;
}
interface IFeeStimuliVariable {
    function getController(
        uint8 stimuliVariableFlag
    ) external view returns (address);
}

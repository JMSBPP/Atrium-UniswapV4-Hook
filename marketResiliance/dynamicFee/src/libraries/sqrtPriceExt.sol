// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SqrtPriceMath} from "v4-periphery/lib/v4-core/src/libraries/SqrtPriceMath.sol";

struct SqrtPrice {
    uint160 sqrtPrice;
    uint32 timeStamp;
}

library SqrtPriceMathExt {
    using SqrtPriceMath for uint160;

    function getSqrtPricePlusFee(
        uint24 fee
    ) internal pure returns (SqrtPrice memory) {}
}

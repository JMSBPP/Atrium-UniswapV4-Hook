// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct SqrtPrice {
    uint160 sqrtPriceX96;
    uint128 liquidity;
    uint256 amountIn;
    uint256 amountOut;
    uint256 reserve0;
    uint256 reserve1;
    uint32 timeStamp;
    bool isInternal;
}

interface IPriceFeed {
    function getLatestPrice(
        address source
    ) external view returns (SqrtPrice memory);
}

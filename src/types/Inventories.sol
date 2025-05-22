//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {IERC4626} from "forge-std/interfaces/IERC4626.sol";

struct Inventory {
    IERC4626 X;
    IERC4626 Y;
}

library InventoryLib {}

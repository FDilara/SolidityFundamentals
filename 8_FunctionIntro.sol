// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionIntro {
    //Pure function, read only it does not write anything to the blockchain
    function add(uint x, uint y) external pure returns(uint) {
        return x + y;
    }

    function sub(uint z, uint t) external pure returns(uint) {
        return z - t;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFunctions {
    uint public num;

    function viewFunc() external view returns(uint) {
        return num;
    }

    function pureFunc() external pure returns(uint) {
        return 1;
    }

    //"view", because "num" is data on blockchain
    function addToNum(uint x) external view returns(uint) {
        return num + x;
    }

    //"pure", because "a" and "b" are not datas on blockchain
    function add(uint a, uint b) external pure returns(uint) {
        return a + b;
    }
}
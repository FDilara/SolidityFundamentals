// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//require, revert, assert
contract Errors {
    //"Require" is mostly used to validate inputs and for access control
    function testRequire(uint _i) public pure {
        require(_i<=10, "i>10");
        // ... code
    }

    //"Require" --- We can also do the same thing using "revert"
    function testRevert(uint _i) public pure {
        if(_i>10) {
            revert("i>10");
        }
    }

    //"Assert" is used to check for condition that should always be true
    uint public num = 123;
    function testAssert() public view {
        assert(num==123);
    }

    //The longer the error message the more gas it will use
    //We can save gas by using custom error
    error MyError(address caller, uint i);
    function testCustomError(uint _i) public view {
        if(_i>10) {
            revert MyError(msg.sender, _i);
        }
    }

}
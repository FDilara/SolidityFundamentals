// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Functions to inherit be declared as "virtual".
//This keyword virtual will tell this function can be inherited and customized by the child contract.
//"Virtual"
contract A {
    function foo() public pure virtual returns(string memory) {
        return "A";
    }

    function bar() public pure virtual returns(string memory) {
         return "A";
    }

    function baz() public pure returns(string memory) {
         return "A";
    }
}

//The function marked as virtual in the Parent contract is overridden in the Child contract.
//"Override"
contract B is A{
    function foo() public pure override returns(string memory) {
        return "B";
    }

    function bar() public pure virtual override returns(string memory) {
         return "B";
    }
}

contract C is B {
    function bar() public pure override returns(string memory) {
         return "C";
    }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Store data saved on the blockchain
contract StateVariables {
    //state variable
    uint public myUint = 123;

    function foo() external {
        uint notStateVariable = 456; //local variable
        myUint = notStateVariable;
    }
}
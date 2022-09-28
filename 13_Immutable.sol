// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Used for variables that are initialized when the contract is deployed and that we want to define as unchangeable
//Some gas is saved by declaring the state variable as immutable
contract Immutable {
    //45712 gas
    //address public owner = msg.sender; 

    //43579 
    //address public immutable owner = msg.sender; 

    address public immutable owner; 

    uint public x;

    constructor() {
        owner = msg.sender;
    }

    function foo() external {
        require(msg.sender == owner, "only owner");
        x += 1;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Constant keyword saves gas.
//We can see that when we define a state variable as a constant, calling functions that use constants can reduce the gas cost.

//21442 gas
contract Constants {
    //address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //capitalize the variable name
    address public constant MY_ADDRESS = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint public constant MY_UINT = 123;
}

//23553 gas
contract Var {
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}
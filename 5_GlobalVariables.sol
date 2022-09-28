// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GlobalVariables {
    // "view" read only function 
    // View functions can read data from state variables and global variables
    function globalVariables() external view returns(address, uint, uint) {
        //global variables
        address sender = msg.sender; //caller account for this function 
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        return (sender, timestamp, blockNum);
      
    }
}
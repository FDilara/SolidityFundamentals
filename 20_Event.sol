// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Event {
    //Event define
    event Log(string message, uint val);
    //Can be filtered by indexed
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        //Event emitted on blockchain
        emit Log("example", 1234);
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Need to express more choices then enum is a great choice
contract Enum {
    //Represents a shipping status
    enum Status {
        None, 
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    //Can use state variable
    Status public status;

    //Can use inside a struct
    struct Order {
        address buyer;
        Status status;
    }

    Order[] public orders;

    //Read status
    function get() view external returns(Status) {
        return status;
    }

    //Status set
    function set(Status _status) external {
        status = _status;
    }

    //Ship status set
    function ship() external {
        status = Status.Shipped;
    }

    //Default value set
    function reset() external {
        delete status;
    }

}
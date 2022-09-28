// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    //Function executed when a function not found in contract is called
    fallback() external payable {
        emit Log("fallback was called");
    }

    function foo(string memory _message, uint _x) external payable returns(bool, uint) {
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call {
    bytes public data;
    
    //Low level call
    function callFoo(address _testCall) external payable {
        
        //(bool success, bytes memory _data) = _testCall.call(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
        
        //We can enter the value(ether) and gas amount we will send.
        //5000 gas is not enough to execute the function, the call will fail.
        //(bool success, bytes memory _data) = _testCall.call{value: 111, gas: 5000}(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
        
        //Therefore, we will remove this gas sending.
        //We should send 111(wei) ether
        (bool success, bytes memory _data) = _testCall.call{value: 111}(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));

        require(success, "call failed");
        data = _data;
    }

    function callDoesNotExit(address _testCall) external {
        //There is no called function in the called contract, but if there is a fallback function, it will be successful.
        //It will fail if there is no fallback function.
        (bool success, ) = _testCall.call(abi.encodeWithSignature("doesNotExist()"));
        require(success, "call failed");
    }
}
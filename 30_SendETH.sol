// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*3 ways to send ETH
 *"transfer" - 2300 gas - reverts - If the transfer function fails for any reason, the function fails.
 *"send" - 2300 gas - returns bool - Returns a bool value unlike transfer, this indicates whether it was successful
 *"call" - all gas - returns bool and data - Returns two values indicating whether the call was successful
 */

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    //Recommended ether transfer way
    function sendViaCall(address payable _to) external payable {
        (bool success, ) =_to.call{value: 123}("");
        require(success, "call failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}


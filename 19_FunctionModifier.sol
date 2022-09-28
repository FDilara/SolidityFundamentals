// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // "inc()" and "dec()" functions can only be called if the contract is not paused

    modifier whenNotPaused() {
        require(!paused, "paused");
        _; //Returns to the main function from which it was called
    }

    modifier cap(uint _x) {
        require(_x<100, "x>=100");
        _;
    }

    modifier sandwich() {
        count += 10;
        _;  
        count *= 2;
    }

    
    /*function inc() external {
        require(!paused, "paused");
        count += 1;
    }

    function dec() external {
        require(!paused, "paused");
        count -= 1;
    }*/

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    /*function incBy(uint _x) external whenNotPaused {
        require(_x<100, "x>=100");
        count += _x;
    }*/

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    function foo() external sandwich {
        count += 1;
    }


}
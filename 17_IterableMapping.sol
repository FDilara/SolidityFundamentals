// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract IterableMapping {
    // key - value
    mapping(address => uint) public balances; 
    mapping(address => bool) public inserted;
    address[] public keys;

    //Write to mapping
    function set(address _key, uint _val) external {
        balances[_key] = _val;

        if(!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    //Read size of array
    function getSize() external view returns(uint) {
        return keys.length;
    }

    //Reading the value of the first element of the array in the mapping
    function first() external view returns(uint) {
        return balances[keys[0]];
    }

    //Reading the value of the last element of the array in the mapping
    function last() external view returns(uint) {
        return balances[keys[keys.length-1]];
    }

    //Reading the value of the "i"th element of the array in the mapping
    function get(uint _i) external view returns(uint) {
        return balances[keys[_i]];
    }
 }
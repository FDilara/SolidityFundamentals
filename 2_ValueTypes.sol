// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Data types - values and references
contract ValueTypes {
    bool public b = true;

    uint public u = 123; 
    //uint = uint256 0 to 2**256-1
    //uint = uint8 0 to 2**8-1
    //uint = uint16 0 to 2**16-1

    int public i = -123;
    //int = int256 -2**255 to 2**255-1
    //int = int128 -2**127 to 2**127-1

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 public b32 = 0x05416460deb76d57af601be17e777b93592d8d4d4a4096c57876a91c84f4a712;
}
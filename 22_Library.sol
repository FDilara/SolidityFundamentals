// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*Libraries are like contracts with reusable code. 
 *A library has functions that can be called by other contracts.
 *Libraries don't have any storage so can't hold state variables. 
 *The library cannot inherit any element and cannot be inherited. 
 *Libraries can only be used to perform basic operations based on inputs and outputs, not to change the state of the contract.
 *In library functions can be internal, view, pure.
*/

library Math {
    function max(uint x, uint y) internal pure returns(uint) {
        return x >= y ? x : y;
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns(uint) {
        for(uint i=0; i<arr.length; i++) {
            if(arr[i]==x) {
                return i;
            }
        }
        revert("not found");
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns(uint) {
        return Math.max(x,y);
    }
}

contract TestArray {
    //Definition of how to use the Library
    using ArrayLib for uint[];

    uint[] public arr = [3,2,1];

    function testFind() external view returns(uint i) {
        //return ArrayLib.find(arr, 2);
        return arr.find(2);
    }
}
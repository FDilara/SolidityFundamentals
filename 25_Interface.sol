// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*contract Counter {
    uint public count;

    function inc() external {
        count += 1;
    }

    function dec() external {
        count -= 1;
    }
}*/

interface ICounter {
    function count() external view returns(uint);
    function inc() external;
}

/*First we deploy the Counter and then the CallInterface contract. 
 *And when calling "examples" function from CallInterface contract, 
 *we give Counter contract address as parameter.
 */
contract CallInterface {
    uint public count;
    function examples(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*Calling Parent Functions 
 * -direct
 * -super
 */

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    //The first way to call a parent function
    function foo() public virtual override {
        emit Log("F.foo"); 
        E.foo();  //"E.foo"
    }

    //The second way to call a parent function - "super"
    function bar() public virtual override {
        emit Log("F.bar");
        super.bar(); //"E.bar"
    }
}

contract G is E {
    //The first way to call a parent function
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo(); //"E.foo"
    }

    //The second way to call a parent function - "super"
    function bar() public virtual override {
        emit Log("G.bar");
        super.bar(); //"E.bar"
    }
}

contract H is F, G {
    //The first way to call a parent function
    function foo() public override(F, G) {
        F.foo(); 
        // output - "F.foo", "E.foo"
    }

    //The second way to call a parent function - "super"
    function bar() public override(F, G) {
        super.bar();
        // output - "G.bar", "F.bar", "E.bar"
        // all parents
    }
}

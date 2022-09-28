// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Data Locations --- storage, memory and calldata
//"Storage" means that the variable is a state variable
//"Memory" means that the data is loaded onto memory
//"Call Data" is like memory except it can only be used for function inputs
//"Call Data" has the potential to save gas
contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples() external {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        //use "storage" to update data
        //use "memory" to read the data

        //If we want to change the structure, we use storage
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456; //this change will mot be saved
    }

    function examples1(uint[] memory y, string memory s) external returns(uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

    //Call data is not modifiable
    //If we do calldata, it will pass the uint array to the "_internal" function without copying it. This saves gas.
    function examples2(uint[] calldata y, string calldata s) external returns(uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        _internal(y);

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }


}
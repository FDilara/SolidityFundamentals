// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Structs allow you to group data together
contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    //Struct there are three ways to initialize
    function examples() external {
        /***First way***/
        Car memory toyota = Car("Toyota", 1990, msg.sender); 
        /***Second way***/
        Car memory lambo = Car({model: "Lamborghini", year: 1980, owner: msg.sender}); 
        //Car memory lambo = Car({year: 1980, model: "Lamborghini", owner: msg.sender});
        /***Third way***/
        Car memory tesla; //emty --- default values //
        //put data
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));

        /*The memory keyword means that it is stored in memory. No change after function execution*/
        //Car memory _car = cars[0];

        /*Storage keyword means we can update*/
        Car storage _car = cars[0];
        _car.year = 1999;
        delete _car.owner;

        delete cars[1];
    }
}
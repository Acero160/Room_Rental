// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.14;


/*
1. The contract must have an owner who will receive payments when the room is occupied.
2. It should include a structure that defines the two possible states of the hotel room: occupied or vacant.
3. After deployment the contract, the room´s state should be set to vacant.
4. The contract must include a function to occupy and pay for the room. The price will be 1 ether, and it will be 
   transferred directly to the contract owner. If the transaction is successful, an event will be emitted with 
   relevant information.
5. To pay for and occupy a room, it must be vacant.
*/


contract HotelRoom {

    address payable owner;
    enum Status {
        vacant,
        occupied
    }

    Status public currentStatus;


    event Occupy (address _occupant, uint value);

    constructor () {
        owner = payable(msg.sender);
        currentStatus = Status.vacant;
    }


    modifier onlyVacant {
        require(currentStatus == Status.vacant, "The room is occupied");
        _;
    }

    modifier costs (uint amount) {
        require(msg.value >= amount, "Not enough money");
        _;
    }

    function book () public payable onlyVacant costs (1 ether) {
    
        (bool sent, bytes memory data) = owner.call {value: msg.value}("");
        require(sent);
        currentStatus = Status.occupied;

        emit Occupy (msg.sender, msg.value);  


    }
}

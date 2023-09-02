// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    address payable public owner;
    enum Statuses { Vacant, Occupied }
    Statuses[] public roomStatuses;
    mapping(uint => address) public roomToOccupant; // Mapping to store room to occupant

    event Occupy(address _occupant, uint _value, uint _roomNumber);

    constructor(uint256 _numRooms) {
        owner = payable(msg.sender);
        for (uint256 i = 0; i < _numRooms; i++) {
            roomStatuses.push(Statuses.Vacant);
        }
    }

    modifier vacancyTrue(uint _roomNumber) {
        require(_roomNumber < roomStatuses.length, "Invalid room number");
        require(roomStatuses[_roomNumber] == Statuses.Vacant, "No place for you, sorry!");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount, "You are broke!");
        _;
    }

    function book(uint _roomNumber) payable public vacancyTrue(_roomNumber) costs(2 ether) {
        roomStatuses[_roomNumber] = Statuses.Occupied;
        roomToOccupant[_roomNumber] = msg.sender; // Store the occupant's address for the room

        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        emit Occupy(msg.sender, msg.value, _roomNumber);
    }

}

#    Smart-Contracts breakdown

1. Hotel Room Booking Smart Contract
   This Solidity smart contract, HotelRoom, enables users to book hotel rooms on the blockchain. It offers the following features:
   
- Multiple Rooms: The contract allows for the creation of multiple hotel rooms, each with its own status (Vacant or Occupied).
- Booking Functionality: Users can book a vacant room by specifying the room number and sending the required payment in Ether.
- Payment Handling: The contract ensures that users have sufficient Ether to book a room and transfers the payment to the owner of the contract.
- Event Logging: An event (Occupy) is emitted when a room is successfully booked, providing details about the occupant, the payment amount, and the room number.


2. Simple Voting System Smart Contract
The VotingSystem Solidity smart contract enables a straightforward voting process on the blockchain. Key features of this contract include:
- Unique Voting: Each Ethereum address is allowed to cast only one vote, ensuring the integrity of the voting process.
- Vote Counting: The contract maintains separate vote counts for two options, "Option A" and "Option B."
- Voting Functions: Two functions (voteForOptionA and voteForOptionB) allow users to cast their votes for their preferred option.
- Error Handling: The contract includes error handling to prevent duplicate votes from the same address.


3. Funds System 

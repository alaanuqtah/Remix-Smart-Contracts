// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    mapping(address => bool) public hasVoted;
    uint public votesA;
    uint public votesB;

    function voteForOptionA() public {
        require(!hasVoted[msg.sender], "You have already voted.");
        hasVoted[msg.sender] = true;
        votesA++;
    }

    function voteForOptionB() public {
        require(!hasVoted[msg.sender], "You have already voted.");
        hasVoted[msg.sender] = true;
        votesB++;
    }
}

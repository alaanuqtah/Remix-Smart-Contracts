// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PriceConv} from "./PriceConvLib.sol";
//the oracle problem
//decentralized oracle network => chainlink
//chainlink data operator 

contract FundMe{
    using PriceConv for uint256;

    uint256 public minUSD=5e18;
    address[] public funders;
    mapping(address => uint256 ) public addressToFunds;

    function fund() public payable{
        require(msg.value.getConvRate() >=minUSD, "not enough eth");
        funders.push(msg.sender);
        addressToFunds[msg.sender]+= msg.value;
    }
    //function withdraw() public{}
    
}
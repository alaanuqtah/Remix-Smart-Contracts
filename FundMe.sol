// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {PriceConv} from "./PriceConvLib.sol";

error NotOwner();
error CallFailed();
error InsufficientFunds();


contract FundMe{
    using PriceConv for uint256;

    uint256 public constant MIN_USD=5e18; 
    address  public immutable i_owner; 
    address[] public funders;
    mapping(address => uint256 ) public addressToFunds;

    constructor(){
        i_owner=msg.sender;
    }

    function fund() public payable{
        if(msg.value.getConvRate() <MIN_USD){revert InsufficientFunds();}
        funders.push(msg.sender);
        addressToFunds[msg.sender]+= msg.value;
    }

    function withdraw() OwnerAccess public{//transer || send || call
        
        for(uint i=0;i<funders.length;i++){
            addressToFunds[funders[i]]=0;
        }
        funders=new address[](0);
        (bool callSuccess,)=payable(msg.sender).call{value:address(this).balance}("");
        if (!callSuccess){revert CallFailed();}
    }

    modifier OwnerAccess(){
        if(msg.sender != i_owner){revert NotOwner();}
        _;
    }

    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }


    
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConv{
    function getPrice() public view returns(uint){
        //addres: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //abi
        AggregatorV3Interface priceFeed= AggregatorV3Interface( 0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int price,,,)=priceFeed.latestRoundData();
        return uint256(price*1e10); //eth in terms of usd

       
    }
    function getConvRate(uint256 _ethAmount) public view returns(uint256){
        uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd= (ethPrice * _ethAmount)/1e18;
        return ethAmountInUsd;

    }
    function getVersion() public view returns(uint256){
         return AggregatorV3Interface( 0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

    }
}
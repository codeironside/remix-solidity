//Get funds From users
// Withdraw funds
// Set a minimum funding value in USD


//SPDX-License-Identifier:MIT

pragma solidity ^0.8.31;

import { PriceConverter}from "./PriceConverter.sol";

contract FundMe{
using PriceConverter for uint256;
    uint256 public minimumUsd =5e18;
    address[] public founders;
    mapping(address funder=> uint256 funded) public addressToAmountFunded;
    
    
    function fund() public payable {
        
        // allow users tp send money
      
        require(msg.value.getConversionRate() >= minimumUsd, "Didnt send enough eth");
        founders.push(msg.sender);
        addressToAmountFunded[msg.sender]  = addressToAmountFunded[msg.sender] + msg.value;
    }



    // function withdraw()public{

    // }
}
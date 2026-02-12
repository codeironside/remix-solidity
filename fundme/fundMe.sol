//Get funds From users
// Withdraw funds
// Set a minimum funding value in USD


//SPDX-License-Identifier:MIT

pragma solidity ^0.8.31;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minimumUsd =5e18;
    function fund() public payable {
        // allow users tp send money
      
        require(getConversionRate(msg.value) >= minimumUsd, "Didnt send enough eth");
    }


    function getPrice() public  view returns(uint256){
            //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
            AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
            (, int256 price, , , ) = priceFeed.latestRoundData();
            //price of eth in terms of usd
            return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethprice = getPrice();
        uint256 ethAmountInUsd = (ethprice * ethAmount)/1e18;
        return ethAmountInUsd;
    }

    // function withdraw()public{

    // }
}
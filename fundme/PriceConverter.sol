
//SPDX-License-Identifier:MIT

pragma solidity ^0.8.31;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
        function getPrice() internal  view returns(uint256){
            //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
            AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
            (, int256 price, , , ) = priceFeed.latestRoundData();
            //price of eth in terms of usd
            return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethprice = getPrice();
        uint256 ethAmountInUsd = (ethprice * ethAmount)/1e18;
        return ethAmountInUsd;
    }
     function getVersion() internal  view returns(uint256){
        return  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
     }
}
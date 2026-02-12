//SPDX-License-Identifier:MIT

pragma solidity ^0.8.31;


import { SimpleStorage} from "./simpleStorage.sol";


contract ADDFiveStorage is SimpleStorage{
//overrides
//virtual

function  store(uint256 _newNumber) public override{
myFavoriteNumber=_newNumber + 5;
}
}
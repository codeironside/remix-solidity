//SPDX-License-Identifier: MIT



pragma solidity ^0.8.31;

import {SimpleStorage } from "./simpleStorage.sol";

contract StorageFactory{

    // uint256 public favoriteNumber
    // type visibility
    SimpleStorage[]  public listOfSimpleStorageContracts;
    function createSimpleStorageContract() public {
     SimpleStorage newSimpleStorageContract= new SimpleStorage();
     listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        //Address
        //ABI- abpplication binary interface
        SimpleStorage mySimpleStorage= listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
     
    }


    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}
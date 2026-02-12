//SPDX-License-Identifier:MIT

pragma solidity 0.8.31;


contract SimpleStorage{
    uint256 myFavoriteNumber;


    struct Person{
        uint256 favouriteNumber;
        string nme;
    
    
    }
    //dynamic array
    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavouriteNumber;


    function store(uint256 _favouriteNumber)public virtual {
myFavoriteNumber= _favouriteNumber;
    }
    function retrieve () public view returns (uint256){
        return myFavoriteNumber;
    }

    function addPerson (string memory _name, uint _favouriteNumber) public{
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name]= _favouriteNumber;
    }


}
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Arrays {
    uint[] myList;

    function addToArray(uint num) public {
        myList.push(num);
    }

    function getArray() public view returns (uint[] memory) {
        return myList;
    }

    function getArrayLength() public view returns (uint) {
        return myList.length;
    }

    // function removeArray(uint num) public view returns (uint[] memory) {
    
    //     return myList;
    
    // }
}
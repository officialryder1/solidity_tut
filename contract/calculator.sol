// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// Step by Step
// 0. Make a contract called calculator
// 1. Create result variable to store result
// 2. Create function to add, substract, and multiply to reult
// 3. Create a funtion to get result.

contract Calculator {
    // uint256 result = 0;

    function add(uint256 a, uint256 b) public pure returns (uint256)  {
        uint256 result = a + b;
        return  result;
    }

    function substract(uint256 a, uint256 b) public  pure returns (uint256) {
        uint256 result = a - b;
        return result;
    }

    function multiply(uint256 a, uint256 b) public  pure returns (uint256) {
        uint256 result = a * b;
        return result;
    }
}
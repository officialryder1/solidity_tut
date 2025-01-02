// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PausableToken {
    address public owner;
    bool public paused;
    mapping(address => uint256) public balances;

    constructor(){
        owner = msg.sender;
        paused = false;
        balances[owner] = 4000;
    }

    // create a modifier to check if owner
    modifier onlyOwner(){
        require(msg.sender == owner, "not the owner!");
        // The _; tells solidity to run the other functionality if it owner
        _;
    }

    modifier check() {
        require(paused != true, "already paused");
        _;
    }

    function checkPause() public view onlyOwner returns (bool) {
        require(paused == true, "not paused!");

        return paused;
    }

    function pause() public onlyOwner {
        require(paused != true, "Already paused!");
        paused = true;

    }

    function unPause() public onlyOwner {
        require(paused == true, "Not paused!");
        paused = false;

    }

    // Transfer function
    function transfer(address to, uint amount) public check {
        require(balances[msg.sender] >= amount, "not enough balance");

        // send amount to address
        balances[to] += amount;
        balances[msg.sender] -= amount;
    }
 }
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Add an event called  NewUserRegister with 2 args
// user as address type
// username as string


contract EventExample {
    event NewUserRegister(address indexed user, string username);

    struct User {
        string username;
        uint256 age;
    }

    mapping(address => User) public users;

    // register user
    function registerUser(string memory _username, uint256 _age) public {
        User storage newUser = users[msg.sender];
        newUser.username = _username;
        newUser.age = _age;

        // emit event for new user
        emit NewUserRegister(msg.sender,_username);
    }
}
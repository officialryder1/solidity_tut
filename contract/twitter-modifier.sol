// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Add a function called changeTweetLength to change max tweet length. /use newTweetLength as input for function
// Creare a cnstructor function to set owner of contract
// Create a modifier called onlyowner
// use onlyOwner on the changeTweetLength function

contract Twitter {
    address public owner;
    uint public  MAX_TWEET_LENGTH = 230;

    // define struct
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    mapping (address => Tweet[]) public tweets;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "not the owner");
        _;
    }

     function createTweet(string memory _tweet) public {
        
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is to long!");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);
    }

     function getTweets( uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweet(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
    function changeTweetLength(uint newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Add id to Tweet Struct to make every tweet Unique
// Set the id to be the Tweet[] length
// HINT: do it in the createTweet function
// Add a function to like post
// HINT: there should be 2 parameter, id and author
// Add a function to unlike tweet
// HINT: make sure you can unlike only unlike if you likes count is greater than 0
// Mark both function external

contract Twitter {
    address public owner;
    uint public  MAX_TWEET_LENGTH = 230;
    

    // define struct
    struct Tweet {
        uint256 id;
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
            id: tweets[msg.sender].length,
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

    function likeTweet(uint id , address author) external {
        require(tweets[author].length >0, "No tweets to like from author");
        require(tweets[author][id].id == id, " TWEET DOES NOT EXIST");

        tweets[author][id].likes++;
    }

    function unlikeTweet(uint id, address author) external  {
        require(tweets[author][id].likes > 0, "Cannot Unlike");
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");

        tweets[author][id].likes--;
    }
}
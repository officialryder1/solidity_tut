// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Limit the amount of character can be added to a tweet using require characters should be max of 23o character
contract Twitter {
    
    uint16 constant MAX_TWEET_LENGTH = 230;

    // define struct
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    
    // step 2
    // Using struct we replace the string[] with the Tweet we created above
    mapping (address => Tweet[]) public tweets;

    

    function createTweet(string memory _tweet) public {
        // conditional
        // if tweet length <= 230 character, then we are good, otherwise we revert.
        
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is to long!");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

    // step 3
        tweets[msg.sender].push(newTweet);
    }

    // step 4
    function getTweets( uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweet(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}

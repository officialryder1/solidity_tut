// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// 1. Create a twitter contract
// 2. Create a mapping betweeon user and tweet
// 3. Add funtion to create a tweet and save it in mapping
// 4. Create a function to get tweet

// step 1
contract Twitter {
    // using struct to create a datatype kindof for tweet
    // 1. Define a struct with author, content, timestamp, likes
    // 2. Add the struct to the array
    // 3. test tweet

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
    function getTweets(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweet(address _owner) public view returns (Tweet[] memory) {
        return tweets[_owner];
    }
}
// what a mapping in solidity
// mapping is a for an example a hanger that has a cloth where the hanger is the key
// while the cloth it holds is the value
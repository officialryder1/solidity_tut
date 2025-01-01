// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// 1. Create a twitter contract
// 2. Create a mapping betweeon user and tweet
// 3. Add funtion to create a tweet and save it in mapping
// 4. Create a function to get tweet

// step 1
contract Twitter {
    // step 2
    mapping (address => string[]) public tweets;

    // step 3
    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

    // step 4
    function getTweets(address _owner, uint _i) public view returns (string memory) {
        return tweets[_owner][_i];
    }

    function getAllTweet(address _owner) public view returns (string[] memory) {
        return tweets[_owner];
    }
}
// what a mapping in solidity
// mapping is a for an example a hanger that has a cloth where the hanger is the key
// while the cloth it holds is the value
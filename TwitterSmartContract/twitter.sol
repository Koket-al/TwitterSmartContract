
//SD
pragma solidity ^0.8.0;


contract Twitter{

uint256 public Max_length_of_tweet = 280;
    //define struct 

    struct Tweet {
     address author;
     string content;
     uint256 timestamp;
     uint256 likes;
    }
mapping (address => Tweet[]) public tweets;
address public owner;
constructor(){
    owner=msg.sender;
}

modifier onlyTheOwner(){
require (owner==msg.sender , "YOU ARE NOT THE OWNER");
_;
}
function changeeNewTweetLength (uint256 _newTweetLength) public onlyTheOwner{
Max_length_of_tweet=_newTweetLength;
}





function createTweet(string memory _tweet)public {
    require (bytes(_tweet).length <= Max_length_of_tweet , "the tweet is too long bro");
Tweet memory newTweet =Tweet({
    author:msg.sender,
    content: _tweet,
    timestamp: block.timestamp,
    likes:0
});

    tweets[msg.sender].push(newTweet);
}
function getTweet( uint _i)public view returns (Tweet memory){
    return tweets[msg.sender][_i];
}
function getAllTweets() public view returns (Tweet[] memory){
    return tweets[msg.sender];
}
}

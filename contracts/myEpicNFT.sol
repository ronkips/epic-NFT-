// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;
// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
contract myEpicNFT is ERC721URIStorage { 
 // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
using Counters for Counters.Counter;
Counters.Counter private _tokenIds;
 // We need to pass the name of our NFTs token and its symbol.

constructor() ERC721 ("squareNFT", "SQUARE"){
       console.log("This is my NFT contract. crazy!"); 
}
//a function our user will hit to get their NFT
function makeAnEpicNFT() public {  
//get the current tokeId, this starts with 0
uint256 newItemId = _tokenIds.current();
 // Actually mint the NFT to the sender using msg.sender
 _safeMint(msg.sender, newItemId);
 //set the NFT data
 _setTokenURI(newItemId, "https://jsonkeeper.com/b/MBJF");
 console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
 //icrement the counter for when the next NFT is minted
 _tokenIds.increment();
 }
}
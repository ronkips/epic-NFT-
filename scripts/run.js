//const { hexStripZeros } = require("ethers/lib/utils")

 const main = async () => {
    //compile our contract and generate required files we need to work with
const nftContractFactory = await hre.ethers.getContractFactory('myEpicNFT')
//creating a local ethereum network for the contract
const nftContract = await nftContractFactory.deploy();
// contract mined and deployed to our local blockchain
await nftContract.deployed();
console.log("Contract deployed to:", nftContract.address);//address to the deployed contract

//call the function
let txn = await nftContract.makeAnEpicNFT()
//wait for it to be mined.
await txn.wait()

//mint another NFT for fun
txn = await nftContract.makeAnEpicNFT()
// Wait for ir to be mined
await txn.wait()
//mint another NFT for fun
txn = await nftContract.makeAnEpicNFT()
// Wait for ir to be mined
await txn.wait()
 };
const runMain = async () => {
try{
await main();
process.exit(0);
} catch (error){
process.exit(1);}
};
runMain();
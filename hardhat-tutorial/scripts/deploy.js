// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const {ethers} = require("hardhat");
require("dotenv").config({path:".env"});

async function main() {
  const blogContract = await ethers.getContractFactory("Blog");
  const deployedBlogContract = await blogContract.deploy();

  await deployedBlogContract.deployed();

  console.log('BLOG CONTRACT ADDRESS', deployedBlogContract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

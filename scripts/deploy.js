const hre = require("hardhat");

async function main() {

  const Multisig = await hre.ethers.getContractFactory("Multisig");

  const owners = [
    "0xOwnerAddress1",
    "0xOwnerAddress2",
    "0xOwnerAddress3"
  ];

  const required = 2;

  const multisig = await Multisig.deploy(owners, required);

  await multisig.waitForDeployment();

  console.log("Multisig deployed to:", await multisig.getAddress());
}

main();

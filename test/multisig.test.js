const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Multisig Wallet", function () {

  let multisig;
  let owner1, owner2, owner3;

  beforeEach(async function () {

    [owner1, owner2, owner3] = await ethers.getSigners();

    const Multisig = await ethers.getContractFactory("Multisig");

    multisig = await Multisig.deploy(
      [owner1.address, owner2.address, owner3.address],
      2
    );

    await multisig.waitForDeployment();

  });

  it("Should submit transaction", async function () {

    await multisig.submitTransaction(owner1.address, 100);

    const tx = await multisig.transactions(0);

    expect(tx.to).to.equal(owner1.address);

  });

});

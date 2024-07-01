const { expect } = require("chai");
const { ethers } = require("hardhat");

const proof = require("./data/proof.json");

describe("Plonk", function () {
  it("Should return true when proof is correct", async function () {
    const verifier = await ethers.deployContract("GasHelper");
    await verifier.waitForDeployment();

    const view = await verifier.verifyAggregatedProof(proof[0], proof[1], proof[2], proof[3], proof[4]);
    expect(view).to.equal(true);

    const tx = await verifier.verifyAggregatedProofBenchmark(proof[0], proof[1], proof[2], proof[3], proof[4]);
    const res = await tx.wait();
    console.log(`Gas used: ${await verifier.gasUsed()}`);
    // console.log(res);
  });
});

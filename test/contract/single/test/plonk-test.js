const { expect } = require("chai");
const { ethers } = require("hardhat");

const input = require("./data/public.json");
const proof = require("./data/proof.json");

describe("Plonk", function () {
  it("Should return true when proof is correct", async function () {
    const verifier = await ethers.deployContract("GasHelper");
    await verifier.waitForDeployment();

    const view = await verifier.verify_serialized_proof(input, proof);
    expect(view).to.equal(true);

    const tx = await verifier.verify_serialized_proof_benchmark(input, proof);
    const res = await tx.wait();
    console.log(`Gas used: ${await verifier.gasUsed()}`);
    // console.log(res);
  });
});

import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";
import { beforeEach } from "mocha";

const DECIMALS = 10 ** 18;

describe("AXÉ Tests", function () {

  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployAxeTokenFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, addr1, addr2] = await ethers.getSigners();

    const factory = await ethers.getContractFactory("AXE");
    const token = await factory.deploy();
    console.log('Token deployed with name and symbol: ', await token.name(), await token.symbol() );

    return { token, owner, addr1, addr2 };
  }

  describe("Deployment", function () {
    it("Should have no initial supply", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      expect(await token.totalSupply()).to.equal(0);
    });
    it("Should have owner and governor initialized", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      expect(await token.owner()).to.equal(owner);
      expect(await token.governor()).to.equal(owner);
    });
  });

  describe("Issuance", function () {
    it("Governor should be able to issue", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      await token.issue(1000)
      expect( await token.balanceOf(owner)).to.equal(1000);
    });
    it("Non-Governor should not be able to issue", async function () {
      const { token, owner, addr1 } = await loadFixture(deployAxeTokenFixture);
      await expect(token.connect(addr1).issue(1000)).to.be.rejected;
    });
  });

});

import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

const MAX_SUPPLY = 10000000000;

describe("AXÉ Tests", function () {

  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployAxeTokenFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, addr1, addr2] = await ethers.getSigners();

    const factory = await ethers.getContractFactory("AXE");
    const token = await factory.deploy();

    return { token, owner, addr1, addr2 };
  }

  describe("Deployment", function () {
    it("Should have no initial supply and max cap", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      expect(await token.totalSupply()).to.equal(0);
      expect(await token.cap()).to.equal(MAX_SUPPLY);
    });
    it("Should have owner and governor initialized", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      expect(await token.owner()).to.equal(owner);
      expect(await token.governor()).to.equal(owner);
    });
    it("Should have name and symbol set correctly", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      expect(await token.name()).to.equal('Axé');
      expect(await token.symbol()).to.equal('AXÉ');
    });
  });

  describe("Issuance", function () {
    it("Only Governor should be able to issue", async function () {
      const { token, owner, addr1 } = await loadFixture(deployAxeTokenFixture);
      await expect(token.connect(addr1).issue(1000)).to.be.revertedWithCustomError(token, "GovernableUnauthorizedAccount").withArgs(addr1.address);
    });
    it("Governor should be able to issue multiple times", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      await token.issue(1000)
      expect(await token.balanceOf(owner)).to.equal(1000);
      await token.issue(5005)
      expect(await token.balanceOf(owner)).to.equal(6005);
    });
    it("Issuance should not exceed MAX SUPPLY", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      await token.issue(MAX_SUPPLY);
      await expect(token.issue(1)).to.be.revertedWithCustomError(token, "ERC20ExceededCap");
    });
  });

});

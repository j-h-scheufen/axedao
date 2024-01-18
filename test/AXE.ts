
const vwJson = require("@openzeppelin/contracts/build/contracts/VestingWallet.json");

import { loadFixture, time, takeSnapshot } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { Typed } from "ethers";
import { ethers } from "hardhat";

import { AXE } from "./constants";

describe("AXÉ Tests", function () {

  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployAxeTokenFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, addr1, addr2] = await ethers.getSigners();

    const factory = await ethers.getContractFactory("AXE");
    const token = await factory.deploy(owner, owner);

    const vAddress = await token.vestingWallet();
    const vestingWallet = new ethers.Contract(vAddress, vwJson.abi, owner);

    return { token, vestingWallet, owner, addr1, addr2 };
  }

  describe("Deployment", function () {
    it("Should have only vesting amount as initial supply and max cap", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      expect(await token.totalSupply()).to.equal(ethers.parseUnits(AXE.VESTING_AMOUNT.toString()));
      expect(await token.cap()).to.equal(ethers.parseUnits(AXE.MAX_SUPPLY.toString()));
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
      await expect(token.connect(addr1).issue(ethers.parseUnits("1000"))).to.be.revertedWithCustomError(token, "GovernableUnauthorizedAccount").withArgs(addr1.address);
    });
    it("Governor should be able to issue multiple times", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      await token.issue(ethers.parseUnits("1000"))
      expect(await token.balanceOf(owner)).to.equal(ethers.parseUnits("1000"));
      await token.issue(ethers.parseUnits("5005"))
      expect(await token.balanceOf(owner)).to.equal(ethers.parseUnits("6005"));
    });
    it("Issuance should not exceed MAX SUPPLY", async function () {
      const { token, owner } = await loadFixture(deployAxeTokenFixture);
      await token.issue(ethers.parseUnits((AXE.MAX_SUPPLY - AXE.VESTING_AMOUNT).toString()));
      await expect(token.issue(1)).to.be.revertedWithCustomError(token, "ERC20ExceededCap");
    });
  });

  describe("Vesting", function () {
    it("Initial amount should be locked", async function () {
      const { token, vestingWallet, owner } = await loadFixture(deployAxeTokenFixture);
      expect(await token.balanceOf(vestingWallet)).to.be.equal(ethers.parseUnits(AXE.VESTING_AMOUNT.toString()));
    });
    it("Vesting schedule should be working", async function () {
      const { token, vestingWallet, owner } = await loadFixture(deployAxeTokenFixture);
      // use a snapshot to roll back the time jumps
      const snapshot = await takeSnapshot();
      let releasable = await vestingWallet.releasable(Typed.address(token));
      expect(releasable).to.be.equal(0, "Vesting should not have started yet");
      await time.increase(72000)
      await vestingWallet.release(Typed.address(token))
      expect(await token.balanceOf(owner)).to.be.greaterThan(0, "Vesting should have started");
      time.increase(AXE.VESTING_DURATION);
      await vestingWallet.release(Typed.address(token))
      expect(await token.balanceOf(owner)).to.be.equal(ethers.parseUnits(AXE.VESTING_AMOUNT.toString()), "Should have fully vested");
      await snapshot.restore();
    });
  });

});

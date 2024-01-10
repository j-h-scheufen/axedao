const { Contract, ContractFactory, MaxUint256 } = require("ethers");
const factoryJson = require("@uniswap/v2-core/build/UniswapV2Factory.json");
const routerJson = require("@uniswap/v2-periphery/build/UniswapV2Router02.json");
const pairJson = require("@uniswap/v2-periphery/build/IUniswapV2Pair.json");
import { Address } from "@nomicfoundation/ethereumjs-util";
import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { AddressLike } from "ethers";
import { ethers } from "hardhat";

const WETH9 = require("./WETH9.json");

describe("Uniswap Tests", function () {

  async function deployUniswapFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, addr1, addr2] = await ethers.getSigners();

    const factoryContract = new ContractFactory(factoryJson.abi, factoryJson.bytecode, owner);
    const factory = await factoryContract.deploy(owner.address);
    console.log(`Uniswap Factory deployed to ${factory.target}`);
  
    const AXE = await ethers.getContractFactory("AXE", owner);
    const axe = await AXE.deploy();
    console.log(`AXE deployed to ${axe.target}`);

    const DAI = await ethers.getContractFactory("DAI", owner);
    const dai = await DAI.deploy();
    console.log('DAI deployed to', dai.target);

    // Mint some initial supply in both tokens for the owner
    await axe.issue(ethers.parseUnits("1000000"));
    await dai.mint(owner, ethers.parseUnits("1000"));

    const tx1 = await factory.createPair(axe.target, dai.target);
    await tx1.wait();
    const pairAddress = await factory.getPair(axe.target, dai.target);
    console.log(`Pair deployed to ${pairAddress}`);
    const pair = new Contract(pairAddress, pairJson.abi, owner);

    const WETH = new ContractFactory(WETH9.abi, WETH9.bytecode, owner);
    const weth = await WETH.deploy();
    console.log(`WETH deployed to ${weth.target}`);

    const Router = new ContractFactory(
      routerJson.abi,
      routerJson.bytecode,
      owner
    );
    const router = await Router.deploy(factory.target, weth.target);
    console.log(`Router deployed to ${router.target}`);

    const approveTx1 = await axe.approve(router.target, MaxUint256);
    await approveTx1.wait();
    const approvalTx2 = await dai.approve(router.target, MaxUint256);
    await approvalTx2.wait();

    return { owner, router, pair, axe, dai };

  }

  describe("Deployment", function () {
    it("Should have a pool deployed with no liquidity", async function () {
      const { owner, router, pair, axe, dai } = await loadFixture(deployUniswapFixture);
      expect(await axe.totalSupply()).to.equal(ethers.parseUnits("1000000"));
      expect(await dai.totalSupply()).to.equal(ethers.parseUnits("1000"));
      const reserves = await pair.getReserves();
      expect(reserves[0]).to.be.equal(0, 'Token1 pool liquidity should be 0.');
      expect(reserves[1]).to.be.equal(0, 'Token2 pool liquidity should be 0.');
      expect( await axe.allowance(owner, router)).to.be.equal(MaxUint256, "Missing approval for router on AXE");
      expect( await dai.allowance(owner, router)).to.be.equal(MaxUint256, "Missing approval for router on DAI");
    });
  });

  describe("Liquidity & Trading", function () {
    it("Should be able to add liquidity", async function () {
      const { owner, router, pair, axe, dai } = await loadFixture(deployUniswapFixture);

      const axeAmount = ethers.parseUnits("100000");
      const daiAmount = ethers.parseUnits("10");

      const lpTokenBalanceBefore = await pair.balanceOf(owner.address);
      console.log(
        `LP tokens for the owner before: ${lpTokenBalanceBefore.toString()}`
      );

      const deadline = Math.floor(Date.now() / 1000) + 10 * 60; // 10 min
      // const addLiquidityTx = await router
      //   .connect(owner)
      //   .addLiquidity(
      //     axe,
      //     dai,
      //     axeAmount,
      //     daiAmount,
      //     0,
      //     0,
      //     owner,
      //     deadline
      //   );
      // await addLiquidityTx.wait();

      // Check LP token balance for the owner
      const lpTokenBalance = await pair.balanceOf(owner.address);
      console.log(`LP tokens for the owner after: ${lpTokenBalance.toString()}`);

      const reserves = await pair.getReserves();
      console.log(`Reserves: ${reserves[0].toString()}, ${reserves[1].toString()}`);

    });
  });


});

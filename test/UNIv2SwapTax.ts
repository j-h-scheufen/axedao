const { Contract, ContractFactory } = require("ethers");
const factoryJson = require("@uniswap/v2-core/build/UniswapV2Factory.json");
const routerJson = require("@uniswap/v2-periphery/build/UniswapV2Router02.json");
const pairJson = require("@uniswap/v2-periphery/build/IUniswapV2Pair.json");

import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import { AXE } from "./constants";
import { Typed, MaxUint256, AddressLike } from "ethers";

const WETH9 = require("./WETH9.json");
const AXE_MINT = ethers.parseUnits("5000000000");
const DAI_MINT = ethers.parseUnits("1000");

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

    // Mint initial supply in both tokens for the owner
    await axe.issue(AXE_MINT);
    await dai.mint(owner, DAI_MINT);

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
      expect(await axe.totalSupply()).to.be.equal(ethers.parseUnits(AXE.VESTING_AMOUNT.toString()) + AXE_MINT);
      expect(await dai.totalSupply()).to.be.equal(DAI_MINT);
      const reserves = await pair.getReserves();
      expect(reserves[0]).to.be.equal(0, 'Token1 pool liquidity should be 0.');
      expect(reserves[1]).to.be.equal(0, 'Token2 pool liquidity should be 0.');
      expect( await axe.allowance(owner, router)).to.be.equal(MaxUint256, "Missing approval for router on AXE");
      expect( await dai.allowance(owner, router)).to.be.equal(MaxUint256, "Missing approval for router on DAI");
    });
  });

  describe("Liquidity", function () {
    it("Should be able to add liquidity", async function () {
      const { owner, router, pair, axe, dai } = await loadFixture(deployUniswapFixture);
      const axeAmount = ethers.parseUnits("100000");
      const daiAmount = ethers.parseUnits("50");

      expect( await pair.balanceOf(owner.address)).to.be.equal(0, "Owner should have no liquidity")

      await addLiquidity(owner, router, axe, dai, axeAmount, daiAmount);

      const {axeIdx, daiIdx} = await getTokenReserveIndex(pair, axe.target);
      expect( await pair.balanceOf(owner.address)).to.be.greaterThan(0, "Owner should have LP tokens")
      const reserves = await pair.getReserves();
      expect(reserves[axeIdx]).to.be.equal(axeAmount, 'AXE pool liquidity mismatch.');
      expect(reserves[daiIdx]).to.be.equal(daiAmount, 'DAI pool liquidity mismatch.');
    });
    it("Should be able to swap", async function () {
      const { owner, router, pair, axe, dai } = await loadFixture(deployUniswapFixture);
      const axeAmount = ethers.parseUnits("100000000");
      const daiAmount = ethers.parseUnits("500");
      await addLiquidity(owner, router, axe, dai, axeAmount, daiAmount);

      const {axeIdx, daiIdx} = await getTokenReserveIndex(pair, axe.target);
      let reservesBefore = await pair.getReserves();
      await swapTokens(owner, router, dai, axe, ethers.parseUnits("4"))
      let reservesAfter = await pair.getReserves();
      expect(reservesBefore[daiIdx]).to.be.lessThan(reservesAfter[daiIdx]);
      expect(reservesBefore[axeIdx]).to.be.greaterThan(reservesAfter[axeIdx]);

      reservesBefore = reservesAfter;
      await swapTokens(owner, router, axe, dai, ethers.parseUnits("872347"))
      reservesAfter = await pair.getReserves();
      expect(reservesBefore[daiIdx]).to.be.greaterThan(reservesAfter[daiIdx]);
      expect(reservesBefore[axeIdx]).to.be.lessThan(reservesAfter[axeIdx]);
    });

  });

});

const addLiquidity = async (owner: any, router: any, axe: any, dai: any, axeAmount: bigint, daiAmount: bigint): Promise<void> => {
  const deadline = Math.floor(Date.now() / 1000) + 10 * 60; // 10 min
  const addLiquidityTx = await router
    .connect(owner)
    .addLiquidity(
      axe,
      dai,
      axeAmount,
      daiAmount,
      0,
      0,
      owner,
      deadline
    );
  await addLiquidityTx.wait();
}

const swapTokens = async (owner: any, router: any, tokenIn: any, tokenOut: any, amount: bigint ): Promise<void> => {
  const deadline = Math.floor(Date.now() / 1000) + 10 * 60; // 10 min
  const addLiquidityTx = await router
    .connect(owner)
    .swapExactTokensForTokens(
      amount,
      0,
      [tokenIn, tokenOut],
      owner,
      deadline
    );
  await addLiquidityTx.wait();
}

const getTokenReserveIndex = async (pair: { token0: () => any; token1: () => any; }, axeAddress: AddressLike):  Promise<{axeIdx: number, daiIdx: number}> => {
  console.log("AXE", axeAddress);
  const token0Addr = await pair.token0();
  const token1Addr = await pair.token1();
  return token0Addr == axeAddress ? {axeIdx: 0, daiIdx: 1} : {axeIdx: 1, daiIdx: 0};

}

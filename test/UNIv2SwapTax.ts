import factoryJson from '@uniswap/v2-core/build/UniswapV2Factory.json';
import routerJson from '@uniswap/v2-periphery/build/UniswapV2Router02.json';

import { loadFixture } from '@nomicfoundation/hardhat-toolbox/network-helpers';
import { expect } from 'chai';
import { ethers } from 'hardhat';
import { MaxUint256, AddressLike, ZeroAddress } from 'ethers';
import { HardhatEthersSigner } from '@nomicfoundation/hardhat-ethers/signers';

import WETH9 from './WETH9.json';
import { AXE, ERC20, IUniswapV2Factory__factory, IUniswapV2Pair, IUniswapV2Pair__factory, IUniswapV2Router02, IUniswapV2Router02__factory } from '../typechain-types';

const AXE_MINT = ethers.parseUnits('5000000000');
const DAI_MINT = ethers.parseUnits('1000');

describe('Uniswap Tests', function () {

	async function deployAxeLiquidityFixture() {
		const { owner, router, axe, dai, addr1, addr2 } = await deployUniswapFixture();

		// Set up the router and pair
		await axe.setLiquidationRouterAndToken(router.target, dai.target);
		const pair = IUniswapV2Pair__factory.connect(await axe.uniswapV2Pair(), owner);
		// Approve LP spending to remove liquidity
		await approveMaxAllowanceForRouter(owner, pair, router);
		await approveMaxAllowanceForRouter(addr1, pair, router);
		await approveMaxAllowanceForRouter(addr2, pair, router);

		console.log(`Uniswap Pair deployed to ${pair.target}`);

		return { owner, router, pair, axe, dai, addr1, addr2 };
	}

	async function deployUniswapFixture() {

		const [owner, addr1, addr2] = await ethers.getSigners();
		console.log('Users: ', owner.address, addr1.address, addr2.address);

		const FACTORY = new ethers.ContractFactory(factoryJson.abi, factoryJson.bytecode, owner);
		const factoryContract = await FACTORY.deploy(owner);
		const factory = IUniswapV2Factory__factory.connect(factoryContract.target as string, owner);
		console.log(`Uniswap Factory deployed to ${factory.target}`);

		const dai = await ethers.deployContract('DAI');
		console.log('DAI deployed to', dai.target);

		const WETH = new ethers.ContractFactory(WETH9.abi, WETH9.bytecode, owner);
		const weth = await WETH.deploy();

		const Router = new ethers.ContractFactory(routerJson.abi, routerJson.bytecode, owner);
		const routerContract = await Router.deploy(factory.target, weth.target);
		const router = IUniswapV2Router02__factory.connect(routerContract.target as string, owner);
		console.log(`Router deployed to ${routerContract.target}`);

		const axe = await ethers.deployContract('AXE', [owner, owner]);
		await axe.waitForDeployment();
		console.log(`AXE deployed to ${axe.target}`);

		// Mint/Distribute initial supply in both tokens for the owner and other users
		await axe.issue(AXE_MINT);
		await axe.transfer(addr1, ethers.parseUnits('10000000'));
		await axe.transfer(addr2, ethers.parseUnits('10000000'));
		await dai.mint(owner, DAI_MINT);
		await dai.mint(addr1, DAI_MINT);
		await dai.mint(addr2, DAI_MINT);
    
		// Give approvals
		await approveMaxAllowanceForRouter(owner, axe, router);
		await approveMaxAllowanceForRouter(owner, dai, router);
		await approveMaxAllowanceForRouter(addr1, axe, router);
		await approveMaxAllowanceForRouter(addr1, dai, router);
		await approveMaxAllowanceForRouter(addr2, axe, router);
		await approveMaxAllowanceForRouter(addr2, dai, router);

		return { owner, router, axe, dai, addr1, addr2 };

	}

	describe('Initial Deployment', function () {
		it('Should have no router and pool.', async function () {
			const { owner, router, axe, dai } = await loadFixture(deployUniswapFixture);
			expect( await axe.uniswapV2Router()).to.be.equal(ZeroAddress, 'Should have no router');
			expect( await axe.getActiveLiquidityToken()).to.be.equal(ZeroAddress, 'Should have no liquidity token');
			expect( await axe.uniswapV2Pair()).to.be.equal(ZeroAddress, 'Should have no swap pair');
			const pair = await new ethers.Contract(await router.factory(), factoryJson.abi, owner).getPair(axe.target, dai.target);
			expect(pair).to.be.equal(ZeroAddress, 'Should have no pair deployed yet');
		});
	});

	describe('Liquidity Setup', function () {
		it('Should have a pool deployed with no liquidity', async function () {
			const { owner, router, pair, axe, dai } = await loadFixture(deployAxeLiquidityFixture);
			const reserves = await pair.getReserves();
			expect(reserves[0]).to.be.equal(0, 'Token1 pool liquidity should be 0.');
			expect(reserves[1]).to.be.equal(0, 'Token2 pool liquidity should be 0.');
			expect( await axe.allowance(owner, router)).to.be.equal(MaxUint256, 'Missing approval for router on AXE');
			expect( await dai.allowance(owner, router)).to.be.equal(MaxUint256, 'Missing approval for router on DAI');
		});

		it('Should be able to add/remove liquidity', async function () {
			const { owner, router, pair, axe, dai, addr1 } = await loadFixture(deployAxeLiquidityFixture);
			const axeAmount = ethers.parseUnits('100000');
			const daiAmount = ethers.parseUnits('50');

			expect( await pair.balanceOf(owner.address)).to.be.equal(0, 'Owner should have no liquidity');

			await addLiquidity(owner, router, axe, dai, axeAmount, daiAmount);

			const {axeIdx, daiIdx} = await getTokenReserveIndex(pair, axe.target);
			expect( await pair.balanceOf(owner)).to.be.greaterThan(0, 'Owner should have LP tokens');
			const reserves = await pair.getReserves();
			expect(reserves[axeIdx]).to.be.equal(axeAmount, 'AXE pool liquidity mismatch after initial liquidity');
			expect(reserves[daiIdx]).to.be.equal(daiAmount, 'DAI pool liquidity mismatch. after initial liquidity');
			expect( await axe.balanceOf(axe.target)).to.be.equal(0, 'Initial liquidity by owner should not be taxed');

			await addLiquidity(addr1, router, axe, dai, axeAmount, daiAmount);
			expect( await pair.balanceOf(addr1)).to.be.greaterThan(0, 'User1 should have LP tokens');

			let axeFees = await axe.balanceOf(axe.target);
			const priorFees = axeFees;
			expect(axeFees).to.be.greaterThan(0, 'User1\'s addLiquidity should have been taxed');

			const lp1 = await pair.balanceOf(addr1);
			console.log('LP:', lp1);
			await removeLiquidity(addr1, router, axe, dai, lp1);
			expect( await pair.balanceOf(addr1)).to.be.equal(0, 'User1 should have have withdrawn all liquidity');
			axeFees = await axe.balanceOf(axe.target);
			expect(axeFees).to.be.greaterThan(priorFees, 'User1\'s removeLiquidity should have been taxed');
		});

		it('Should be able to swap', async function () {
			const { owner, router, pair, axe, dai, addr1 } = await loadFixture(deployAxeLiquidityFixture);
			const axeAmount = ethers.parseUnits('100000000');
			const daiAmount = ethers.parseUnits('500');
			await addLiquidity(owner, router, axe, dai, axeAmount, daiAmount);

			const {axeIdx, daiIdx} = await getTokenReserveIndex(pair, axe.target);
			let reservesBefore = await pair.getReserves();
			await swapTokens(owner, router, dai, axe, ethers.parseUnits('4'));
			let reservesAfter = await pair.getReserves();
			expect(reservesBefore[daiIdx]).to.be.lessThan(reservesAfter[daiIdx]);
			expect(reservesBefore[axeIdx]).to.be.greaterThan(reservesAfter[axeIdx]);

			reservesBefore = reservesAfter;
			await swapTokens(owner, router, axe, dai, ethers.parseUnits('872347'));
			reservesAfter = await pair.getReserves();
			expect(reservesBefore[daiIdx]).to.be.greaterThan(reservesAfter[daiIdx]);
			expect(reservesBefore[axeIdx]).to.be.lessThan(reservesAfter[axeIdx]);

			let axeFees = await axe.balanceOf(axe.target);
			console.log('AXE fees 0:', axeFees);
			expect(axeFees).to.be.equal(0, 'Governor swapping should not have raised fees');

			reservesBefore = reservesAfter;
			await swapTokens(addr1, router, axe, dai, ethers.parseUnits('500'));
			reservesAfter = await pair.getReserves();
			expect(reservesBefore[daiIdx]).to.be.greaterThan(reservesAfter[daiIdx]);
			expect(reservesBefore[axeIdx]).to.be.lessThan(reservesAfter[axeIdx]);

			axeFees = await axe.balanceOf(axe.target);
			console.log('AXE fees 1:', axeFees);
			expect(axeFees).to.be.greaterThan(0, 'User1 selling AXE should have raised fees');

			reservesBefore = await pair.getReserves();
			console.log('1st Reserves:', reservesBefore);
			await swapTokens(addr1, router, dai, axe, ethers.parseUnits('0.50'));
			reservesAfter = await pair.getReserves();
			expect(reservesBefore[daiIdx]).to.be.lessThan(reservesAfter[daiIdx]);
			expect(reservesBefore[axeIdx]).to.be.greaterThan(reservesAfter[axeIdx]);
			console.log('After Reserves:', reservesAfter);

			axeFees = await axe.balanceOf(axe.target);
			console.log('AXE fees 2:', axeFees);
			expect(axeFees).to.be.greaterThan(0, 'User2 buying AXE should have raised fees');
		});

	});

});

const addLiquidity = async (owner: HardhatEthersSigner, router: IUniswapV2Router02, axe: AXE, dai: ERC20, axeAmount: bigint, daiAmount: bigint): Promise<void> => {
	const deadline = Math.floor(Date.now() / 1000) + 10 * 60; // 10 min
	const tx = await router
		.connect(owner)
		.addLiquidity(
			axe,
			dai,
			axeAmount,
			daiAmount,
			0,
			0,
			owner.address,
			deadline
		);
	await tx.wait();
};

const removeLiquidity = async (owner: HardhatEthersSigner, router: IUniswapV2Router02, axe: AXE, dai: ERC20, liquidity: bigint): Promise<void> => {
	const deadline = Math.floor(Date.now() / 1000) + 10 * 60; // 10 min
	const tx = await router
		.connect(owner)
		.removeLiquidity(
			axe,
			dai,
			liquidity,
			0,
			0,
			owner.address,
			deadline
		);
	await tx.wait();
};

const swapTokens = async (spender: HardhatEthersSigner, router: IUniswapV2Router02, tokenIn: ERC20, tokenOut: ERC20, amount: bigint ): Promise<void> => {
	const deadline = Math.floor(Date.now() / 1000) + 10 * 60; // 10 min
	const tx = await router
		.connect(spender)
		.swapExactTokensForTokensSupportingFeeOnTransferTokens(
			amount,
			0,
			[tokenIn, tokenOut],
			spender.address,
			deadline
		);
	await tx.wait();
};

const getTokenReserveIndex = async (pair: IUniswapV2Pair, axeAddress: AddressLike):  Promise<{axeIdx: number, daiIdx: number}> => {
	const token0Addr = await pair.token0();
	return token0Addr == axeAddress ? {axeIdx: 0, daiIdx: 1} : {axeIdx: 1, daiIdx: 0};
};

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const calculateAfterTaxAmount = (amount: bigint, tax: bigint): bigint => {
	return  amount - (amount * tax / BigInt(10**4));

};

const approveMaxAllowanceForRouter = async (spender: HardhatEthersSigner, token: ERC20, router: IUniswapV2Router02) => {
	const tx = await token.connect(spender).approve(router.target, MaxUint256);
	return tx.wait();
};

# axedao

Notes:

- Consider a FAQ on www
- Make a long-term roadmap:

  - Build open registry and app for Capoeira groups and their members for fair token distribution.
  - Build DAO capabilities to govern together for the good of Capoeira
  - Build badge / NFT system for roles (graduados), events, collections
  - Create revenue streams via liquidity provision
  - Create revenue streams via NFT - AXÉ integration
  - Create revenue streams via services (group management, payments, events, tickets / admission), services could be free in bundle for certain level of yearly DAO contribution (again, something the DAO can set via proposal).

- Keep building base app (start proper coding: utils, state, contract function helpers, errors -> UI)
- Launch website
- Start asking around for more supporters? Dial up outreach
- dao voting functions might be a huge incentive to join (power, inclusion, participation), but really only needed when there's money to spend

Don't Forget:

- Test XERC20.
- Make test for deployed AXE + DAO
  - Make proposals, forward time, process proposal
  -
- use "forge doc" to generate documentation
- check all dependency licenses!!

## Local Development

To be able to use a Hardhat local node that is a fork of a test network with DaoHaus / Moloch / Axé DAO contracts already deployed, the chain ID is set to 1337. The same ID should be configured in Metamask.

See hardhat.config.ts:

```json
  networks: {
    hardhat: {
      chainId: 1337,
      ...
    }
  }
```

In Metamask configure the localhost network:

!['MetaMask Localhost Network Settings'](/docs/images/metamask-localhost-network.png)

## Testing

Start a local node via

```shell
FORK=true npx hardhat node
```

### Unit Tests

Unit tests and Uniswap integration tests are implemented as Hardhat Chai tests and executed via `yarn test` which uses `hardhat compile`.

## Deployment

The deploy scripts are written in Solidity to generate the bytecode which is deployed via the [Create3Factory]('https://github.com/lifinance/create3-factory') available at `0x93FEC2C00BfE902F733B57c5a6CeeD7CD1384AE1` on all chains.

### Pre-Requisites

To avoid exposing the private key of the deployer account, it can be added to Forge's encrypted keystore:

```shell
cast wallet import axe-deployer --interactive
```

### Deploying via Forge

The UX around key-management in Foundry is lacking. For the time being, you MUST specify the public address of the wallet to use via `--sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B`, otherwise the Forge deploy script ignores the `--account` and uses the default
account to `startBroadcast()`! (See https://github.com/foundry-rs/foundry/issues/6034)

#### Requirements

ENV vars need to be available and can be set in front of the command in the commandline or exported:

```shell
export ETHERSCAN_API_KEY=XXXXXXXXXX
export HTTPS_PROVIDER_URL_SEPOLIA=XXXXXXXXXXX
```

Hint: Alternatively to settings ENV vars like `ETHERSCAN_API_KEY` in the shell, set them in your local `.env.local` and export them into a shell session with `export $(grep -v '^#' .env.local | xargs)`. Make sure there is no whitespace in the declarations in the file (`ETHERSCAN_API_KEY=XXX`).

Example how Axé is deployed to a network like Sepolia, if it doesn't exist there, yet:

1. Start a local node that is forked from Sepolia.
   The Axé DAO on Sepolia was created in block 5327951 ([TxReceipt](https://sepolia.etherscan.io/tx/0xc69d904e77106520193ac9821087bb628b923fb3beb0788a70ed444c3f7d61ad))

```shell
anvil --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5352114
```

History:

- Broken AXE version deployed in block 5355124

1. Run the the deploy script against the local node

```shell
forge script scripts/deploy.s.sol:Deploy --rpc-url http://localhost:8545 --account axe-deployer --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B --broadcast -vvv
```

TODO: need a test for deployed Axe verification, e.g. can the DAO make a proposal

3. After verifying local deployment, repeat the deployment against the target network:

```shell
forge script scripts/deploy.s.sol:Deploy --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --account axe-deployer --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B -vvv
```

When all looks good, add the `--broadcast` flag and run for final deployment.

### Contract verification

```shell
forge verify-contract \
--chain-id 11155111 \
--num-of-optimizations 200 \
--constructor-args $(cast abi-encode "constructor(address,address,address)" 0x1c3ac998b698206cd2fb22bb422bf14367470866 0xee2ac838c83e5d6bf6eb1c8a425c007345ace39e 0x6EF543d0Cce1171F696f82cB6f698133037d5b32) \
--etherscan-api-key $ETHERSCAN_API_KEY \
--compiler-version v0.8.23+commit.f704f362 \
--watch \
0x6F03d8D0c9c2660A1D228f1f33cD34a6c47457E3 \
contracts/AXESource.sol:AXESource
```

Forge run script with impersonated account: `--unlocked --from 0x238472397`

```shell
forge test --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5360605 --match-test test_IssueProposal
```

## Useful commands

On a local Anvil node, give the Axé Deployer account some funds from one of the default accounts:

```shell
cast send --rpc-url http://localhost:8545 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B --value 0.5ether --unlocked --from 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

Read the state of proposal no. 3 from the DAO:

```shell
cast call 0x1c3ac998b698206cd2fb22bb422bf14367470866 "state(uint32)" 3 --rpc-url http://localhost:8545
```

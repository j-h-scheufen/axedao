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

- Deploy contracts on Goerli via create3 factory and proposal (need to learn how to do that anyways)
- Keep building base app (start proper coding: utils, state, contract function helpers, errors -> UI)
- Launch website
- Start asking around for more supporters? Dial up outreach
- dao voting functions might be a huge incentive to join (power, inclusion, participation), but really only needed when there's money to spend

Don't Forget:

- Test XERC20
- Verify deployment step https://hardhat.org/hardhat-runner/docs/guides/verifying
- use "forge doc" to generate documentation

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

Example of deploying Axé to Sepolia:

```shell
export ETHERSCAN_API_KEY=XXXXXXXXXX
export HTTPS_PROVIDER_URL_SEPOLIA=XXXXXXXXXXX
forge script scripts/deploy.s.sol:Deploy --fork-url $HTTPS_PROVIDER_URL_SEPOLIA --fork-block-number 5352114 --account axe-deployer --sender 0x7e95A312E398431a26AC266B9215A7DddD5Ea60B --broadcast -vvv
```

Note: Password is only prompted when using `--broadcast`!

Hint: Alternatively to settings ENV vars like `ETHERSCAN_API_KEY` in the shell, set them in your local `.env.local` and export them into a shell session with `export $(grep -v '^#' .env.local | xargs)`.

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

- Deploy contracts on Goerli via proposal (need to learn how to do that anyways)
- Keep building base app (start proper coding: utils, state, contract function helpers, errors -> UI)
- Ask Renee about building registry and op costs
- Launch website
- Start asking around for more supporters? Dial up outreach
- dao voting functions might be a huge incentive to join (power, inclusion, participation), but really only needed when there's money to spend

Don't Forget:

- Make contract deployment use create2
- Implement XERC20
- Verify deployment step https://hardhat.org/hardhat-runner/docs/guides/verifying

## Local Development

To be able to use a Hardhat local node that is a fork of a test network with DaoHaus / Moloch / Axé DAO contracts already deployed, the chain ID is set to 1337. The same ID should be configured in Metamask.

See hardhat.config.ts:

```
  networks: {
    hardhat: {
      chainId: 1337 ...
```

Metamask:
!['MetaMask Localhost Network Settings'](/docs/images/metamask-localhost-network.png)

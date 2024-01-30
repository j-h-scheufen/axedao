## Axé DAO & Token Project

**Smart Contracts and apps for the Axé DAO Community**

## Prerequisites

- **Package Manager**: Yarn (preferred) or NPM
- **Foundry** (not fully used yet, currently optional). See also [here](./Foundry.md).

```shell
$ curl -L https://foundry.paradigm.xyz | bash
$ foundryup
```

## Installation

```shell
$ yarn install
```

## Usage

By default this project uses the Hardhat local network to perform tests or run scripts. A _forking_ network has been
pre-configured (Goerli) that can be activated by prefixing hardhat commands with `FORK=true`.

Example that runs the tests againts the configured forking Hardhat network:

```shell
$ FORK=true npx hardhat test
```

### Test

```shell
$ npx hardhat test
$ forge test
```

### Deploy

```shell
TODO
```

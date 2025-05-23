import {
  createUseReadContract,
  createUseWriteContract,
  createUseSimulateContract,
  createUseWatchContractEvent,
} from 'wagmi/codegen'

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AXE
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const axeAbi = [
  {
    type: 'constructor',
    inputs: [{ name: '_governor', internalType: 'address', type: 'address' }],
    stateMutability: 'nonpayable',
  },
  { type: 'receive', stateMutability: 'payable' },
  {
    type: 'function',
    inputs: [],
    name: 'DOMAIN_SEPARATOR',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'MAX_SUPPLY',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_pair', internalType: 'address', type: 'address' }],
    name: 'addTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'bridges',
    outputs: [
      {
        name: 'minterParams',
        internalType: 'struct IXERC20.BridgeParameters',
        type: 'tuple',
        components: [
          { name: 'timestamp', internalType: 'uint256', type: 'uint256' },
          { name: 'ratePerSecond', internalType: 'uint256', type: 'uint256' },
          { name: 'maxLimit', internalType: 'uint256', type: 'uint256' },
          { name: 'currentLimit', internalType: 'uint256', type: 'uint256' },
        ],
      },
      {
        name: 'burnerParams',
        internalType: 'struct IXERC20.BridgeParameters',
        type: 'tuple',
        components: [
          { name: 'timestamp', internalType: 'uint256', type: 'uint256' },
          { name: 'ratePerSecond', internalType: 'uint256', type: 'uint256' },
          { name: 'maxLimit', internalType: 'uint256', type: 'uint256' },
          { name: 'currentLimit', internalType: 'uint256', type: 'uint256' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_user', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'burn',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'burningCurrentLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'burningMaxLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'buyTax',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'decimals',
    outputs: [{ name: '', internalType: 'uint8', type: 'uint8' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'eip712Domain',
    outputs: [
      { name: 'fields', internalType: 'bytes1', type: 'bytes1' },
      { name: 'name', internalType: 'string', type: 'string' },
      { name: 'version', internalType: 'string', type: 'string' },
      { name: 'chainId', internalType: 'uint256', type: 'uint256' },
      { name: 'verifyingContract', internalType: 'address', type: 'address' },
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
      { name: 'extensions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'governor',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
      { name: '_slippage', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'liquidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'liquidationPair',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'liquidationToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_user', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'mint',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'mintingCurrentLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'mintingMaxLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'nonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'permit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_pair', internalType: 'address', type: 'address' }],
    name: 'removeTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sellTax',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_basisPoints', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setBuyTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_bridge', internalType: 'address', type: 'address' },
      { name: '_mintingLimit', internalType: 'uint256', type: 'uint256' },
      { name: '_burningLimit', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setLimits',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_router', internalType: 'address', type: 'address' },
      { name: '_swapToken', internalType: 'address', type: 'address' },
    ],
    name: 'setLiquidationRouterAndToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_lockbox', internalType: 'address', type: 'address' }],
    name: 'setLockbox',
    outputs: [],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: '_basisPoints', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setSellTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_treasury', internalType: 'address', type: 'address' }],
    name: 'setTreasury',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_newGovernor', internalType: 'address', type: 'address' },
    ],
    name: 'transferGovernorship',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'uniswapV2Router',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_amount', internalType: 'uint256', type: 'uint256' }],
    name: 'withdraw',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_token', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'withdrawToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'axeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'outputAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'AxeLiquidated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'mintingLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'burningLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'bridge',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BridgeLimitsSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BuyTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'BuyTaxChanged',
  },
  { type: 'event', anonymous: false, inputs: [], name: 'EIP712DomainChanged' },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'GovernorshipTransferred',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'router',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LiquidationSettingsChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'lockbox',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LockboxSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'NativeWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'SellTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'SellTaxChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairAdded',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairRemoved',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'token',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'TokenWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TreasuryChanged',
  },
  { type: 'error', inputs: [], name: 'ECDSAInvalidSignature' },
  {
    type: 'error',
    inputs: [{ name: 'length', internalType: 'uint256', type: 'uint256' }],
    name: 'ECDSAInvalidSignatureLength',
  },
  {
    type: 'error',
    inputs: [{ name: 's', internalType: 'bytes32', type: 'bytes32' }],
    name: 'ECDSAInvalidSignatureS',
  },
  {
    type: 'error',
    inputs: [
      { name: 'increasedSupply', internalType: 'uint256', type: 'uint256' },
      { name: 'cap', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20ExceededCap',
  },
  {
    type: 'error',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'allowance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientAllowance',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'spender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSpender',
  },
  {
    type: 'error',
    inputs: [{ name: 'deadline', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC2612ExpiredSignature',
  },
  {
    type: 'error',
    inputs: [
      { name: 'signer', internalType: 'address', type: 'address' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC2612InvalidSigner',
  },
  { type: 'error', inputs: [], name: 'FunctionNotSupported' },
  {
    type: 'error',
    inputs: [{ name: 'governor', internalType: 'address', type: 'address' }],
    name: 'GovernableInvalidGovernor',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'GovernableUnauthorizedAccount',
  },
  { type: 'error', inputs: [], name: 'IXERC20_NotFactory' },
  { type: 'error', inputs: [], name: 'IXERC20_NotHighEnoughLimits' },
  {
    type: 'error',
    inputs: [
      { name: 'account', internalType: 'address', type: 'address' },
      { name: 'currentNonce', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InvalidAccountNonce',
  },
  { type: 'error', inputs: [], name: 'InvalidShortString' },
  {
    type: 'error',
    inputs: [{ name: 'str', internalType: 'string', type: 'string' }],
    name: 'StringTooLong',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AXERC20
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const axerc20Abi = [
  {
    type: 'function',
    inputs: [],
    name: 'DOMAIN_SEPARATOR',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'bridges',
    outputs: [
      {
        name: 'minterParams',
        internalType: 'struct IXERC20.BridgeParameters',
        type: 'tuple',
        components: [
          { name: 'timestamp', internalType: 'uint256', type: 'uint256' },
          { name: 'ratePerSecond', internalType: 'uint256', type: 'uint256' },
          { name: 'maxLimit', internalType: 'uint256', type: 'uint256' },
          { name: 'currentLimit', internalType: 'uint256', type: 'uint256' },
        ],
      },
      {
        name: 'burnerParams',
        internalType: 'struct IXERC20.BridgeParameters',
        type: 'tuple',
        components: [
          { name: 'timestamp', internalType: 'uint256', type: 'uint256' },
          { name: 'ratePerSecond', internalType: 'uint256', type: 'uint256' },
          { name: 'maxLimit', internalType: 'uint256', type: 'uint256' },
          { name: 'currentLimit', internalType: 'uint256', type: 'uint256' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_user', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'burn',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'burningCurrentLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'burningMaxLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'decimals',
    outputs: [{ name: '', internalType: 'uint8', type: 'uint8' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'eip712Domain',
    outputs: [
      { name: 'fields', internalType: 'bytes1', type: 'bytes1' },
      { name: 'name', internalType: 'string', type: 'string' },
      { name: 'version', internalType: 'string', type: 'string' },
      { name: 'chainId', internalType: 'uint256', type: 'uint256' },
      { name: 'verifyingContract', internalType: 'address', type: 'address' },
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
      { name: 'extensions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'governor',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_user', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'mint',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'mintingCurrentLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'mintingMaxLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'nonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'permit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_bridge', internalType: 'address', type: 'address' },
      { name: '_mintingLimit', internalType: 'uint256', type: 'uint256' },
      { name: '_burningLimit', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setLimits',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_lockbox', internalType: 'address', type: 'address' }],
    name: 'setLockbox',
    outputs: [],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_newGovernor', internalType: 'address', type: 'address' },
    ],
    name: 'transferGovernorship',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'mintingLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'burningLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'bridge',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BridgeLimitsSet',
  },
  { type: 'event', anonymous: false, inputs: [], name: 'EIP712DomainChanged' },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'GovernorshipTransferred',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'lockbox',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LockboxSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
  { type: 'error', inputs: [], name: 'ECDSAInvalidSignature' },
  {
    type: 'error',
    inputs: [{ name: 'length', internalType: 'uint256', type: 'uint256' }],
    name: 'ECDSAInvalidSignatureLength',
  },
  {
    type: 'error',
    inputs: [{ name: 's', internalType: 'bytes32', type: 'bytes32' }],
    name: 'ECDSAInvalidSignatureS',
  },
  {
    type: 'error',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'allowance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientAllowance',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'spender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSpender',
  },
  {
    type: 'error',
    inputs: [{ name: 'deadline', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC2612ExpiredSignature',
  },
  {
    type: 'error',
    inputs: [
      { name: 'signer', internalType: 'address', type: 'address' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC2612InvalidSigner',
  },
  { type: 'error', inputs: [], name: 'FunctionNotSupported' },
  {
    type: 'error',
    inputs: [{ name: 'governor', internalType: 'address', type: 'address' }],
    name: 'GovernableInvalidGovernor',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'GovernableUnauthorizedAccount',
  },
  { type: 'error', inputs: [], name: 'IXERC20_NotFactory' },
  { type: 'error', inputs: [], name: 'IXERC20_NotHighEnoughLimits' },
  {
    type: 'error',
    inputs: [
      { name: 'account', internalType: 'address', type: 'address' },
      { name: 'currentNonce', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InvalidAccountNonce',
  },
  { type: 'error', inputs: [], name: 'InvalidShortString' },
  {
    type: 'error',
    inputs: [{ name: 'str', internalType: 'string', type: 'string' }],
    name: 'StringTooLong',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AXESource
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const axeSourceAbi = [
  {
    type: 'constructor',
    inputs: [
      { name: '_governor', internalType: 'address', type: 'address' },
      { name: '_founder', internalType: 'address', type: 'address' },
    ],
    stateMutability: 'nonpayable',
  },
  { type: 'receive', stateMutability: 'payable' },
  {
    type: 'function',
    inputs: [],
    name: 'DOMAIN_SEPARATOR',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'MAX_SUPPLY',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_pair', internalType: 'address', type: 'address' }],
    name: 'addTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'bridges',
    outputs: [
      {
        name: 'minterParams',
        internalType: 'struct IXERC20.BridgeParameters',
        type: 'tuple',
        components: [
          { name: 'timestamp', internalType: 'uint256', type: 'uint256' },
          { name: 'ratePerSecond', internalType: 'uint256', type: 'uint256' },
          { name: 'maxLimit', internalType: 'uint256', type: 'uint256' },
          { name: 'currentLimit', internalType: 'uint256', type: 'uint256' },
        ],
      },
      {
        name: 'burnerParams',
        internalType: 'struct IXERC20.BridgeParameters',
        type: 'tuple',
        components: [
          { name: 'timestamp', internalType: 'uint256', type: 'uint256' },
          { name: 'ratePerSecond', internalType: 'uint256', type: 'uint256' },
          { name: 'maxLimit', internalType: 'uint256', type: 'uint256' },
          { name: 'currentLimit', internalType: 'uint256', type: 'uint256' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_user', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'burn',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'burningCurrentLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'burningMaxLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'buyTax',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'decimals',
    outputs: [{ name: '', internalType: 'uint8', type: 'uint8' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'eip712Domain',
    outputs: [
      { name: 'fields', internalType: 'bytes1', type: 'bytes1' },
      { name: 'name', internalType: 'string', type: 'string' },
      { name: 'version', internalType: 'string', type: 'string' },
      { name: 'chainId', internalType: 'uint256', type: 'uint256' },
      { name: 'verifyingContract', internalType: 'address', type: 'address' },
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
      { name: 'extensions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'governor',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_amount', internalType: 'uint256', type: 'uint256' }],
    name: 'issue',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
      { name: '_slippage', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'liquidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'liquidationPair',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'liquidationToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_user', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'mint',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'mintingCurrentLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_bridge', internalType: 'address', type: 'address' }],
    name: 'mintingMaxLimitOf',
    outputs: [{ name: '_limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'nonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'permit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_pair', internalType: 'address', type: 'address' }],
    name: 'removeTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sellTax',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_basisPoints', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setBuyTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_bridge', internalType: 'address', type: 'address' },
      { name: '_mintingLimit', internalType: 'uint256', type: 'uint256' },
      { name: '_burningLimit', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setLimits',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_router', internalType: 'address', type: 'address' },
      { name: '_swapToken', internalType: 'address', type: 'address' },
    ],
    name: 'setLiquidationRouterAndToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_lockbox', internalType: 'address', type: 'address' }],
    name: 'setLockbox',
    outputs: [],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: '_basisPoints', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setSellTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_treasury', internalType: 'address', type: 'address' }],
    name: 'setTreasury',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_newGovernor', internalType: 'address', type: 'address' },
    ],
    name: 'transferGovernorship',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'uniswapV2Router',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'vestingWallet',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_amount', internalType: 'uint256', type: 'uint256' }],
    name: 'withdraw',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_token', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'withdrawToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'AxeIssued',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'axeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'outputAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'AxeLiquidated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'mintingLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'burningLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'bridge',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BridgeLimitsSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BuyTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'BuyTaxChanged',
  },
  { type: 'event', anonymous: false, inputs: [], name: 'EIP712DomainChanged' },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'GovernorshipTransferred',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'router',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LiquidationSettingsChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'lockbox',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LockboxSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'NativeWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'SellTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'SellTaxChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairAdded',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairRemoved',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'token',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'TokenWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TreasuryChanged',
  },
  { type: 'error', inputs: [], name: 'ECDSAInvalidSignature' },
  {
    type: 'error',
    inputs: [{ name: 'length', internalType: 'uint256', type: 'uint256' }],
    name: 'ECDSAInvalidSignatureLength',
  },
  {
    type: 'error',
    inputs: [{ name: 's', internalType: 'bytes32', type: 'bytes32' }],
    name: 'ECDSAInvalidSignatureS',
  },
  {
    type: 'error',
    inputs: [
      { name: 'increasedSupply', internalType: 'uint256', type: 'uint256' },
      { name: 'cap', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20ExceededCap',
  },
  {
    type: 'error',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'allowance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientAllowance',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'spender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSpender',
  },
  {
    type: 'error',
    inputs: [{ name: 'deadline', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC2612ExpiredSignature',
  },
  {
    type: 'error',
    inputs: [
      { name: 'signer', internalType: 'address', type: 'address' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC2612InvalidSigner',
  },
  { type: 'error', inputs: [], name: 'FunctionNotSupported' },
  {
    type: 'error',
    inputs: [{ name: 'governor', internalType: 'address', type: 'address' }],
    name: 'GovernableInvalidGovernor',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'GovernableUnauthorizedAccount',
  },
  { type: 'error', inputs: [], name: 'IXERC20_NotFactory' },
  { type: 'error', inputs: [], name: 'IXERC20_NotHighEnoughLimits' },
  {
    type: 'error',
    inputs: [
      { name: 'account', internalType: 'address', type: 'address' },
      { name: 'currentNonce', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InvalidAccountNonce',
  },
  { type: 'error', inputs: [], name: 'InvalidShortString' },
  {
    type: 'error',
    inputs: [{ name: 'str', internalType: 'string', type: 'string' }],
    name: 'StringTooLong',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Address
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const addressAbi = [
  {
    type: 'error',
    inputs: [{ name: 'target', internalType: 'address', type: 'address' }],
    name: 'AddressEmptyCode',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AxeMembership
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const axeMembershipAbi = [
  {
    type: 'constructor',
    inputs: [
      { name: '_owner', internalType: 'address', type: 'address' },
      { name: '_donationReceiver', internalType: 'address', type: 'address' },
      { name: '_donationToken', internalType: 'address', type: 'address' },
      { name: '_donationAmount', internalType: 'uint256', type: 'uint256' },
      {
        name: '_nativeDonationAmount',
        internalType: 'uint256',
        type: 'uint256',
      },
      { name: '_baseTokenURI', internalType: 'string', type: 'string' },
    ],
    stateMutability: 'nonpayable',
  },
  { type: 'receive', stateMutability: 'payable' },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'candidates',
    outputs: [
      { name: 'delegationCount', internalType: 'uint248', type: 'uint248' },
      { name: 'available', internalType: 'bool', type: 'bool' },
      { name: 'next', internalType: 'address', type: 'address' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_candidate', internalType: 'address', type: 'address' }],
    name: 'delegate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'delegations',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'donate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'enlistAsCandidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'getApproved',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_candidate', internalType: 'address', type: 'address' }],
    name: 'getCandidate',
    outputs: [
      {
        name: '',
        internalType: 'struct IAxeMembership.Candidate',
        type: 'tuple',
        components: [
          { name: 'delegationCount', internalType: 'uint248', type: 'uint248' },
          { name: 'available', internalType: 'bool', type: 'bool' },
          { name: 'next', internalType: 'address', type: 'address' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_index', internalType: 'uint256', type: 'uint256' }],
    name: 'getDelegationCountForGroupAtIndex',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getMemberCount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_user', internalType: 'address', type: 'address' }],
    name: 'getMemberId',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getNativeDonationAmount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_current', internalType: 'address', type: 'address' }],
    name: 'getNextRankedCandidate',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getNumberOfRankedGroups',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_index', internalType: 'uint256', type: 'uint256' }],
    name: 'getRankedGroupAtIndex',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getTokenDonationAmount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'offset', internalType: 'uint256', type: 'uint256' },
      { name: 'pageSize', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'getTopCandidates',
    outputs: [
      { name: '', internalType: 'address[]', type: 'address[]' },
      { name: '', internalType: 'bool', type: 'bool' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'operator', internalType: 'address', type: 'address' },
    ],
    name: 'isApprovedForAll',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_user', internalType: 'address', type: 'address' }],
    name: 'isMember',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'members',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'owner',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ownerOf',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'renounceOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'resignAsCandidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
    ],
    name: 'setApprovalForAll',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_donationReceiver', internalType: 'address', type: 'address' },
    ],
    name: 'setDonationReceiver',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_donationToken', internalType: 'address', type: 'address' },
    ],
    name: 'setDonationToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      {
        name: '_nativeDonationAmount',
        internalType: 'uint256',
        type: 'uint256',
      },
    ],
    name: 'setNativeDonationAmount',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_donationAmount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setTokenDonationAmount',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'interfaceId', internalType: 'bytes4', type: 'bytes4' }],
    name: 'supportsInterface',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    name: 'tokenURI',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'newOwner', internalType: 'address', type: 'address' }],
    name: 'transferOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'undelegate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'approved',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'operator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      { name: 'approved', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'ApprovalForAll',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'CandidateEnlisted',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'CandidateResigned',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ERC20DonationReceived',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'NativeDonationReceived',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'member',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'memberId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ObrigadoMuitoAxe',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'OwnershipTransferred',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Transfer',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'delegator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'VoteDelegated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'delegator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'VoteUndelegated',
  },
  {
    type: 'error',
    inputs: [{ name: 'member', internalType: 'address', type: 'address' }],
    name: 'AlreadyMemberError',
  },
  { type: 'error', inputs: [], name: 'DonationOptionNotAvailable' },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC721IncorrectOwner',
  },
  {
    type: 'error',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC721InsufficientApproval',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'operator', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOperator',
  },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC721NonexistentToken',
  },
  {
    type: 'error',
    inputs: [
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
      { name: 'requiredAmount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InsufficientDonationError',
  },
  { type: 'error', inputs: [], name: 'NotAMemberError' },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'OwnableInvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'OwnableUnauthorizedAccount',
  },
  { type: 'error', inputs: [], name: 'ReentrancyGuardReentrantCall' },
  {
    type: 'error',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'SafeERC20FailedOperation',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AxeMembershipBase
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const axeMembershipBaseAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'IS_TEST',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeArtifacts',
    outputs: [
      {
        name: 'excludedArtifacts_',
        internalType: 'string[]',
        type: 'string[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeContracts',
    outputs: [
      {
        name: 'excludedContracts_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeSenders',
    outputs: [
      {
        name: 'excludedSenders_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'failed',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetArtifactSelectors',
    outputs: [
      {
        name: 'targetedArtifactSelectors_',
        internalType: 'struct StdInvariant.FuzzSelector[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'selectors', internalType: 'bytes4[]', type: 'bytes4[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetArtifacts',
    outputs: [
      {
        name: 'targetedArtifacts_',
        internalType: 'string[]',
        type: 'string[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetContracts',
    outputs: [
      {
        name: 'targetedContracts_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetInterfaces',
    outputs: [
      {
        name: 'targetedInterfaces_',
        internalType: 'struct StdInvariant.FuzzInterface[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'artifacts', internalType: 'string[]', type: 'string[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetSelectors',
    outputs: [
      {
        name: 'targetedSelectors_',
        internalType: 'struct StdInvariant.FuzzSelector[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'selectors', internalType: 'bytes4[]', type: 'bytes4[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetSenders',
    outputs: [
      {
        name: 'targetedSenders_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'uint256[]',
        type: 'uint256[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'int256[]',
        type: 'int256[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'address[]',
        type: 'address[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_named_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'uint256[]',
        type: 'uint256[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'int256[]',
        type: 'int256[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'address[]',
        type: 'address[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_named_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_named_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_named_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_named_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_named_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'logs',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// AxeMembershipCouncil
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const axeMembershipCouncilAbi = [
  {
    type: 'constructor',
    inputs: [
      { name: '_membership', internalType: 'address', type: 'address' },
      { name: '_owner', internalType: 'address', type: 'address' },
      { name: '_baal', internalType: 'address', type: 'address' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'UPDATE_COOLDOWN',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'baal',
    outputs: [{ name: '', internalType: 'contract IBaal', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'canRequestCouncilUpdate',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_existingSeat', internalType: 'address', type: 'address' },
    ],
    name: 'claimSeat',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'councilLimit',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_index', internalType: 'uint256', type: 'uint256' }],
    name: 'getCouncilMemberAtIndex',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentCouncilSize',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentMembers',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getJoiningMembers',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getLeavingMembers',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_newLimit', internalType: 'uint256', type: 'uint256' }],
    name: 'increaseCouncilLimit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lastFormationRequest',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'membership',
    outputs: [
      { name: '', internalType: 'contract IAxeMembership', type: 'address' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'owner',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'renounceOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'requestCouncilUpdate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'newOwner', internalType: 'address', type: 'address' }],
    name: 'transferOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'newLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'CouncilLimitIncreased',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'currentSize',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'numJoining',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'numLeaving',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'CouncilUpdateRequested',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'OwnershipTransferred',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'replaced',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'SeatClaimed',
  },
  {
    type: 'error',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'InsufficientLoot',
  },
  {
    type: 'error',
    inputs: [{ name: 'member', internalType: 'address', type: 'address' }],
    name: 'InsufficientShares',
  },
  {
    type: 'error',
    inputs: [
      { name: 'minSize', internalType: 'uint256', type: 'uint256' },
      { name: 'requestedSize', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InvalidCouncilLimit',
  },
  {
    type: 'error',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'InvalidSeatClaim',
  },
  {
    type: 'error',
    inputs: [
      { name: 'candidate', internalType: 'address', type: 'address' },
      { name: 'existingSeat', internalType: 'address', type: 'address' },
    ],
    name: 'InvalidSeatReplacement',
  },
  {
    type: 'error',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'OnlyReplacementAllowed',
  },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'OwnableInvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'OwnableUnauthorizedAccount',
  },
  { type: 'error', inputs: [], name: 'ReentrancyGuardReentrantCall' },
  { type: 'error', inputs: [], name: 'UpdateCooldownInEffect' },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Baal
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const baalAbi = [
  { type: 'constructor', inputs: [], stateMutability: 'nonpayable' },
  {
    type: 'error',
    inputs: [{ name: 'guard_', internalType: 'address', type: 'address' }],
    name: 'NotIERC165Compliant',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousAvatar',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newAvatar',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'AvatarSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'proposal',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'CancelProposal',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'guard',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'ChangedGuard',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'voting',
        internalType: 'uint32',
        type: 'uint32',
        indexed: false,
      },
      { name: 'grace', internalType: 'uint32', type: 'uint32', indexed: false },
      {
        name: 'newOffering',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'quorum',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'sponsor',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'minRetention',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'GovernanceConfigSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'version', internalType: 'uint8', type: 'uint8', indexed: false },
    ],
    name: 'Initialized',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'adminLock', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'LockAdmin',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'governorLock',
        internalType: 'bool',
        type: 'bool',
        indexed: false,
      },
    ],
    name: 'LockGovernor',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'managerLock',
        internalType: 'bool',
        type: 'bool',
        indexed: false,
      },
    ],
    name: 'LockManager',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'paused', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'LootPaused',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'OwnershipTransferred',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'proposal',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
      { name: 'passed', internalType: 'bool', type: 'bool', indexed: false },
      {
        name: 'actionFailed',
        internalType: 'bool',
        type: 'bool',
        indexed: false,
      },
    ],
    name: 'ProcessProposal',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'member',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      { name: 'to', internalType: 'address', type: 'address', indexed: false },
      {
        name: 'lootToBurn',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
      {
        name: 'sharesToBurn',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
      {
        name: 'tokens',
        internalType: 'address[]',
        type: 'address[]',
        indexed: false,
      },
    ],
    name: 'Ragequit',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'forwarder',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'SetTrustedForwarder',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'lootPaused',
        internalType: 'bool',
        type: 'bool',
        indexed: false,
      },
      {
        name: 'sharesPaused',
        internalType: 'bool',
        type: 'bool',
        indexed: false,
      },
      {
        name: 'gracePeriod',
        internalType: 'uint32',
        type: 'uint32',
        indexed: false,
      },
      {
        name: 'votingPeriod',
        internalType: 'uint32',
        type: 'uint32',
        indexed: false,
      },
      {
        name: 'proposalOffering',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'quorumPercent',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'sponsorThreshold',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'minRetentionPercent',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      { name: 'name', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'symbol',
        internalType: 'string',
        type: 'string',
        indexed: false,
      },
      {
        name: 'totalShares',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'totalLoot',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'SetupComplete',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'shaman',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'permission',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ShamanSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'paused', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'SharesPaused',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'member',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'proposal',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
      {
        name: 'votingStarts',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'SponsorProposal',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'proposal',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
      {
        name: 'proposalDataHash',
        internalType: 'bytes32',
        type: 'bytes32',
        indexed: true,
      },
      {
        name: 'votingPeriod',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'proposalData',
        internalType: 'bytes',
        type: 'bytes',
        indexed: false,
      },
      {
        name: 'expiration',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'baalGas',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'selfSponsor',
        internalType: 'bool',
        type: 'bool',
        indexed: false,
      },
      {
        name: 'timestamp',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'details',
        internalType: 'string',
        type: 'string',
        indexed: false,
      },
    ],
    name: 'SubmitProposal',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'member',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'balance',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'proposal',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
      { name: 'approved', internalType: 'bool', type: 'bool', indexed: true },
    ],
    name: 'SubmitVote',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousTarget',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newTarget',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'TargetSet',
  },
  {
    type: 'function',
    inputs: [],
    name: 'adminLock',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'avatar',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'burnLoot',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'burnShares',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'cancelProposal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_calls', internalType: 'bytes[]', type: 'bytes[]' },
      { name: '_target', internalType: 'address', type: 'address' },
    ],
    name: 'encodeMultisend',
    outputs: [
      { name: 'encodedMultisend', internalType: 'bytes', type: 'bytes' },
    ],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: '_to', internalType: 'address', type: 'address' },
      { name: '_value', internalType: 'uint256', type: 'uint256' },
      { name: '_data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'executeAsBaal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getGuard',
    outputs: [{ name: '_guard', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'getProposalStatus',
    outputs: [{ name: '', internalType: 'bool[4]', type: 'bool[4]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'governorLock',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'gracePeriod',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'guard',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_transactions', internalType: 'bytes', type: 'bytes' }],
    name: 'hashOperation',
    outputs: [{ name: 'hash', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [{ name: 'shaman', internalType: 'address', type: 'address' }],
    name: 'isAdmin',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'shaman', internalType: 'address', type: 'address' }],
    name: 'isGovernor',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'shaman', internalType: 'address', type: 'address' }],
    name: 'isManager',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'forwarder', internalType: 'address', type: 'address' }],
    name: 'isTrustedForwarder',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'latestSponsoredProposalId',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lockAdmin',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lockGovernor',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lockManager',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lootToken',
    outputs: [
      { name: '', internalType: 'contract IBaalToken', type: 'address' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'managerLock',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '', internalType: 'address', type: 'address' },
      { name: '', internalType: 'uint32', type: 'uint32' },
    ],
    name: 'memberVoted',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'minRetentionPercent',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'mintLoot',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'mintShares',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'multisendLibrary',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'owner',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'id', internalType: 'uint32', type: 'uint32' },
      { name: 'proposalData', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'processProposal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'proposalCount',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'proposalOffering',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    name: 'proposals',
    outputs: [
      { name: 'id', internalType: 'uint32', type: 'uint32' },
      { name: 'prevProposalId', internalType: 'uint32', type: 'uint32' },
      { name: 'votingStarts', internalType: 'uint32', type: 'uint32' },
      { name: 'votingEnds', internalType: 'uint32', type: 'uint32' },
      { name: 'graceEnds', internalType: 'uint32', type: 'uint32' },
      { name: 'expiration', internalType: 'uint32', type: 'uint32' },
      { name: 'baalGas', internalType: 'uint256', type: 'uint256' },
      { name: 'yesVotes', internalType: 'uint256', type: 'uint256' },
      { name: 'noVotes', internalType: 'uint256', type: 'uint256' },
      {
        name: 'maxTotalSharesAndLootAtVote',
        internalType: 'uint256',
        type: 'uint256',
      },
      {
        name: 'maxTotalSharesAtSponsor',
        internalType: 'uint256',
        type: 'uint256',
      },
      { name: 'sponsor', internalType: 'address', type: 'address' },
      { name: 'proposalDataHash', internalType: 'bytes32', type: 'bytes32' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'quorumPercent',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'sharesToBurn', internalType: 'uint256', type: 'uint256' },
      { name: 'lootToBurn', internalType: 'uint256', type: 'uint256' },
      { name: 'tokens', internalType: 'address[]', type: 'address[]' },
    ],
    name: 'ragequit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'renounceOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'pauseShares', internalType: 'bool', type: 'bool' },
      { name: 'pauseLoot', internalType: 'bool', type: 'bool' },
    ],
    name: 'setAdminConfig',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_avatar', internalType: 'address', type: 'address' }],
    name: 'setAvatar',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_governanceConfig', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'setGovernanceConfig',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_guard', internalType: 'address', type: 'address' }],
    name: 'setGuard',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_shamans', internalType: 'address[]', type: 'address[]' },
      { name: '_permissions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'setShamans',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_target', internalType: 'address', type: 'address' }],
    name: 'setTarget',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      {
        name: '_trustedForwarderAddress',
        internalType: 'address',
        type: 'address',
      },
    ],
    name: 'setTrustedForwarder',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: '_initializationParams', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'setUp',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'shamans',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sharesToken',
    outputs: [
      { name: '', internalType: 'contract IBaalToken', type: 'address' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'sponsorProposal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sponsorThreshold',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'state',
    outputs: [
      { name: '', internalType: 'enum Baal.ProposalState', type: 'uint8' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'proposalData', internalType: 'bytes', type: 'bytes' },
      { name: 'expiration', internalType: 'uint32', type: 'uint32' },
      { name: 'baalGas', internalType: 'uint256', type: 'uint256' },
      { name: 'details', internalType: 'string', type: 'string' },
    ],
    name: 'submitProposal',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'id', internalType: 'uint32', type: 'uint32' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
    ],
    name: 'submitVote',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'voter', internalType: 'address', type: 'address' },
      { name: 'expiry', internalType: 'uint256', type: 'uint256' },
      { name: 'nonce', internalType: 'uint256', type: 'uint256' },
      { name: 'id', internalType: 'uint32', type: 'uint32' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'submitVoteWithSig',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'target',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalLoot',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalShares',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'newOwner', internalType: 'address', type: 'address' }],
    name: 'transferOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'trustedForwarder',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'versionRecipient',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'votingNonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'votingPeriod',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
] as const

/**
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const baalAddress = {
  11155111: '0x1c3ac998b698206CD2fb22bb422Bf14367470866',
} as const

/**
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const baalConfig = { address: baalAddress, abi: baalAbi } as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// DSTest
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const dsTestAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'IS_TEST',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'failed',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_named_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_named_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_named_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_named_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_named_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_named_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'logs',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ECDSA
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ecdsaAbi = [
  { type: 'error', inputs: [], name: 'ECDSAInvalidSignature' },
  {
    type: 'error',
    inputs: [{ name: 'length', internalType: 'uint256', type: 'uint256' }],
    name: 'ECDSAInvalidSignatureLength',
  },
  {
    type: 'error',
    inputs: [{ name: 's', internalType: 'bytes32', type: 'bytes32' }],
    name: 'ECDSAInvalidSignatureS',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// EIP712
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const eip712Abi = [
  {
    type: 'function',
    inputs: [],
    name: 'eip712Domain',
    outputs: [
      { name: 'fields', internalType: 'bytes1', type: 'bytes1' },
      { name: 'name', internalType: 'string', type: 'string' },
      { name: 'version', internalType: 'string', type: 'string' },
      { name: 'chainId', internalType: 'uint256', type: 'uint256' },
      { name: 'verifyingContract', internalType: 'address', type: 'address' },
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
      { name: 'extensions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  { type: 'event', anonymous: false, inputs: [], name: 'EIP712DomainChanged' },
  { type: 'error', inputs: [], name: 'InvalidShortString' },
  {
    type: 'error',
    inputs: [{ name: 'str', internalType: 'string', type: 'string' }],
    name: 'StringTooLong',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ERC165
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const erc165Abi = [
  {
    type: 'function',
    inputs: [{ name: 'interfaceId', internalType: 'bytes4', type: 'bytes4' }],
    name: 'supportsInterface',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ERC20
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const erc20Abi = [
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'decimals',
    outputs: [{ name: '', internalType: 'uint8', type: 'uint8' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
  {
    type: 'error',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'allowance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientAllowance',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'spender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSpender',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ERC20Permit
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const erc20PermitAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'DOMAIN_SEPARATOR',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'decimals',
    outputs: [{ name: '', internalType: 'uint8', type: 'uint8' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'eip712Domain',
    outputs: [
      { name: 'fields', internalType: 'bytes1', type: 'bytes1' },
      { name: 'name', internalType: 'string', type: 'string' },
      { name: 'version', internalType: 'string', type: 'string' },
      { name: 'chainId', internalType: 'uint256', type: 'uint256' },
      { name: 'verifyingContract', internalType: 'address', type: 'address' },
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
      { name: 'extensions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'nonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'permit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  { type: 'event', anonymous: false, inputs: [], name: 'EIP712DomainChanged' },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
  { type: 'error', inputs: [], name: 'ECDSAInvalidSignature' },
  {
    type: 'error',
    inputs: [{ name: 'length', internalType: 'uint256', type: 'uint256' }],
    name: 'ECDSAInvalidSignatureLength',
  },
  {
    type: 'error',
    inputs: [{ name: 's', internalType: 'bytes32', type: 'bytes32' }],
    name: 'ECDSAInvalidSignatureS',
  },
  {
    type: 'error',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'allowance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientAllowance',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'spender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSpender',
  },
  {
    type: 'error',
    inputs: [{ name: 'deadline', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC2612ExpiredSignature',
  },
  {
    type: 'error',
    inputs: [
      { name: 'signer', internalType: 'address', type: 'address' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC2612InvalidSigner',
  },
  {
    type: 'error',
    inputs: [
      { name: 'account', internalType: 'address', type: 'address' },
      { name: 'currentNonce', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InvalidAccountNonce',
  },
  { type: 'error', inputs: [], name: 'InvalidShortString' },
  {
    type: 'error',
    inputs: [{ name: 'str', internalType: 'string', type: 'string' }],
    name: 'StringTooLong',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ERC721
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const erc721Abi = [
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'getApproved',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'operator', internalType: 'address', type: 'address' },
    ],
    name: 'isApprovedForAll',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ownerOf',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
    ],
    name: 'setApprovalForAll',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'interfaceId', internalType: 'bytes4', type: 'bytes4' }],
    name: 'supportsInterface',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'tokenURI',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'approved',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'operator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      { name: 'approved', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'ApprovalForAll',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Transfer',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC721IncorrectOwner',
  },
  {
    type: 'error',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC721InsufficientApproval',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'operator', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOperator',
  },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC721NonexistentToken',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Errors
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const errorsAbi = [
  { type: 'error', inputs: [], name: 'FailedCall' },
  { type: 'error', inputs: [], name: 'FailedDeployment' },
  {
    type: 'error',
    inputs: [
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'MissingPrecompile',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Governable
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const governableAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'governor',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '_newGovernor', internalType: 'address', type: 'address' },
    ],
    name: 'transferGovernorship',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newGovernor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'GovernorshipTransferred',
  },
  {
    type: 'error',
    inputs: [{ name: 'governor', internalType: 'address', type: 'address' }],
    name: 'GovernableInvalidGovernor',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'GovernableUnauthorizedAccount',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IAXE
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iaxeAbi = [
  {
    type: 'function',
    inputs: [{ name: 'pair', internalType: 'address', type: 'address' }],
    name: 'addTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
      { name: 'slippage', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'liquidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'pair', internalType: 'address', type: 'address' }],
    name: 'removeTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'basisPoints', internalType: 'uint256', type: 'uint256' }],
    name: 'setBuyTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'router', internalType: 'address', type: 'address' },
      { name: 'swapToken', internalType: 'address', type: 'address' },
    ],
    name: 'setLiquidationRouterAndToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'basisPoints', internalType: 'uint256', type: 'uint256' }],
    name: 'setSellTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'treasury', internalType: 'address', type: 'address' }],
    name: 'setTreasury',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'amount', internalType: 'uint256', type: 'uint256' }],
    name: 'withdraw',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'withdrawToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'axeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'outputAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'AxeLiquidated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BuyTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'BuyTaxChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'router',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LiquidationSettingsChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'NativeWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'SellTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'SellTaxChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairAdded',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairRemoved',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'token',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'TokenWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TreasuryChanged',
  },
  {
    type: 'error',
    inputs: [
      { name: 'increasedSupply', internalType: 'uint256', type: 'uint256' },
      { name: 'cap', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20ExceededCap',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IAXESource
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iaxeSourceAbi = [
  {
    type: 'function',
    inputs: [{ name: 'pair', internalType: 'address', type: 'address' }],
    name: 'addTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'amount', internalType: 'uint256', type: 'uint256' }],
    name: 'issue',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
      { name: 'slippage', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'liquidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'pair', internalType: 'address', type: 'address' }],
    name: 'removeTaxablePair',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'basisPoints', internalType: 'uint256', type: 'uint256' }],
    name: 'setBuyTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'router', internalType: 'address', type: 'address' },
      { name: 'swapToken', internalType: 'address', type: 'address' },
    ],
    name: 'setLiquidationRouterAndToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'basisPoints', internalType: 'uint256', type: 'uint256' }],
    name: 'setSellTax',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'treasury', internalType: 'address', type: 'address' }],
    name: 'setTreasury',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'amount', internalType: 'uint256', type: 'uint256' }],
    name: 'withdraw',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'withdrawToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'AxeIssued',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'axeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'outputAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'AxeLiquidated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BuyTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'BuyTaxChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'router',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'swapToken',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LiquidationSettingsChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'NativeWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'tradeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'basisPoints',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'feeAmount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'SellTaxApplied',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'SellTaxChanged',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairAdded',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TaxablePairRemoved',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'token',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'TokenWithdrawn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'value',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'TreasuryChanged',
  },
  {
    type: 'error',
    inputs: [
      { name: 'increasedSupply', internalType: 'uint256', type: 'uint256' },
      { name: 'cap', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20ExceededCap',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IAxeMembership
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iAxeMembershipAbi = [
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: 'balance', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'delegate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'donate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'enlistAsCandidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'getApproved',
    outputs: [{ name: 'operator', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'getCandidate',
    outputs: [
      {
        name: '',
        internalType: 'struct IAxeMembership.Candidate',
        type: 'tuple',
        components: [
          { name: 'delegationCount', internalType: 'uint248', type: 'uint248' },
          { name: 'available', internalType: 'bool', type: 'bool' },
          { name: 'next', internalType: 'address', type: 'address' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'index', internalType: 'uint256', type: 'uint256' }],
    name: 'getDelegationCountForGroupAtIndex',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getMemberCount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'user', internalType: 'address', type: 'address' }],
    name: 'getMemberId',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getNativeDonationAmount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'getNextRankedCandidate',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getNumberOfRankedGroups',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'index', internalType: 'uint256', type: 'uint256' }],
    name: 'getRankedGroupAtIndex',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getTokenDonationAmount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'offset', internalType: 'uint256', type: 'uint256' },
      { name: 'pageSize', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'getTopCandidates',
    outputs: [
      { name: '', internalType: 'address[]', type: 'address[]' },
      { name: 'hasMore', internalType: 'bool', type: 'bool' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'operator', internalType: 'address', type: 'address' },
    ],
    name: 'isApprovedForAll',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'user', internalType: 'address', type: 'address' }],
    name: 'isMember',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ownerOf',
    outputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'resignAsCandidate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
    ],
    name: 'setApprovalForAll',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'setDonationReceiver',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'setDonationToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'amount', internalType: 'uint256', type: 'uint256' }],
    name: 'setNativeDonationAmount',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'amount', internalType: 'uint256', type: 'uint256' }],
    name: 'setTokenDonationAmount',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'interfaceId', internalType: 'bytes4', type: 'bytes4' }],
    name: 'supportsInterface',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'undelegate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'approved',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'operator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      { name: 'approved', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'ApprovalForAll',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'CandidateEnlisted',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'CandidateResigned',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ERC20DonationReceived',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'NativeDonationReceived',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'member',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'memberId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ObrigadoMuitoAxe',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Transfer',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'delegator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'VoteDelegated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'delegator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'VoteUndelegated',
  },
  {
    type: 'error',
    inputs: [{ name: 'member', internalType: 'address', type: 'address' }],
    name: 'AlreadyMemberError',
  },
  { type: 'error', inputs: [], name: 'DonationOptionNotAvailable' },
  {
    type: 'error',
    inputs: [
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
      { name: 'requiredAmount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InsufficientDonationError',
  },
  { type: 'error', inputs: [], name: 'NotAMemberError' },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IAxeMembershipCouncil
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iAxeMembershipCouncilAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'canRequestCouncilUpdate',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'existingSeat', internalType: 'address', type: 'address' },
    ],
    name: 'claimSeat',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'index', internalType: 'uint256', type: 'uint256' }],
    name: 'getCouncilMemberAtIndex',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentCouncilSize',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentMembers',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getJoiningMembers',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getLeavingMembers',
    outputs: [{ name: '', internalType: 'address[]', type: 'address[]' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'newLimit', internalType: 'uint256', type: 'uint256' }],
    name: 'increaseCouncilLimit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'requestCouncilUpdate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'newLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'CouncilLimitIncreased',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'currentSize',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'numJoining',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'numLeaving',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'CouncilUpdateRequested',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'candidate',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'replaced',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'SeatClaimed',
  },
  {
    type: 'error',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'InsufficientLoot',
  },
  {
    type: 'error',
    inputs: [{ name: 'member', internalType: 'address', type: 'address' }],
    name: 'InsufficientShares',
  },
  {
    type: 'error',
    inputs: [
      { name: 'minSize', internalType: 'uint256', type: 'uint256' },
      { name: 'requestedSize', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InvalidCouncilLimit',
  },
  {
    type: 'error',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'InvalidSeatClaim',
  },
  {
    type: 'error',
    inputs: [
      { name: 'candidate', internalType: 'address', type: 'address' },
      { name: 'existingSeat', internalType: 'address', type: 'address' },
    ],
    name: 'InvalidSeatReplacement',
  },
  {
    type: 'error',
    inputs: [{ name: 'candidate', internalType: 'address', type: 'address' }],
    name: 'OnlyReplacementAllowed',
  },
  { type: 'error', inputs: [], name: 'UpdateCooldownInEffect' },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IBaal
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iBaalAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'adminLock',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'avatar',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'burnLoot',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'burnShares',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'cancelProposal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'calls', internalType: 'bytes[]', type: 'bytes[]' },
      { name: 'target', internalType: 'address', type: 'address' },
    ],
    name: 'encodeMultisend',
    outputs: [{ name: '', internalType: 'bytes', type: 'bytes' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'executeAsBaal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'getProposalStatus',
    outputs: [{ name: '', internalType: 'bool[4]', type: 'bool[4]' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'governorLock',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'gracePeriod',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'transactions', internalType: 'bytes', type: 'bytes' }],
    name: 'hashOperation',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [{ name: 'shaman', internalType: 'address', type: 'address' }],
    name: 'isAdmin',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'shaman', internalType: 'address', type: 'address' }],
    name: 'isGovernor',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'shaman', internalType: 'address', type: 'address' }],
    name: 'isManager',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'latestSponsoredProposalId',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lockAdmin',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lockGovernor',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lockManager',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lootPaused',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'lootToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'managerLock',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'minRetentionPercent',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'mintLoot',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address[]', type: 'address[]' },
      { name: 'amount', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'mintShares',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'multisendLibrary',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'id', internalType: 'uint32', type: 'uint32' },
      { name: 'proposalData', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'processProposal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'proposalCount',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'proposalOffering',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'proposals',
    outputs: [
      {
        name: '',
        internalType: 'struct IBaal.Proposal',
        type: 'tuple',
        components: [
          { name: 'id', internalType: 'uint32', type: 'uint32' },
          { name: 'prevProposalId', internalType: 'uint32', type: 'uint32' },
          { name: 'votingStarts', internalType: 'uint32', type: 'uint32' },
          { name: 'votingEnds', internalType: 'uint32', type: 'uint32' },
          { name: 'graceEnds', internalType: 'uint32', type: 'uint32' },
          { name: 'expiration', internalType: 'uint32', type: 'uint32' },
          { name: 'baalGas', internalType: 'uint256', type: 'uint256' },
          { name: 'yesVotes', internalType: 'uint256', type: 'uint256' },
          { name: 'noVotes', internalType: 'uint256', type: 'uint256' },
          {
            name: 'maxTotalSharesAndLootAtVote',
            internalType: 'uint256',
            type: 'uint256',
          },
          {
            name: 'maxTotalSharesAtSponsor',
            internalType: 'uint256',
            type: 'uint256',
          },
          { name: 'status', internalType: 'bool[4]', type: 'bool[4]' },
          { name: 'sponsor', internalType: 'address', type: 'address' },
          {
            name: 'proposalDataHash',
            internalType: 'bytes32',
            type: 'bytes32',
          },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'quorumPercent',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'sharesToBurn', internalType: 'uint256', type: 'uint256' },
      { name: 'lootToBurn', internalType: 'uint256', type: 'uint256' },
      { name: 'tokens', internalType: 'address[]', type: 'address[]' },
    ],
    name: 'ragequit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'pauseShares', internalType: 'bool', type: 'bool' },
      { name: 'pauseLoot', internalType: 'bool', type: 'bool' },
    ],
    name: 'setAdminConfig',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'avatar', internalType: 'address', type: 'address' }],
    name: 'setAvatar',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'governanceConfig', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'setGovernanceConfig',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'shamans', internalType: 'address[]', type: 'address[]' },
      { name: 'permissions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    name: 'setShamans',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'avatar', internalType: 'address', type: 'address' }],
    name: 'setTarget',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      {
        name: 'trustedForwarderAddress',
        internalType: 'address',
        type: 'address',
      },
    ],
    name: 'setTrustedForwarder',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'initializationParams', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'setUp',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'shaman', internalType: 'address', type: 'address' }],
    name: 'shamans',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sharesPaused',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sharesToken',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'sponsorProposal',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sponsorThreshold',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'id', internalType: 'uint32', type: 'uint32' }],
    name: 'state',
    outputs: [
      { name: '', internalType: 'enum IBaal.ProposalState', type: 'uint8' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'proposalData', internalType: 'bytes', type: 'bytes' },
      { name: 'expiration', internalType: 'uint32', type: 'uint32' },
      { name: 'baalGas', internalType: 'uint256', type: 'uint256' },
      { name: 'details', internalType: 'string', type: 'string' },
    ],
    name: 'submitProposal',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'id', internalType: 'uint32', type: 'uint32' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
    ],
    name: 'submitVote',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'voter', internalType: 'address', type: 'address' },
      { name: 'expiry', internalType: 'uint256', type: 'uint256' },
      { name: 'nonce', internalType: 'uint256', type: 'uint256' },
      { name: 'id', internalType: 'uint32', type: 'uint32' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'submitVoteWithSig',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'target',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalLoot',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalShares',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'trustedForwarder',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'votingPeriod',
    outputs: [{ name: '', internalType: 'uint32', type: 'uint32' }],
    stateMutability: 'view',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ICREATE3Factory
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const icreate3FactoryAbi = [
  {
    type: 'function',
    inputs: [
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
      { name: 'creationCode', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'deploy',
    outputs: [{ name: 'deployed', internalType: 'address', type: 'address' }],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'deployer', internalType: 'address', type: 'address' },
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'getDeployed',
    outputs: [{ name: 'deployed', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC1155Errors
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc1155ErrorsAbi = [
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC1155InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC1155InvalidApprover',
  },
  {
    type: 'error',
    inputs: [
      { name: 'idsLength', internalType: 'uint256', type: 'uint256' },
      { name: 'valuesLength', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC1155InvalidArrayLength',
  },
  {
    type: 'error',
    inputs: [{ name: 'operator', internalType: 'address', type: 'address' }],
    name: 'ERC1155InvalidOperator',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC1155InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC1155InvalidSender',
  },
  {
    type: 'error',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC1155MissingApprovalForAll',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC1363
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc1363Abi = [
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approveAndCall',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'approveAndCall',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'interfaceId', internalType: 'bytes4', type: 'bytes4' }],
    name: 'supportsInterface',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferAndCall',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'transferAndCall',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'transferFromAndCall',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFromAndCall',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC20Errors
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc20ErrorsAbi = [
  {
    type: 'error',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'allowance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientAllowance',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC20InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'spender', internalType: 'address', type: 'address' }],
    name: 'ERC20InvalidSpender',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC20Metadata
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc20MetadataAbi = [
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'decimals',
    outputs: [{ name: '', internalType: 'uint8', type: 'uint8' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC20Permit
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc20PermitAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'DOMAIN_SEPARATOR',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'nonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'permit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC5267
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc5267Abi = [
  {
    type: 'function',
    inputs: [],
    name: 'eip712Domain',
    outputs: [
      { name: 'fields', internalType: 'bytes1', type: 'bytes1' },
      { name: 'name', internalType: 'string', type: 'string' },
      { name: 'version', internalType: 'string', type: 'string' },
      { name: 'chainId', internalType: 'uint256', type: 'uint256' },
      { name: 'verifyingContract', internalType: 'address', type: 'address' },
      { name: 'salt', internalType: 'bytes32', type: 'bytes32' },
      { name: 'extensions', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  { type: 'event', anonymous: false, inputs: [], name: 'EIP712DomainChanged' },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC721Errors
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc721ErrorsAbi = [
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC721IncorrectOwner',
  },
  {
    type: 'error',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC721InsufficientApproval',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'operator', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOperator',
  },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC721NonexistentToken',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC721Metadata
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc721MetadataAbi = [
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: 'balance', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'getApproved',
    outputs: [{ name: 'operator', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'operator', internalType: 'address', type: 'address' },
    ],
    name: 'isApprovedForAll',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ownerOf',
    outputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
    ],
    name: 'setApprovalForAll',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'interfaceId', internalType: 'bytes4', type: 'bytes4' }],
    name: 'supportsInterface',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'tokenURI',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'approved',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'operator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      { name: 'approved', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'ApprovalForAll',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Transfer',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IERC721Receiver
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ierc721ReceiverAbi = [
  {
    type: 'function',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'onERC721Received',
    outputs: [{ name: '', internalType: 'bytes4', type: 'bytes4' }],
    stateMutability: 'nonpayable',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IMulticall3
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iMulticall3Abi = [
  {
    type: 'function',
    inputs: [
      {
        name: 'calls',
        internalType: 'struct IMulticall3.Call[]',
        type: 'tuple[]',
        components: [
          { name: 'target', internalType: 'address', type: 'address' },
          { name: 'callData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    name: 'aggregate',
    outputs: [
      { name: 'blockNumber', internalType: 'uint256', type: 'uint256' },
      { name: 'returnData', internalType: 'bytes[]', type: 'bytes[]' },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      {
        name: 'calls',
        internalType: 'struct IMulticall3.Call3[]',
        type: 'tuple[]',
        components: [
          { name: 'target', internalType: 'address', type: 'address' },
          { name: 'allowFailure', internalType: 'bool', type: 'bool' },
          { name: 'callData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    name: 'aggregate3',
    outputs: [
      {
        name: 'returnData',
        internalType: 'struct IMulticall3.Result[]',
        type: 'tuple[]',
        components: [
          { name: 'success', internalType: 'bool', type: 'bool' },
          { name: 'returnData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      {
        name: 'calls',
        internalType: 'struct IMulticall3.Call3Value[]',
        type: 'tuple[]',
        components: [
          { name: 'target', internalType: 'address', type: 'address' },
          { name: 'allowFailure', internalType: 'bool', type: 'bool' },
          { name: 'value', internalType: 'uint256', type: 'uint256' },
          { name: 'callData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    name: 'aggregate3Value',
    outputs: [
      {
        name: 'returnData',
        internalType: 'struct IMulticall3.Result[]',
        type: 'tuple[]',
        components: [
          { name: 'success', internalType: 'bool', type: 'bool' },
          { name: 'returnData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      {
        name: 'calls',
        internalType: 'struct IMulticall3.Call[]',
        type: 'tuple[]',
        components: [
          { name: 'target', internalType: 'address', type: 'address' },
          { name: 'callData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    name: 'blockAndAggregate',
    outputs: [
      { name: 'blockNumber', internalType: 'uint256', type: 'uint256' },
      { name: 'blockHash', internalType: 'bytes32', type: 'bytes32' },
      {
        name: 'returnData',
        internalType: 'struct IMulticall3.Result[]',
        type: 'tuple[]',
        components: [
          { name: 'success', internalType: 'bool', type: 'bool' },
          { name: 'returnData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getBasefee',
    outputs: [{ name: 'basefee', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'blockNumber', internalType: 'uint256', type: 'uint256' }],
    name: 'getBlockHash',
    outputs: [{ name: 'blockHash', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getBlockNumber',
    outputs: [
      { name: 'blockNumber', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getChainId',
    outputs: [{ name: 'chainid', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentBlockCoinbase',
    outputs: [{ name: 'coinbase', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentBlockDifficulty',
    outputs: [{ name: 'difficulty', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentBlockGasLimit',
    outputs: [{ name: 'gaslimit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getCurrentBlockTimestamp',
    outputs: [{ name: 'timestamp', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'addr', internalType: 'address', type: 'address' }],
    name: 'getEthBalance',
    outputs: [{ name: 'balance', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getLastBlockHash',
    outputs: [{ name: 'blockHash', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'requireSuccess', internalType: 'bool', type: 'bool' },
      {
        name: 'calls',
        internalType: 'struct IMulticall3.Call[]',
        type: 'tuple[]',
        components: [
          { name: 'target', internalType: 'address', type: 'address' },
          { name: 'callData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    name: 'tryAggregate',
    outputs: [
      {
        name: 'returnData',
        internalType: 'struct IMulticall3.Result[]',
        type: 'tuple[]',
        components: [
          { name: 'success', internalType: 'bool', type: 'bool' },
          { name: 'returnData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'requireSuccess', internalType: 'bool', type: 'bool' },
      {
        name: 'calls',
        internalType: 'struct IMulticall3.Call[]',
        type: 'tuple[]',
        components: [
          { name: 'target', internalType: 'address', type: 'address' },
          { name: 'callData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    name: 'tryBlockAndAggregate',
    outputs: [
      { name: 'blockNumber', internalType: 'uint256', type: 'uint256' },
      { name: 'blockHash', internalType: 'bytes32', type: 'bytes32' },
      {
        name: 'returnData',
        internalType: 'struct IMulticall3.Result[]',
        type: 'tuple[]',
        components: [
          { name: 'success', internalType: 'bool', type: 'bool' },
          { name: 'returnData', internalType: 'bytes', type: 'bytes' },
        ],
      },
    ],
    stateMutability: 'payable',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ITreasuryShaman
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iTreasuryShamanAbi = [
  {
    type: 'function',
    inputs: [{ name: 'amount', internalType: 'uint256', type: 'uint256' }],
    name: 'deposit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'newRate', internalType: 'uint256', type: 'uint256' }],
    name: 'setConversionRate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'newToken', internalType: 'address', type: 'address' }],
    name: 'setDepositToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'oldRate',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'newRate',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ConversionRateUpdated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'oldToken',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newToken',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'DepositTokenUpdated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'depositor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'lootMinted',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'TreasuryDepositReceived',
  },
  { type: 'error', inputs: [], name: 'InsufficientDeposit' },
  { type: 'error', inputs: [], name: 'InvalidConversionRate' },
  { type: 'error', inputs: [], name: 'InvalidDepositReceiver' },
  { type: 'error', inputs: [], name: 'InvalidDepositToken' },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IUniswapV2Factory
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iUniswapV2FactoryAbi = [
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    name: 'allPairs',
    outputs: [{ name: 'pair', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'allPairsLength',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
    ],
    name: 'createPair',
    outputs: [{ name: 'pair', internalType: 'address', type: 'address' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'feeTo',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'feeToSetter',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
    ],
    name: 'getPair',
    outputs: [{ name: 'pair', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'setFeeTo',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '', internalType: 'address', type: 'address' }],
    name: 'setFeeToSetter',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'token0',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'token1',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'pair',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
      { name: '', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'PairCreated',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IUniswapV2Pair
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iUniswapV2PairAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'DOMAIN_SEPARATOR',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'MINIMUM_LIQUIDITY',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [],
    name: 'PERMIT_TYPEHASH',
    outputs: [{ name: '', internalType: 'bytes32', type: 'bytes32' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
    ],
    name: 'allowance',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'to', internalType: 'address', type: 'address' }],
    name: 'burn',
    outputs: [
      { name: 'amount0', internalType: 'uint256', type: 'uint256' },
      { name: 'amount1', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'decimals',
    outputs: [{ name: '', internalType: 'uint8', type: 'uint8' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [],
    name: 'factory',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'getReserves',
    outputs: [
      { name: 'reserve0', internalType: 'uint112', type: 'uint112' },
      { name: 'reserve1', internalType: 'uint112', type: 'uint112' },
      { name: 'blockTimestampLast', internalType: 'uint32', type: 'uint32' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: '', internalType: 'address', type: 'address' },
      { name: '', internalType: 'address', type: 'address' },
    ],
    name: 'initialize',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'kLast',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'to', internalType: 'address', type: 'address' }],
    name: 'mint',
    outputs: [{ name: 'liquidity', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'nonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'permit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'price0CumulativeLast',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'price1CumulativeLast',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'to', internalType: 'address', type: 'address' }],
    name: 'skim',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amount0Out', internalType: 'uint256', type: 'uint256' },
      { name: 'amount1Out', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'swap',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [],
    name: 'sync',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'token0',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'token1',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'totalSupply',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transfer',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'spender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'sender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount0',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'amount1',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
    ],
    name: 'Burn',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'sender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount0',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'amount1',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Mint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'sender',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount0In',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'amount1In',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'amount0Out',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'amount1Out',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
    ],
    name: 'Swap',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'reserve0',
        internalType: 'uint112',
        type: 'uint112',
        indexed: false,
      },
      {
        name: 'reserve1',
        internalType: 'uint112',
        type: 'uint112',
        indexed: false,
      },
    ],
    name: 'Sync',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'value',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'Transfer',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IUniswapV2Router01
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iUniswapV2Router01Abi = [
  {
    type: 'function',
    inputs: [],
    name: 'WETH',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
      { name: 'amountADesired', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBDesired', internalType: 'uint256', type: 'uint256' },
      { name: 'amountAMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'addLiquidity',
    outputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'amountB', internalType: 'uint256', type: 'uint256' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'amountTokenDesired', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'addLiquidityETH',
    outputs: [
      { name: 'amountToken', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETH', internalType: 'uint256', type: 'uint256' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'factory',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveIn', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveOut', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'getAmountIn',
    outputs: [{ name: 'amountIn', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveIn', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveOut', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'getAmountOut',
    outputs: [{ name: 'amountOut', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
    ],
    name: 'getAmountsIn',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
    ],
    name: 'getAmountsOut',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveA', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveB', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'quote',
    outputs: [{ name: 'amountB', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountAMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'removeLiquidity',
    outputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'amountB', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'removeLiquidityETH',
    outputs: [
      { name: 'amountToken', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETH', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'approveMax', internalType: 'bool', type: 'bool' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'removeLiquidityETHWithPermit',
    outputs: [
      { name: 'amountToken', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETH', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountAMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'approveMax', internalType: 'bool', type: 'bool' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'removeLiquidityWithPermit',
    outputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'amountB', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapETHForExactTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactETHForTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactTokensForETH',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactTokensForTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'amountInMax', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapTokensForExactETH',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'amountInMax', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapTokensForExactTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IUniswapV2Router02
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const iUniswapV2Router02Abi = [
  {
    type: 'function',
    inputs: [],
    name: 'WETH',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
      { name: 'amountADesired', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBDesired', internalType: 'uint256', type: 'uint256' },
      { name: 'amountAMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'addLiquidity',
    outputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'amountB', internalType: 'uint256', type: 'uint256' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'amountTokenDesired', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'addLiquidityETH',
    outputs: [
      { name: 'amountToken', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETH', internalType: 'uint256', type: 'uint256' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'factory',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveIn', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveOut', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'getAmountIn',
    outputs: [{ name: 'amountIn', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveIn', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveOut', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'getAmountOut',
    outputs: [{ name: 'amountOut', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
    ],
    name: 'getAmountsIn',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
    ],
    name: 'getAmountsOut',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveA', internalType: 'uint256', type: 'uint256' },
      { name: 'reserveB', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'quote',
    outputs: [{ name: 'amountB', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountAMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'removeLiquidity',
    outputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'amountB', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'removeLiquidityETH',
    outputs: [
      { name: 'amountToken', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETH', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'removeLiquidityETHSupportingFeeOnTransferTokens',
    outputs: [{ name: 'amountETH', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'approveMax', internalType: 'bool', type: 'bool' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'removeLiquidityETHWithPermit',
    outputs: [
      { name: 'amountToken', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETH', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountTokenMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountETHMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'approveMax', internalType: 'bool', type: 'bool' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'removeLiquidityETHWithPermitSupportingFeeOnTransferTokens',
    outputs: [{ name: 'amountETH', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'tokenA', internalType: 'address', type: 'address' },
      { name: 'tokenB', internalType: 'address', type: 'address' },
      { name: 'liquidity', internalType: 'uint256', type: 'uint256' },
      { name: 'amountAMin', internalType: 'uint256', type: 'uint256' },
      { name: 'amountBMin', internalType: 'uint256', type: 'uint256' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
      { name: 'approveMax', internalType: 'bool', type: 'bool' },
      { name: 'v', internalType: 'uint8', type: 'uint8' },
      { name: 'r', internalType: 'bytes32', type: 'bytes32' },
      { name: 's', internalType: 'bytes32', type: 'bytes32' },
    ],
    name: 'removeLiquidityWithPermit',
    outputs: [
      { name: 'amountA', internalType: 'uint256', type: 'uint256' },
      { name: 'amountB', internalType: 'uint256', type: 'uint256' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapETHForExactTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactETHForTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactETHForTokensSupportingFeeOnTransferTokens',
    outputs: [],
    stateMutability: 'payable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactTokensForETH',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactTokensForETHSupportingFeeOnTransferTokens',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactTokensForTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountIn', internalType: 'uint256', type: 'uint256' },
      { name: 'amountOutMin', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapExactTokensForTokensSupportingFeeOnTransferTokens',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'amountInMax', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapTokensForExactETH',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'amountOut', internalType: 'uint256', type: 'uint256' },
      { name: 'amountInMax', internalType: 'uint256', type: 'uint256' },
      { name: 'path', internalType: 'address[]', type: 'address[]' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'deadline', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'swapTokensForExactTokens',
    outputs: [
      { name: 'amounts', internalType: 'uint256[]', type: 'uint256[]' },
    ],
    stateMutability: 'nonpayable',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// IXERC20
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ixerc20Abi = [
  {
    type: 'function',
    inputs: [
      { name: 'user', internalType: 'address', type: 'address' },
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'burn',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'bridge', internalType: 'address', type: 'address' }],
    name: 'burningCurrentLimitOf',
    outputs: [{ name: 'limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'bridge', internalType: 'address', type: 'address' }],
    name: 'burningMaxLimitOf',
    outputs: [{ name: 'limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'user', internalType: 'address', type: 'address' },
      { name: 'amount', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'mint',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'minter', internalType: 'address', type: 'address' }],
    name: 'mintingCurrentLimitOf',
    outputs: [{ name: 'limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'minter', internalType: 'address', type: 'address' }],
    name: 'mintingMaxLimitOf',
    outputs: [{ name: 'limit', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'bridge', internalType: 'address', type: 'address' },
      { name: 'mintingLimit', internalType: 'uint256', type: 'uint256' },
      { name: 'burningLimit', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'setLimits',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'lockbox', internalType: 'address', type: 'address' }],
    name: 'setLockbox',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'mintingLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'burningLimit',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'bridge',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'BridgeLimitsSet',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'lockbox',
        internalType: 'address',
        type: 'address',
        indexed: false,
      },
    ],
    name: 'LockboxSet',
  },
  { type: 'error', inputs: [], name: 'IXERC20_NotFactory' },
  { type: 'error', inputs: [], name: 'IXERC20_NotHighEnoughLimits' },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MockNFT
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const mockNftAbi = [
  {
    type: 'constructor',
    inputs: [
      { name: '_receiver', internalType: 'address', type: 'address' },
      { name: '_amount', internalType: 'uint256', type: 'uint256' },
      { name: '_baseTokenURI', internalType: 'string', type: 'string' },
    ],
    stateMutability: 'nonpayable',
  },
  { type: 'receive', stateMutability: 'payable' },
  {
    type: 'function',
    inputs: [
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'approve',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'balanceOf',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'getApproved',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'owner', internalType: 'address', type: 'address' },
      { name: 'operator', internalType: 'address', type: 'address' },
    ],
    name: 'isApprovedForAll',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'name',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ownerOf',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'data', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'safeTransferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'approved', internalType: 'bool', type: 'bool' },
    ],
    name: 'setApprovalForAll',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'interfaceId', internalType: 'bytes4', type: 'bytes4' }],
    name: 'supportsInterface',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'symbol',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'tokenURI',
    outputs: [{ name: '', internalType: 'string', type: 'string' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'from', internalType: 'address', type: 'address' },
      { name: 'to', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'transferFrom',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'approved',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Approval',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'owner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'operator',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      { name: 'approved', internalType: 'bool', type: 'bool', indexed: false },
    ],
    name: 'ApprovalForAll',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'from', internalType: 'address', type: 'address', indexed: true },
      { name: 'to', internalType: 'address', type: 'address', indexed: true },
      {
        name: 'tokenId',
        internalType: 'uint256',
        type: 'uint256',
        indexed: true,
      },
    ],
    name: 'Transfer',
  },
  {
    type: 'error',
    inputs: [
      { name: 'sender', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
      { name: 'owner', internalType: 'address', type: 'address' },
    ],
    name: 'ERC721IncorrectOwner',
  },
  {
    type: 'error',
    inputs: [
      { name: 'operator', internalType: 'address', type: 'address' },
      { name: 'tokenId', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'ERC721InsufficientApproval',
  },
  {
    type: 'error',
    inputs: [{ name: 'approver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidApprover',
  },
  {
    type: 'error',
    inputs: [{ name: 'operator', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOperator',
  },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'receiver', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidReceiver',
  },
  {
    type: 'error',
    inputs: [{ name: 'sender', internalType: 'address', type: 'address' }],
    name: 'ERC721InvalidSender',
  },
  {
    type: 'error',
    inputs: [{ name: 'tokenId', internalType: 'uint256', type: 'uint256' }],
    name: 'ERC721NonexistentToken',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MultiSendProposal
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const multiSendProposalAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'IS_TEST',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'targets', internalType: 'address[]', type: 'address[]' },
      { name: 'values', internalType: 'uint256[]', type: 'uint256[]' },
      { name: 'calldatas', internalType: 'bytes[]', type: 'bytes[]' },
    ],
    name: 'encodeMultiCall',
    outputs: [{ name: '', internalType: 'bytes', type: 'bytes' }],
    stateMutability: 'pure',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeArtifacts',
    outputs: [
      {
        name: 'excludedArtifacts_',
        internalType: 'string[]',
        type: 'string[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeContracts',
    outputs: [
      {
        name: 'excludedContracts_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeSenders',
    outputs: [
      {
        name: 'excludedSenders_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'failed',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetArtifactSelectors',
    outputs: [
      {
        name: 'targetedArtifactSelectors_',
        internalType: 'struct StdInvariant.FuzzSelector[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'selectors', internalType: 'bytes4[]', type: 'bytes4[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetArtifacts',
    outputs: [
      {
        name: 'targetedArtifacts_',
        internalType: 'string[]',
        type: 'string[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetContracts',
    outputs: [
      {
        name: 'targetedContracts_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetInterfaces',
    outputs: [
      {
        name: 'targetedInterfaces_',
        internalType: 'struct StdInvariant.FuzzInterface[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'artifacts', internalType: 'string[]', type: 'string[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetSelectors',
    outputs: [
      {
        name: 'targetedSelectors_',
        internalType: 'struct StdInvariant.FuzzSelector[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'selectors', internalType: 'bytes4[]', type: 'bytes4[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetSenders',
    outputs: [
      {
        name: 'targetedSenders_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'mainTreasury', internalType: 'address', type: 'address' },
      { name: 'secondaryTreasury', internalType: 'address', type: 'address' },
      { name: 'innerMultiSend', internalType: 'bytes', type: 'bytes' },
    ],
    name: 'wrapForCustomTreasury',
    outputs: [{ name: '', internalType: 'bytes', type: 'bytes' }],
    stateMutability: 'pure',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'uint256[]',
        type: 'uint256[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'int256[]',
        type: 'int256[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'address[]',
        type: 'address[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_named_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'uint256[]',
        type: 'uint256[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'int256[]',
        type: 'int256[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'address[]',
        type: 'address[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_named_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_named_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_named_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_named_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_named_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'logs',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Nonces
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const noncesAbi = [
  {
    type: 'function',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'nonces',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'error',
    inputs: [
      { name: 'account', internalType: 'address', type: 'address' },
      { name: 'currentNonce', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InvalidAccountNonce',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Ownable
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const ownableAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'owner',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'renounceOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'newOwner', internalType: 'address', type: 'address' }],
    name: 'transferOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'OwnershipTransferred',
  },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'OwnableInvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'OwnableUnauthorizedAccount',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ReentrancyGuard
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const reentrancyGuardAbi = [
  { type: 'error', inputs: [], name: 'ReentrancyGuardReentrantCall' },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SafeCast
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const safeCastAbi = [
  {
    type: 'error',
    inputs: [
      { name: 'bits', internalType: 'uint8', type: 'uint8' },
      { name: 'value', internalType: 'int256', type: 'int256' },
    ],
    name: 'SafeCastOverflowedIntDowncast',
  },
  {
    type: 'error',
    inputs: [{ name: 'value', internalType: 'int256', type: 'int256' }],
    name: 'SafeCastOverflowedIntToUint',
  },
  {
    type: 'error',
    inputs: [
      { name: 'bits', internalType: 'uint8', type: 'uint8' },
      { name: 'value', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'SafeCastOverflowedUintDowncast',
  },
  {
    type: 'error',
    inputs: [{ name: 'value', internalType: 'uint256', type: 'uint256' }],
    name: 'SafeCastOverflowedUintToInt',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SafeERC20
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const safeErc20Abi = [
  {
    type: 'error',
    inputs: [
      { name: 'spender', internalType: 'address', type: 'address' },
      { name: 'currentAllowance', internalType: 'uint256', type: 'uint256' },
      { name: 'requestedDecrease', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'SafeERC20FailedDecreaseAllowance',
  },
  {
    type: 'error',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'SafeERC20FailedOperation',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ShortStrings
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const shortStringsAbi = [
  { type: 'error', inputs: [], name: 'InvalidShortString' },
  {
    type: 'error',
    inputs: [{ name: 'str', internalType: 'string', type: 'string' }],
    name: 'StringTooLong',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Strings
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const stringsAbi = [
  {
    type: 'error',
    inputs: [
      { name: 'value', internalType: 'uint256', type: 'uint256' },
      { name: 'length', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'StringsInsufficientHexLength',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Test
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const testAbi = [
  {
    type: 'function',
    inputs: [],
    name: 'IS_TEST',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeArtifacts',
    outputs: [
      {
        name: 'excludedArtifacts_',
        internalType: 'string[]',
        type: 'string[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeContracts',
    outputs: [
      {
        name: 'excludedContracts_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'excludeSenders',
    outputs: [
      {
        name: 'excludedSenders_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'failed',
    outputs: [{ name: '', internalType: 'bool', type: 'bool' }],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetArtifactSelectors',
    outputs: [
      {
        name: 'targetedArtifactSelectors_',
        internalType: 'struct StdInvariant.FuzzSelector[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'selectors', internalType: 'bytes4[]', type: 'bytes4[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetArtifacts',
    outputs: [
      {
        name: 'targetedArtifacts_',
        internalType: 'string[]',
        type: 'string[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetContracts',
    outputs: [
      {
        name: 'targetedContracts_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetInterfaces',
    outputs: [
      {
        name: 'targetedInterfaces_',
        internalType: 'struct StdInvariant.FuzzInterface[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'artifacts', internalType: 'string[]', type: 'string[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetSelectors',
    outputs: [
      {
        name: 'targetedSelectors_',
        internalType: 'struct StdInvariant.FuzzSelector[]',
        type: 'tuple[]',
        components: [
          { name: 'addr', internalType: 'address', type: 'address' },
          { name: 'selectors', internalType: 'bytes4[]', type: 'bytes4[]' },
        ],
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'targetSenders',
    outputs: [
      {
        name: 'targetedSenders_',
        internalType: 'address[]',
        type: 'address[]',
      },
    ],
    stateMutability: 'view',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'uint256[]',
        type: 'uint256[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'int256[]',
        type: 'int256[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'val',
        internalType: 'address[]',
        type: 'address[]',
        indexed: false,
      },
    ],
    name: 'log_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'address', type: 'address', indexed: false },
    ],
    name: 'log_named_address',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'uint256[]',
        type: 'uint256[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'int256[]',
        type: 'int256[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      {
        name: 'val',
        internalType: 'address[]',
        type: 'address[]',
        indexed: false,
      },
    ],
    name: 'log_named_array',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'log_named_bytes',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'bytes32', type: 'bytes32', indexed: false },
    ],
    name: 'log_named_bytes32',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
      {
        name: 'decimals',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'log_named_decimal_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'int256', type: 'int256', indexed: false },
    ],
    name: 'log_named_int',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_named_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: 'key', internalType: 'string', type: 'string', indexed: false },
      { name: 'val', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_named_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'string', type: 'string', indexed: false },
    ],
    name: 'log_string',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'uint256', type: 'uint256', indexed: false },
    ],
    name: 'log_uint',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      { name: '', internalType: 'bytes', type: 'bytes', indexed: false },
    ],
    name: 'logs',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// TreasuryShaman
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const treasuryShamanAbi = [
  {
    type: 'constructor',
    inputs: [
      { name: '_baal', internalType: 'address', type: 'address' },
      { name: '_depositToken', internalType: 'address', type: 'address' },
      { name: '_depositReceiver', internalType: 'address', type: 'address' },
      { name: '_owner', internalType: 'address', type: 'address' },
    ],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'baal',
    outputs: [{ name: '', internalType: 'contract IBaal', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'conversionRate',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: '_amount', internalType: 'uint256', type: 'uint256' }],
    name: 'deposit',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'depositReceiver',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'depositToken',
    outputs: [{ name: '', internalType: 'contract IERC20', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'owner',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'renounceOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_newRate', internalType: 'uint256', type: 'uint256' }],
    name: 'setConversionRate',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: '_newToken', internalType: 'address', type: 'address' }],
    name: 'setDepositToken',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'newOwner', internalType: 'address', type: 'address' }],
    name: 'transferOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'oldRate',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'newRate',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ConversionRateUpdated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'oldToken',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newToken',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'DepositTokenUpdated',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'OwnershipTransferred',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'depositor',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
      {
        name: 'lootMinted',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'TreasuryDepositReceived',
  },
  { type: 'error', inputs: [], name: 'InsufficientDeposit' },
  { type: 'error', inputs: [], name: 'InvalidConversionRate' },
  { type: 'error', inputs: [], name: 'InvalidDepositReceiver' },
  { type: 'error', inputs: [], name: 'InvalidDepositToken' },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'OwnableInvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'OwnableUnauthorizedAccount',
  },
  { type: 'error', inputs: [], name: 'ReentrancyGuardReentrantCall' },
  {
    type: 'error',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'SafeERC20FailedOperation',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// VestingWallet
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

export const vestingWalletAbi = [
  {
    type: 'constructor',
    inputs: [
      { name: 'beneficiary', internalType: 'address', type: 'address' },
      { name: 'startTimestamp', internalType: 'uint64', type: 'uint64' },
      { name: 'durationSeconds', internalType: 'uint64', type: 'uint64' },
    ],
    stateMutability: 'payable',
  },
  { type: 'receive', stateMutability: 'payable' },
  {
    type: 'function',
    inputs: [],
    name: 'duration',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'end',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'owner',
    outputs: [{ name: '', internalType: 'address', type: 'address' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'releasable',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'releasable',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'release',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'release',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'released',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'released',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [],
    name: 'renounceOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [],
    name: 'start',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [{ name: 'newOwner', internalType: 'address', type: 'address' }],
    name: 'transferOwnership',
    outputs: [],
    stateMutability: 'nonpayable',
  },
  {
    type: 'function',
    inputs: [{ name: 'timestamp', internalType: 'uint64', type: 'uint64' }],
    name: 'vestedAmount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'function',
    inputs: [
      { name: 'token', internalType: 'address', type: 'address' },
      { name: 'timestamp', internalType: 'uint64', type: 'uint64' },
    ],
    name: 'vestedAmount',
    outputs: [{ name: '', internalType: 'uint256', type: 'uint256' }],
    stateMutability: 'view',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'token',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'ERC20Released',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'amount',
        internalType: 'uint256',
        type: 'uint256',
        indexed: false,
      },
    ],
    name: 'EtherReleased',
  },
  {
    type: 'event',
    anonymous: false,
    inputs: [
      {
        name: 'previousOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
      {
        name: 'newOwner',
        internalType: 'address',
        type: 'address',
        indexed: true,
      },
    ],
    name: 'OwnershipTransferred',
  },
  { type: 'error', inputs: [], name: 'FailedCall' },
  {
    type: 'error',
    inputs: [
      { name: 'balance', internalType: 'uint256', type: 'uint256' },
      { name: 'needed', internalType: 'uint256', type: 'uint256' },
    ],
    name: 'InsufficientBalance',
  },
  {
    type: 'error',
    inputs: [{ name: 'owner', internalType: 'address', type: 'address' }],
    name: 'OwnableInvalidOwner',
  },
  {
    type: 'error',
    inputs: [{ name: 'account', internalType: 'address', type: 'address' }],
    name: 'OwnableUnauthorizedAccount',
  },
  {
    type: 'error',
    inputs: [{ name: 'token', internalType: 'address', type: 'address' }],
    name: 'SafeERC20FailedOperation',
  },
] as const

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// React
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__
 */
export const useReadAxe = /*#__PURE__*/ createUseReadContract({ abi: axeAbi })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"DOMAIN_SEPARATOR"`
 */
export const useReadAxeDomainSeparator = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'DOMAIN_SEPARATOR',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"MAX_SUPPLY"`
 */
export const useReadAxeMaxSupply = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'MAX_SUPPLY',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"allowance"`
 */
export const useReadAxeAllowance = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'allowance',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadAxeBalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"bridges"`
 */
export const useReadAxeBridges = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'bridges',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"burningCurrentLimitOf"`
 */
export const useReadAxeBurningCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axeAbi,
    functionName: 'burningCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"burningMaxLimitOf"`
 */
export const useReadAxeBurningMaxLimitOf = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'burningMaxLimitOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"buyTax"`
 */
export const useReadAxeBuyTax = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'buyTax',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"decimals"`
 */
export const useReadAxeDecimals = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'decimals',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"eip712Domain"`
 */
export const useReadAxeEip712Domain = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'eip712Domain',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"governor"`
 */
export const useReadAxeGovernor = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'governor',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"liquidationPair"`
 */
export const useReadAxeLiquidationPair = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'liquidationPair',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"liquidationToken"`
 */
export const useReadAxeLiquidationToken = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'liquidationToken',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"mintingCurrentLimitOf"`
 */
export const useReadAxeMintingCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axeAbi,
    functionName: 'mintingCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"mintingMaxLimitOf"`
 */
export const useReadAxeMintingMaxLimitOf = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'mintingMaxLimitOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"name"`
 */
export const useReadAxeName = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"nonces"`
 */
export const useReadAxeNonces = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'nonces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"sellTax"`
 */
export const useReadAxeSellTax = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'sellTax',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setLockbox"`
 */
export const useReadAxeSetLockbox = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'setLockbox',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadAxeSymbol = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadAxeTotalSupply = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'totalSupply',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"uniswapV2Router"`
 */
export const useReadAxeUniswapV2Router = /*#__PURE__*/ createUseReadContract({
  abi: axeAbi,
  functionName: 'uniswapV2Router',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__
 */
export const useWriteAxe = /*#__PURE__*/ createUseWriteContract({ abi: axeAbi })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useWriteAxeAddTaxablePair = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'addTaxablePair',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteAxeApprove = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"burn"`
 */
export const useWriteAxeBurn = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"liquidate"`
 */
export const useWriteAxeLiquidate = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'liquidate',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"mint"`
 */
export const useWriteAxeMint = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"permit"`
 */
export const useWriteAxePermit = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'permit',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useWriteAxeRemoveTaxablePair =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useWriteAxeSetBuyTax = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'setBuyTax',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setLimits"`
 */
export const useWriteAxeSetLimits = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'setLimits',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useWriteAxeSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useWriteAxeSetSellTax = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'setSellTax',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useWriteAxeSetTreasury = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'setTreasury',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"transfer"`
 */
export const useWriteAxeTransfer = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'transfer',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteAxeTransferFrom = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'transferFrom',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useWriteAxeTransferGovernorship =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeAbi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"withdraw"`
 */
export const useWriteAxeWithdraw = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'withdraw',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useWriteAxeWithdrawToken = /*#__PURE__*/ createUseWriteContract({
  abi: axeAbi,
  functionName: 'withdrawToken',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__
 */
export const useSimulateAxe = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useSimulateAxeAddTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeAbi,
    functionName: 'addTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateAxeApprove = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"burn"`
 */
export const useSimulateAxeBurn = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"liquidate"`
 */
export const useSimulateAxeLiquidate = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'liquidate',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"mint"`
 */
export const useSimulateAxeMint = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"permit"`
 */
export const useSimulateAxePermit = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'permit',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useSimulateAxeRemoveTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useSimulateAxeSetBuyTax = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'setBuyTax',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setLimits"`
 */
export const useSimulateAxeSetLimits = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'setLimits',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useSimulateAxeSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useSimulateAxeSetSellTax = /*#__PURE__*/ createUseSimulateContract(
  { abi: axeAbi, functionName: 'setSellTax' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useSimulateAxeSetTreasury =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeAbi,
    functionName: 'setTreasury',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateAxeTransfer = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'transfer',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateAxeTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useSimulateAxeTransferGovernorship =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeAbi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"withdraw"`
 */
export const useSimulateAxeWithdraw = /*#__PURE__*/ createUseSimulateContract({
  abi: axeAbi,
  functionName: 'withdraw',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useSimulateAxeWithdrawToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeAbi,
    functionName: 'withdrawToken',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__
 */
export const useWatchAxeEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: axeAbi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchAxeApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"AxeLiquidated"`
 */
export const useWatchAxeAxeLiquidatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'AxeLiquidated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"BridgeLimitsSet"`
 */
export const useWatchAxeBridgeLimitsSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'BridgeLimitsSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"BuyTaxApplied"`
 */
export const useWatchAxeBuyTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'BuyTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"BuyTaxChanged"`
 */
export const useWatchAxeBuyTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'BuyTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"EIP712DomainChanged"`
 */
export const useWatchAxeEip712DomainChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'EIP712DomainChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"GovernorshipTransferred"`
 */
export const useWatchAxeGovernorshipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'GovernorshipTransferred',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"LiquidationSettingsChanged"`
 */
export const useWatchAxeLiquidationSettingsChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'LiquidationSettingsChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"LockboxSet"`
 */
export const useWatchAxeLockboxSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'LockboxSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"NativeWithdrawn"`
 */
export const useWatchAxeNativeWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'NativeWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"SellTaxApplied"`
 */
export const useWatchAxeSellTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'SellTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"SellTaxChanged"`
 */
export const useWatchAxeSellTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'SellTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"TaxablePairAdded"`
 */
export const useWatchAxeTaxablePairAddedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'TaxablePairAdded',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"TaxablePairRemoved"`
 */
export const useWatchAxeTaxablePairRemovedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'TaxablePairRemoved',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"TokenWithdrawn"`
 */
export const useWatchAxeTokenWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'TokenWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchAxeTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeAbi}__ and `eventName` set to `"TreasuryChanged"`
 */
export const useWatchAxeTreasuryChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeAbi,
    eventName: 'TreasuryChanged',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__
 */
export const useReadAxerc20 = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"DOMAIN_SEPARATOR"`
 */
export const useReadAxerc20DomainSeparator =
  /*#__PURE__*/ createUseReadContract({
    abi: axerc20Abi,
    functionName: 'DOMAIN_SEPARATOR',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"allowance"`
 */
export const useReadAxerc20Allowance = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'allowance',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadAxerc20BalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"bridges"`
 */
export const useReadAxerc20Bridges = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'bridges',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"burningCurrentLimitOf"`
 */
export const useReadAxerc20BurningCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axerc20Abi,
    functionName: 'burningCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"burningMaxLimitOf"`
 */
export const useReadAxerc20BurningMaxLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axerc20Abi,
    functionName: 'burningMaxLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"decimals"`
 */
export const useReadAxerc20Decimals = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'decimals',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"eip712Domain"`
 */
export const useReadAxerc20Eip712Domain = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'eip712Domain',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"governor"`
 */
export const useReadAxerc20Governor = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'governor',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"mintingCurrentLimitOf"`
 */
export const useReadAxerc20MintingCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axerc20Abi,
    functionName: 'mintingCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"mintingMaxLimitOf"`
 */
export const useReadAxerc20MintingMaxLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axerc20Abi,
    functionName: 'mintingMaxLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"name"`
 */
export const useReadAxerc20Name = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"nonces"`
 */
export const useReadAxerc20Nonces = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'nonces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"setLockbox"`
 */
export const useReadAxerc20SetLockbox = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'setLockbox',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"symbol"`
 */
export const useReadAxerc20Symbol = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadAxerc20TotalSupply = /*#__PURE__*/ createUseReadContract({
  abi: axerc20Abi,
  functionName: 'totalSupply',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__
 */
export const useWriteAxerc20 = /*#__PURE__*/ createUseWriteContract({
  abi: axerc20Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"approve"`
 */
export const useWriteAxerc20Approve = /*#__PURE__*/ createUseWriteContract({
  abi: axerc20Abi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"burn"`
 */
export const useWriteAxerc20Burn = /*#__PURE__*/ createUseWriteContract({
  abi: axerc20Abi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"mint"`
 */
export const useWriteAxerc20Mint = /*#__PURE__*/ createUseWriteContract({
  abi: axerc20Abi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"permit"`
 */
export const useWriteAxerc20Permit = /*#__PURE__*/ createUseWriteContract({
  abi: axerc20Abi,
  functionName: 'permit',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"setLimits"`
 */
export const useWriteAxerc20SetLimits = /*#__PURE__*/ createUseWriteContract({
  abi: axerc20Abi,
  functionName: 'setLimits',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"transfer"`
 */
export const useWriteAxerc20Transfer = /*#__PURE__*/ createUseWriteContract({
  abi: axerc20Abi,
  functionName: 'transfer',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteAxerc20TransferFrom = /*#__PURE__*/ createUseWriteContract(
  { abi: axerc20Abi, functionName: 'transferFrom' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useWriteAxerc20TransferGovernorship =
  /*#__PURE__*/ createUseWriteContract({
    abi: axerc20Abi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__
 */
export const useSimulateAxerc20 = /*#__PURE__*/ createUseSimulateContract({
  abi: axerc20Abi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"approve"`
 */
export const useSimulateAxerc20Approve =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axerc20Abi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"burn"`
 */
export const useSimulateAxerc20Burn = /*#__PURE__*/ createUseSimulateContract({
  abi: axerc20Abi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"mint"`
 */
export const useSimulateAxerc20Mint = /*#__PURE__*/ createUseSimulateContract({
  abi: axerc20Abi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"permit"`
 */
export const useSimulateAxerc20Permit = /*#__PURE__*/ createUseSimulateContract(
  { abi: axerc20Abi, functionName: 'permit' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"setLimits"`
 */
export const useSimulateAxerc20SetLimits =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axerc20Abi,
    functionName: 'setLimits',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateAxerc20Transfer =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axerc20Abi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateAxerc20TransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axerc20Abi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axerc20Abi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useSimulateAxerc20TransferGovernorship =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axerc20Abi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axerc20Abi}__
 */
export const useWatchAxerc20Event = /*#__PURE__*/ createUseWatchContractEvent({
  abi: axerc20Abi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axerc20Abi}__ and `eventName` set to `"Approval"`
 */
export const useWatchAxerc20ApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axerc20Abi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axerc20Abi}__ and `eventName` set to `"BridgeLimitsSet"`
 */
export const useWatchAxerc20BridgeLimitsSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axerc20Abi,
    eventName: 'BridgeLimitsSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axerc20Abi}__ and `eventName` set to `"EIP712DomainChanged"`
 */
export const useWatchAxerc20Eip712DomainChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axerc20Abi,
    eventName: 'EIP712DomainChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axerc20Abi}__ and `eventName` set to `"GovernorshipTransferred"`
 */
export const useWatchAxerc20GovernorshipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axerc20Abi,
    eventName: 'GovernorshipTransferred',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axerc20Abi}__ and `eventName` set to `"LockboxSet"`
 */
export const useWatchAxerc20LockboxSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axerc20Abi,
    eventName: 'LockboxSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axerc20Abi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchAxerc20TransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axerc20Abi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__
 */
export const useReadAxeSource = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"DOMAIN_SEPARATOR"`
 */
export const useReadAxeSourceDomainSeparator =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'DOMAIN_SEPARATOR',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"MAX_SUPPLY"`
 */
export const useReadAxeSourceMaxSupply = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'MAX_SUPPLY',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"allowance"`
 */
export const useReadAxeSourceAllowance = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'allowance',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadAxeSourceBalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"bridges"`
 */
export const useReadAxeSourceBridges = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'bridges',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"burningCurrentLimitOf"`
 */
export const useReadAxeSourceBurningCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'burningCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"burningMaxLimitOf"`
 */
export const useReadAxeSourceBurningMaxLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'burningMaxLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"buyTax"`
 */
export const useReadAxeSourceBuyTax = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'buyTax',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"decimals"`
 */
export const useReadAxeSourceDecimals = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'decimals',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"eip712Domain"`
 */
export const useReadAxeSourceEip712Domain = /*#__PURE__*/ createUseReadContract(
  { abi: axeSourceAbi, functionName: 'eip712Domain' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"governor"`
 */
export const useReadAxeSourceGovernor = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'governor',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"liquidationPair"`
 */
export const useReadAxeSourceLiquidationPair =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'liquidationPair',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"liquidationToken"`
 */
export const useReadAxeSourceLiquidationToken =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'liquidationToken',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"mintingCurrentLimitOf"`
 */
export const useReadAxeSourceMintingCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'mintingCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"mintingMaxLimitOf"`
 */
export const useReadAxeSourceMintingMaxLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'mintingMaxLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"name"`
 */
export const useReadAxeSourceName = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"nonces"`
 */
export const useReadAxeSourceNonces = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'nonces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"sellTax"`
 */
export const useReadAxeSourceSellTax = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'sellTax',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setLockbox"`
 */
export const useReadAxeSourceSetLockbox = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'setLockbox',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadAxeSourceSymbol = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadAxeSourceTotalSupply = /*#__PURE__*/ createUseReadContract({
  abi: axeSourceAbi,
  functionName: 'totalSupply',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"uniswapV2Router"`
 */
export const useReadAxeSourceUniswapV2Router =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'uniswapV2Router',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"vestingWallet"`
 */
export const useReadAxeSourceVestingWallet =
  /*#__PURE__*/ createUseReadContract({
    abi: axeSourceAbi,
    functionName: 'vestingWallet',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__
 */
export const useWriteAxeSource = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useWriteAxeSourceAddTaxablePair =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeSourceAbi,
    functionName: 'addTaxablePair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteAxeSourceApprove = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"burn"`
 */
export const useWriteAxeSourceBurn = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"issue"`
 */
export const useWriteAxeSourceIssue = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'issue',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"liquidate"`
 */
export const useWriteAxeSourceLiquidate = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'liquidate',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"mint"`
 */
export const useWriteAxeSourceMint = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"permit"`
 */
export const useWriteAxeSourcePermit = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'permit',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useWriteAxeSourceRemoveTaxablePair =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeSourceAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useWriteAxeSourceSetBuyTax = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'setBuyTax',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setLimits"`
 */
export const useWriteAxeSourceSetLimits = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'setLimits',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useWriteAxeSourceSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeSourceAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useWriteAxeSourceSetSellTax = /*#__PURE__*/ createUseWriteContract(
  { abi: axeSourceAbi, functionName: 'setSellTax' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useWriteAxeSourceSetTreasury =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeSourceAbi,
    functionName: 'setTreasury',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"transfer"`
 */
export const useWriteAxeSourceTransfer = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'transfer',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteAxeSourceTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeSourceAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useWriteAxeSourceTransferGovernorship =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeSourceAbi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"withdraw"`
 */
export const useWriteAxeSourceWithdraw = /*#__PURE__*/ createUseWriteContract({
  abi: axeSourceAbi,
  functionName: 'withdraw',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useWriteAxeSourceWithdrawToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeSourceAbi,
    functionName: 'withdrawToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__
 */
export const useSimulateAxeSource = /*#__PURE__*/ createUseSimulateContract({
  abi: axeSourceAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useSimulateAxeSourceAddTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'addTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateAxeSourceApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"burn"`
 */
export const useSimulateAxeSourceBurn = /*#__PURE__*/ createUseSimulateContract(
  { abi: axeSourceAbi, functionName: 'burn' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"issue"`
 */
export const useSimulateAxeSourceIssue =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'issue',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"liquidate"`
 */
export const useSimulateAxeSourceLiquidate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'liquidate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"mint"`
 */
export const useSimulateAxeSourceMint = /*#__PURE__*/ createUseSimulateContract(
  { abi: axeSourceAbi, functionName: 'mint' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"permit"`
 */
export const useSimulateAxeSourcePermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'permit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useSimulateAxeSourceRemoveTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useSimulateAxeSourceSetBuyTax =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'setBuyTax',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setLimits"`
 */
export const useSimulateAxeSourceSetLimits =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'setLimits',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useSimulateAxeSourceSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useSimulateAxeSourceSetSellTax =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'setSellTax',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useSimulateAxeSourceSetTreasury =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'setTreasury',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateAxeSourceTransfer =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateAxeSourceTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useSimulateAxeSourceTransferGovernorship =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"withdraw"`
 */
export const useSimulateAxeSourceWithdraw =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'withdraw',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeSourceAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useSimulateAxeSourceWithdrawToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeSourceAbi,
    functionName: 'withdrawToken',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__
 */
export const useWatchAxeSourceEvent = /*#__PURE__*/ createUseWatchContractEvent(
  { abi: axeSourceAbi },
)

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchAxeSourceApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"AxeIssued"`
 */
export const useWatchAxeSourceAxeIssuedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'AxeIssued',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"AxeLiquidated"`
 */
export const useWatchAxeSourceAxeLiquidatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'AxeLiquidated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"BridgeLimitsSet"`
 */
export const useWatchAxeSourceBridgeLimitsSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'BridgeLimitsSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"BuyTaxApplied"`
 */
export const useWatchAxeSourceBuyTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'BuyTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"BuyTaxChanged"`
 */
export const useWatchAxeSourceBuyTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'BuyTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"EIP712DomainChanged"`
 */
export const useWatchAxeSourceEip712DomainChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'EIP712DomainChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"GovernorshipTransferred"`
 */
export const useWatchAxeSourceGovernorshipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'GovernorshipTransferred',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"LiquidationSettingsChanged"`
 */
export const useWatchAxeSourceLiquidationSettingsChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'LiquidationSettingsChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"LockboxSet"`
 */
export const useWatchAxeSourceLockboxSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'LockboxSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"NativeWithdrawn"`
 */
export const useWatchAxeSourceNativeWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'NativeWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"SellTaxApplied"`
 */
export const useWatchAxeSourceSellTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'SellTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"SellTaxChanged"`
 */
export const useWatchAxeSourceSellTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'SellTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"TaxablePairAdded"`
 */
export const useWatchAxeSourceTaxablePairAddedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'TaxablePairAdded',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"TaxablePairRemoved"`
 */
export const useWatchAxeSourceTaxablePairRemovedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'TaxablePairRemoved',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"TokenWithdrawn"`
 */
export const useWatchAxeSourceTokenWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'TokenWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchAxeSourceTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeSourceAbi}__ and `eventName` set to `"TreasuryChanged"`
 */
export const useWatchAxeSourceTreasuryChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeSourceAbi,
    eventName: 'TreasuryChanged',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__
 */
export const useReadAxeMembership = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadAxeMembershipBalanceOf =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'balanceOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"candidates"`
 */
export const useReadAxeMembershipCandidates =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'candidates',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"delegations"`
 */
export const useReadAxeMembershipDelegations =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'delegations',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getApproved"`
 */
export const useReadAxeMembershipGetApproved =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getApproved',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getCandidate"`
 */
export const useReadAxeMembershipGetCandidate =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getCandidate',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getDelegationCountForGroupAtIndex"`
 */
export const useReadAxeMembershipGetDelegationCountForGroupAtIndex =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getDelegationCountForGroupAtIndex',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getMemberCount"`
 */
export const useReadAxeMembershipGetMemberCount =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getMemberCount',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getMemberId"`
 */
export const useReadAxeMembershipGetMemberId =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getMemberId',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getNativeDonationAmount"`
 */
export const useReadAxeMembershipGetNativeDonationAmount =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getNativeDonationAmount',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getNextRankedCandidate"`
 */
export const useReadAxeMembershipGetNextRankedCandidate =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getNextRankedCandidate',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getNumberOfRankedGroups"`
 */
export const useReadAxeMembershipGetNumberOfRankedGroups =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getNumberOfRankedGroups',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getRankedGroupAtIndex"`
 */
export const useReadAxeMembershipGetRankedGroupAtIndex =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getRankedGroupAtIndex',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getTokenDonationAmount"`
 */
export const useReadAxeMembershipGetTokenDonationAmount =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getTokenDonationAmount',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"getTopCandidates"`
 */
export const useReadAxeMembershipGetTopCandidates =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'getTopCandidates',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"isApprovedForAll"`
 */
export const useReadAxeMembershipIsApprovedForAll =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'isApprovedForAll',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"isMember"`
 */
export const useReadAxeMembershipIsMember = /*#__PURE__*/ createUseReadContract(
  { abi: axeMembershipAbi, functionName: 'isMember' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"members"`
 */
export const useReadAxeMembershipMembers = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipAbi,
  functionName: 'members',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"name"`
 */
export const useReadAxeMembershipName = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"owner"`
 */
export const useReadAxeMembershipOwner = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipAbi,
  functionName: 'owner',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"ownerOf"`
 */
export const useReadAxeMembershipOwnerOf = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipAbi,
  functionName: 'ownerOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"supportsInterface"`
 */
export const useReadAxeMembershipSupportsInterface =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipAbi,
    functionName: 'supportsInterface',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadAxeMembershipSymbol = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipAbi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"tokenURI"`
 */
export const useReadAxeMembershipTokenUri = /*#__PURE__*/ createUseReadContract(
  { abi: axeMembershipAbi, functionName: 'tokenURI' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__
 */
export const useWriteAxeMembership = /*#__PURE__*/ createUseWriteContract({
  abi: axeMembershipAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteAxeMembershipApprove =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"delegate"`
 */
export const useWriteAxeMembershipDelegate =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'delegate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"donate"`
 */
export const useWriteAxeMembershipDonate = /*#__PURE__*/ createUseWriteContract(
  { abi: axeMembershipAbi, functionName: 'donate' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"enlistAsCandidate"`
 */
export const useWriteAxeMembershipEnlistAsCandidate =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'enlistAsCandidate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useWriteAxeMembershipRenounceOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"resignAsCandidate"`
 */
export const useWriteAxeMembershipResignAsCandidate =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'resignAsCandidate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useWriteAxeMembershipSafeTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useWriteAxeMembershipSetApprovalForAll =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setDonationReceiver"`
 */
export const useWriteAxeMembershipSetDonationReceiver =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'setDonationReceiver',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setDonationToken"`
 */
export const useWriteAxeMembershipSetDonationToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'setDonationToken',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setNativeDonationAmount"`
 */
export const useWriteAxeMembershipSetNativeDonationAmount =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'setNativeDonationAmount',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setTokenDonationAmount"`
 */
export const useWriteAxeMembershipSetTokenDonationAmount =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'setTokenDonationAmount',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteAxeMembershipTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useWriteAxeMembershipTransferOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"undelegate"`
 */
export const useWriteAxeMembershipUndelegate =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipAbi,
    functionName: 'undelegate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__
 */
export const useSimulateAxeMembership = /*#__PURE__*/ createUseSimulateContract(
  { abi: axeMembershipAbi },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateAxeMembershipApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"delegate"`
 */
export const useSimulateAxeMembershipDelegate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'delegate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"donate"`
 */
export const useSimulateAxeMembershipDonate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'donate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"enlistAsCandidate"`
 */
export const useSimulateAxeMembershipEnlistAsCandidate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'enlistAsCandidate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useSimulateAxeMembershipRenounceOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"resignAsCandidate"`
 */
export const useSimulateAxeMembershipResignAsCandidate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'resignAsCandidate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useSimulateAxeMembershipSafeTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useSimulateAxeMembershipSetApprovalForAll =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setDonationReceiver"`
 */
export const useSimulateAxeMembershipSetDonationReceiver =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'setDonationReceiver',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setDonationToken"`
 */
export const useSimulateAxeMembershipSetDonationToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'setDonationToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setNativeDonationAmount"`
 */
export const useSimulateAxeMembershipSetNativeDonationAmount =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'setNativeDonationAmount',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"setTokenDonationAmount"`
 */
export const useSimulateAxeMembershipSetTokenDonationAmount =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'setTokenDonationAmount',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateAxeMembershipTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useSimulateAxeMembershipTransferOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipAbi}__ and `functionName` set to `"undelegate"`
 */
export const useSimulateAxeMembershipUndelegate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipAbi,
    functionName: 'undelegate',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__
 */
export const useWatchAxeMembershipEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: axeMembershipAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchAxeMembershipApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"ApprovalForAll"`
 */
export const useWatchAxeMembershipApprovalForAllEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'ApprovalForAll',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"CandidateEnlisted"`
 */
export const useWatchAxeMembershipCandidateEnlistedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'CandidateEnlisted',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"CandidateResigned"`
 */
export const useWatchAxeMembershipCandidateResignedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'CandidateResigned',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"ERC20DonationReceived"`
 */
export const useWatchAxeMembershipErc20DonationReceivedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'ERC20DonationReceived',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"NativeDonationReceived"`
 */
export const useWatchAxeMembershipNativeDonationReceivedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'NativeDonationReceived',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"ObrigadoMuitoAxe"`
 */
export const useWatchAxeMembershipObrigadoMuitoAxeEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'ObrigadoMuitoAxe',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"OwnershipTransferred"`
 */
export const useWatchAxeMembershipOwnershipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'OwnershipTransferred',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchAxeMembershipTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"VoteDelegated"`
 */
export const useWatchAxeMembershipVoteDelegatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'VoteDelegated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipAbi}__ and `eventName` set to `"VoteUndelegated"`
 */
export const useWatchAxeMembershipVoteUndelegatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipAbi,
    eventName: 'VoteUndelegated',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__
 */
export const useReadAxeMembershipBase = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipBaseAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"IS_TEST"`
 */
export const useReadAxeMembershipBaseIsTest =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'IS_TEST',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"excludeArtifacts"`
 */
export const useReadAxeMembershipBaseExcludeArtifacts =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'excludeArtifacts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"excludeContracts"`
 */
export const useReadAxeMembershipBaseExcludeContracts =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'excludeContracts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"excludeSenders"`
 */
export const useReadAxeMembershipBaseExcludeSenders =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'excludeSenders',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"targetArtifactSelectors"`
 */
export const useReadAxeMembershipBaseTargetArtifactSelectors =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'targetArtifactSelectors',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"targetArtifacts"`
 */
export const useReadAxeMembershipBaseTargetArtifacts =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'targetArtifacts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"targetContracts"`
 */
export const useReadAxeMembershipBaseTargetContracts =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'targetContracts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"targetInterfaces"`
 */
export const useReadAxeMembershipBaseTargetInterfaces =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'targetInterfaces',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"targetSelectors"`
 */
export const useReadAxeMembershipBaseTargetSelectors =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'targetSelectors',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"targetSenders"`
 */
export const useReadAxeMembershipBaseTargetSenders =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipBaseAbi,
    functionName: 'targetSenders',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__
 */
export const useWriteAxeMembershipBase = /*#__PURE__*/ createUseWriteContract({
  abi: axeMembershipBaseAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"failed"`
 */
export const useWriteAxeMembershipBaseFailed =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipBaseAbi,
    functionName: 'failed',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__
 */
export const useSimulateAxeMembershipBase =
  /*#__PURE__*/ createUseSimulateContract({ abi: axeMembershipBaseAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `functionName` set to `"failed"`
 */
export const useSimulateAxeMembershipBaseFailed =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipBaseAbi,
    functionName: 'failed',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__
 */
export const useWatchAxeMembershipBaseEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: axeMembershipBaseAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log"`
 */
export const useWatchAxeMembershipBaseLogEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_address"`
 */
export const useWatchAxeMembershipBaseLogAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_array"`
 */
export const useWatchAxeMembershipBaseLogArrayEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_array',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_bytes"`
 */
export const useWatchAxeMembershipBaseLogBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_bytes32"`
 */
export const useWatchAxeMembershipBaseLogBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_int"`
 */
export const useWatchAxeMembershipBaseLogIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_address"`
 */
export const useWatchAxeMembershipBaseLogNamedAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_array"`
 */
export const useWatchAxeMembershipBaseLogNamedArrayEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_array',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_bytes"`
 */
export const useWatchAxeMembershipBaseLogNamedBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_bytes32"`
 */
export const useWatchAxeMembershipBaseLogNamedBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_decimal_int"`
 */
export const useWatchAxeMembershipBaseLogNamedDecimalIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_decimal_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_decimal_uint"`
 */
export const useWatchAxeMembershipBaseLogNamedDecimalUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_decimal_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_int"`
 */
export const useWatchAxeMembershipBaseLogNamedIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_string"`
 */
export const useWatchAxeMembershipBaseLogNamedStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_named_uint"`
 */
export const useWatchAxeMembershipBaseLogNamedUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_named_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_string"`
 */
export const useWatchAxeMembershipBaseLogStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"log_uint"`
 */
export const useWatchAxeMembershipBaseLogUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'log_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipBaseAbi}__ and `eventName` set to `"logs"`
 */
export const useWatchAxeMembershipBaseLogsEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipBaseAbi,
    eventName: 'logs',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__
 */
export const useReadAxeMembershipCouncil = /*#__PURE__*/ createUseReadContract({
  abi: axeMembershipCouncilAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"UPDATE_COOLDOWN"`
 */
export const useReadAxeMembershipCouncilUpdateCooldown =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'UPDATE_COOLDOWN',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"baal"`
 */
export const useReadAxeMembershipCouncilBaal =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'baal',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"canRequestCouncilUpdate"`
 */
export const useReadAxeMembershipCouncilCanRequestCouncilUpdate =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'canRequestCouncilUpdate',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"councilLimit"`
 */
export const useReadAxeMembershipCouncilCouncilLimit =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'councilLimit',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"getCouncilMemberAtIndex"`
 */
export const useReadAxeMembershipCouncilGetCouncilMemberAtIndex =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'getCouncilMemberAtIndex',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"getCurrentCouncilSize"`
 */
export const useReadAxeMembershipCouncilGetCurrentCouncilSize =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'getCurrentCouncilSize',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"getCurrentMembers"`
 */
export const useReadAxeMembershipCouncilGetCurrentMembers =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'getCurrentMembers',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"getJoiningMembers"`
 */
export const useReadAxeMembershipCouncilGetJoiningMembers =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'getJoiningMembers',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"getLeavingMembers"`
 */
export const useReadAxeMembershipCouncilGetLeavingMembers =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'getLeavingMembers',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"lastFormationRequest"`
 */
export const useReadAxeMembershipCouncilLastFormationRequest =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'lastFormationRequest',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"membership"`
 */
export const useReadAxeMembershipCouncilMembership =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'membership',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"owner"`
 */
export const useReadAxeMembershipCouncilOwner =
  /*#__PURE__*/ createUseReadContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'owner',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__
 */
export const useWriteAxeMembershipCouncil =
  /*#__PURE__*/ createUseWriteContract({ abi: axeMembershipCouncilAbi })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"claimSeat"`
 */
export const useWriteAxeMembershipCouncilClaimSeat =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'claimSeat',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"increaseCouncilLimit"`
 */
export const useWriteAxeMembershipCouncilIncreaseCouncilLimit =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'increaseCouncilLimit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useWriteAxeMembershipCouncilRenounceOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"requestCouncilUpdate"`
 */
export const useWriteAxeMembershipCouncilRequestCouncilUpdate =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'requestCouncilUpdate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useWriteAxeMembershipCouncilTransferOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__
 */
export const useSimulateAxeMembershipCouncil =
  /*#__PURE__*/ createUseSimulateContract({ abi: axeMembershipCouncilAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"claimSeat"`
 */
export const useSimulateAxeMembershipCouncilClaimSeat =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'claimSeat',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"increaseCouncilLimit"`
 */
export const useSimulateAxeMembershipCouncilIncreaseCouncilLimit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'increaseCouncilLimit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useSimulateAxeMembershipCouncilRenounceOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"requestCouncilUpdate"`
 */
export const useSimulateAxeMembershipCouncilRequestCouncilUpdate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'requestCouncilUpdate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useSimulateAxeMembershipCouncilTransferOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: axeMembershipCouncilAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipCouncilAbi}__
 */
export const useWatchAxeMembershipCouncilEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: axeMembershipCouncilAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `eventName` set to `"CouncilLimitIncreased"`
 */
export const useWatchAxeMembershipCouncilCouncilLimitIncreasedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipCouncilAbi,
    eventName: 'CouncilLimitIncreased',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `eventName` set to `"CouncilUpdateRequested"`
 */
export const useWatchAxeMembershipCouncilCouncilUpdateRequestedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipCouncilAbi,
    eventName: 'CouncilUpdateRequested',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `eventName` set to `"OwnershipTransferred"`
 */
export const useWatchAxeMembershipCouncilOwnershipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipCouncilAbi,
    eventName: 'OwnershipTransferred',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link axeMembershipCouncilAbi}__ and `eventName` set to `"SeatClaimed"`
 */
export const useWatchAxeMembershipCouncilSeatClaimedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: axeMembershipCouncilAbi,
    eventName: 'SeatClaimed',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaal = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"adminLock"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalAdminLock = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'adminLock',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"avatar"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalAvatar = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'avatar',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"encodeMultisend"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalEncodeMultisend = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'encodeMultisend',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"getGuard"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalGetGuard = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'getGuard',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"getProposalStatus"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalGetProposalStatus = /*#__PURE__*/ createUseReadContract(
  { abi: baalAbi, address: baalAddress, functionName: 'getProposalStatus' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"governorLock"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalGovernorLock = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'governorLock',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"gracePeriod"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalGracePeriod = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'gracePeriod',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"guard"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalGuard = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'guard',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"hashOperation"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalHashOperation = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'hashOperation',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"isAdmin"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalIsAdmin = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'isAdmin',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"isGovernor"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalIsGovernor = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'isGovernor',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"isManager"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalIsManager = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'isManager',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"isTrustedForwarder"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalIsTrustedForwarder =
  /*#__PURE__*/ createUseReadContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'isTrustedForwarder',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"latestSponsoredProposalId"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalLatestSponsoredProposalId =
  /*#__PURE__*/ createUseReadContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'latestSponsoredProposalId',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"lootToken"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalLootToken = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'lootToken',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"managerLock"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalManagerLock = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'managerLock',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"memberVoted"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalMemberVoted = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'memberVoted',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"minRetentionPercent"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalMinRetentionPercent =
  /*#__PURE__*/ createUseReadContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'minRetentionPercent',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"multisendLibrary"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalMultisendLibrary = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'multisendLibrary',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"owner"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalOwner = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'owner',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"proposalCount"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalProposalCount = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'proposalCount',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"proposalOffering"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalProposalOffering = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'proposalOffering',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"proposals"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalProposals = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'proposals',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"quorumPercent"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalQuorumPercent = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'quorumPercent',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"shamans"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalShamans = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'shamans',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"sharesToken"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalSharesToken = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'sharesToken',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"sponsorThreshold"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalSponsorThreshold = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'sponsorThreshold',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"state"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalState = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'state',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"target"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalTarget = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'target',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"totalLoot"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalTotalLoot = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'totalLoot',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"totalShares"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalTotalShares = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'totalShares',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"totalSupply"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalTotalSupply = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'totalSupply',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"trustedForwarder"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalTrustedForwarder = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'trustedForwarder',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"versionRecipient"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalVersionRecipient = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'versionRecipient',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"votingNonces"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalVotingNonces = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'votingNonces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"votingPeriod"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useReadBaalVotingPeriod = /*#__PURE__*/ createUseReadContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'votingPeriod',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaal = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"burnLoot"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalBurnLoot = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'burnLoot',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"burnShares"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalBurnShares = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'burnShares',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"cancelProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalCancelProposal = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'cancelProposal',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"executeAsBaal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalExecuteAsBaal = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'executeAsBaal',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"lockAdmin"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalLockAdmin = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'lockAdmin',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"lockGovernor"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalLockGovernor = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'lockGovernor',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"lockManager"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalLockManager = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'lockManager',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"mintLoot"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalMintLoot = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'mintLoot',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"mintShares"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalMintShares = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'mintShares',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"processProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalProcessProposal = /*#__PURE__*/ createUseWriteContract(
  { abi: baalAbi, address: baalAddress, functionName: 'processProposal' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"ragequit"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalRagequit = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'ragequit',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"renounceOwnership"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalRenounceOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setAdminConfig"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetAdminConfig = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setAdminConfig',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setAvatar"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetAvatar = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setAvatar',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setGovernanceConfig"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetGovernanceConfig =
  /*#__PURE__*/ createUseWriteContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'setGovernanceConfig',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setGuard"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetGuard = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setGuard',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setShamans"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetShamans = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setShamans',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setTarget"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetTarget = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setTarget',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setTrustedForwarder"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetTrustedForwarder =
  /*#__PURE__*/ createUseWriteContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'setTrustedForwarder',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setUp"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSetUp = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setUp',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"sponsorProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSponsorProposal = /*#__PURE__*/ createUseWriteContract(
  { abi: baalAbi, address: baalAddress, functionName: 'sponsorProposal' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"submitProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSubmitProposal = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'submitProposal',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"submitVote"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSubmitVote = /*#__PURE__*/ createUseWriteContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'submitVote',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"submitVoteWithSig"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalSubmitVoteWithSig =
  /*#__PURE__*/ createUseWriteContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'submitVoteWithSig',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"transferOwnership"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWriteBaalTransferOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaal = /*#__PURE__*/ createUseSimulateContract({
  abi: baalAbi,
  address: baalAddress,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"burnLoot"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalBurnLoot = /*#__PURE__*/ createUseSimulateContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'burnLoot',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"burnShares"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalBurnShares =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'burnShares',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"cancelProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalCancelProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'cancelProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"executeAsBaal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalExecuteAsBaal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'executeAsBaal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"lockAdmin"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalLockAdmin = /*#__PURE__*/ createUseSimulateContract(
  { abi: baalAbi, address: baalAddress, functionName: 'lockAdmin' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"lockGovernor"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalLockGovernor =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'lockGovernor',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"lockManager"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalLockManager =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'lockManager',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"mintLoot"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalMintLoot = /*#__PURE__*/ createUseSimulateContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'mintLoot',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"mintShares"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalMintShares =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'mintShares',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"processProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalProcessProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'processProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"ragequit"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalRagequit = /*#__PURE__*/ createUseSimulateContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'ragequit',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"renounceOwnership"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalRenounceOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setAdminConfig"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetAdminConfig =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'setAdminConfig',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setAvatar"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetAvatar = /*#__PURE__*/ createUseSimulateContract(
  { abi: baalAbi, address: baalAddress, functionName: 'setAvatar' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setGovernanceConfig"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetGovernanceConfig =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'setGovernanceConfig',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setGuard"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetGuard = /*#__PURE__*/ createUseSimulateContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setGuard',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setShamans"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetShamans =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'setShamans',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setTarget"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetTarget = /*#__PURE__*/ createUseSimulateContract(
  { abi: baalAbi, address: baalAddress, functionName: 'setTarget' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setTrustedForwarder"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetTrustedForwarder =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'setTrustedForwarder',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"setUp"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSetUp = /*#__PURE__*/ createUseSimulateContract({
  abi: baalAbi,
  address: baalAddress,
  functionName: 'setUp',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"sponsorProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSponsorProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'sponsorProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"submitProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSubmitProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'submitProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"submitVote"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSubmitVote =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'submitVote',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"submitVoteWithSig"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalSubmitVoteWithSig =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'submitVoteWithSig',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link baalAbi}__ and `functionName` set to `"transferOwnership"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useSimulateBaalTransferOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: baalAbi,
    address: baalAddress,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: baalAbi,
  address: baalAddress,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"Approval"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"AvatarSet"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalAvatarSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'AvatarSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"CancelProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalCancelProposalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'CancelProposal',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"ChangedGuard"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalChangedGuardEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'ChangedGuard',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"GovernanceConfigSet"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalGovernanceConfigSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'GovernanceConfigSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"Initialized"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalInitializedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'Initialized',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"LockAdmin"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalLockAdminEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'LockAdmin',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"LockGovernor"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalLockGovernorEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'LockGovernor',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"LockManager"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalLockManagerEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'LockManager',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"LootPaused"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalLootPausedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'LootPaused',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"OwnershipTransferred"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalOwnershipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'OwnershipTransferred',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"ProcessProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalProcessProposalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'ProcessProposal',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"Ragequit"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalRagequitEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'Ragequit',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"SetTrustedForwarder"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalSetTrustedForwarderEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'SetTrustedForwarder',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"SetupComplete"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalSetupCompleteEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'SetupComplete',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"ShamanSet"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalShamanSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'ShamanSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"SharesPaused"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalSharesPausedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'SharesPaused',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"SponsorProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalSponsorProposalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'SponsorProposal',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"SubmitProposal"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalSubmitProposalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'SubmitProposal',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"SubmitVote"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalSubmitVoteEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'SubmitVote',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link baalAbi}__ and `eventName` set to `"TargetSet"`
 *
 * [__View Contract on Sepolia Etherscan__](https://sepolia.etherscan.io/address/0x1c3ac998b698206cd2fb22bb422bf14367470866)
 */
export const useWatchBaalTargetSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: baalAbi,
    address: baalAddress,
    eventName: 'TargetSet',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link dsTestAbi}__
 */
export const useReadDsTest = /*#__PURE__*/ createUseReadContract({
  abi: dsTestAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link dsTestAbi}__ and `functionName` set to `"IS_TEST"`
 */
export const useReadDsTestIsTest = /*#__PURE__*/ createUseReadContract({
  abi: dsTestAbi,
  functionName: 'IS_TEST',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link dsTestAbi}__
 */
export const useWriteDsTest = /*#__PURE__*/ createUseWriteContract({
  abi: dsTestAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link dsTestAbi}__ and `functionName` set to `"failed"`
 */
export const useWriteDsTestFailed = /*#__PURE__*/ createUseWriteContract({
  abi: dsTestAbi,
  functionName: 'failed',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link dsTestAbi}__
 */
export const useSimulateDsTest = /*#__PURE__*/ createUseSimulateContract({
  abi: dsTestAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link dsTestAbi}__ and `functionName` set to `"failed"`
 */
export const useSimulateDsTestFailed = /*#__PURE__*/ createUseSimulateContract({
  abi: dsTestAbi,
  functionName: 'failed',
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__
 */
export const useWatchDsTestEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: dsTestAbi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log"`
 */
export const useWatchDsTestLogEvent = /*#__PURE__*/ createUseWatchContractEvent(
  { abi: dsTestAbi, eventName: 'log' },
)

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_address"`
 */
export const useWatchDsTestLogAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_bytes"`
 */
export const useWatchDsTestLogBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_bytes32"`
 */
export const useWatchDsTestLogBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_int"`
 */
export const useWatchDsTestLogIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_address"`
 */
export const useWatchDsTestLogNamedAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_bytes"`
 */
export const useWatchDsTestLogNamedBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_bytes32"`
 */
export const useWatchDsTestLogNamedBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_decimal_int"`
 */
export const useWatchDsTestLogNamedDecimalIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_decimal_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_decimal_uint"`
 */
export const useWatchDsTestLogNamedDecimalUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_decimal_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_int"`
 */
export const useWatchDsTestLogNamedIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_string"`
 */
export const useWatchDsTestLogNamedStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_named_uint"`
 */
export const useWatchDsTestLogNamedUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_named_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_string"`
 */
export const useWatchDsTestLogStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"log_uint"`
 */
export const useWatchDsTestLogUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'log_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link dsTestAbi}__ and `eventName` set to `"logs"`
 */
export const useWatchDsTestLogsEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: dsTestAbi,
    eventName: 'logs',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link eip712Abi}__
 */
export const useReadEip712 = /*#__PURE__*/ createUseReadContract({
  abi: eip712Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link eip712Abi}__ and `functionName` set to `"eip712Domain"`
 */
export const useReadEip712Eip712Domain = /*#__PURE__*/ createUseReadContract({
  abi: eip712Abi,
  functionName: 'eip712Domain',
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link eip712Abi}__
 */
export const useWatchEip712Event = /*#__PURE__*/ createUseWatchContractEvent({
  abi: eip712Abi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link eip712Abi}__ and `eventName` set to `"EIP712DomainChanged"`
 */
export const useWatchEip712Eip712DomainChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: eip712Abi,
    eventName: 'EIP712DomainChanged',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc165Abi}__
 */
export const useReadErc165 = /*#__PURE__*/ createUseReadContract({
  abi: erc165Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc165Abi}__ and `functionName` set to `"supportsInterface"`
 */
export const useReadErc165SupportsInterface =
  /*#__PURE__*/ createUseReadContract({
    abi: erc165Abi,
    functionName: 'supportsInterface',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20Abi}__
 */
export const useReadErc20 = /*#__PURE__*/ createUseReadContract({
  abi: erc20Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"allowance"`
 */
export const useReadErc20Allowance = /*#__PURE__*/ createUseReadContract({
  abi: erc20Abi,
  functionName: 'allowance',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadErc20BalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: erc20Abi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"decimals"`
 */
export const useReadErc20Decimals = /*#__PURE__*/ createUseReadContract({
  abi: erc20Abi,
  functionName: 'decimals',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"name"`
 */
export const useReadErc20Name = /*#__PURE__*/ createUseReadContract({
  abi: erc20Abi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"symbol"`
 */
export const useReadErc20Symbol = /*#__PURE__*/ createUseReadContract({
  abi: erc20Abi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadErc20TotalSupply = /*#__PURE__*/ createUseReadContract({
  abi: erc20Abi,
  functionName: 'totalSupply',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20Abi}__
 */
export const useWriteErc20 = /*#__PURE__*/ createUseWriteContract({
  abi: erc20Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"approve"`
 */
export const useWriteErc20Approve = /*#__PURE__*/ createUseWriteContract({
  abi: erc20Abi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"transfer"`
 */
export const useWriteErc20Transfer = /*#__PURE__*/ createUseWriteContract({
  abi: erc20Abi,
  functionName: 'transfer',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteErc20TransferFrom = /*#__PURE__*/ createUseWriteContract({
  abi: erc20Abi,
  functionName: 'transferFrom',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20Abi}__
 */
export const useSimulateErc20 = /*#__PURE__*/ createUseSimulateContract({
  abi: erc20Abi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"approve"`
 */
export const useSimulateErc20Approve = /*#__PURE__*/ createUseSimulateContract({
  abi: erc20Abi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateErc20Transfer = /*#__PURE__*/ createUseSimulateContract(
  { abi: erc20Abi, functionName: 'transfer' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateErc20TransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc20Abi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc20Abi}__
 */
export const useWatchErc20Event = /*#__PURE__*/ createUseWatchContractEvent({
  abi: erc20Abi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc20Abi}__ and `eventName` set to `"Approval"`
 */
export const useWatchErc20ApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc20Abi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc20Abi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchErc20TransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc20Abi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__
 */
export const useReadErc20Permit = /*#__PURE__*/ createUseReadContract({
  abi: erc20PermitAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"DOMAIN_SEPARATOR"`
 */
export const useReadErc20PermitDomainSeparator =
  /*#__PURE__*/ createUseReadContract({
    abi: erc20PermitAbi,
    functionName: 'DOMAIN_SEPARATOR',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"allowance"`
 */
export const useReadErc20PermitAllowance = /*#__PURE__*/ createUseReadContract({
  abi: erc20PermitAbi,
  functionName: 'allowance',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadErc20PermitBalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: erc20PermitAbi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"decimals"`
 */
export const useReadErc20PermitDecimals = /*#__PURE__*/ createUseReadContract({
  abi: erc20PermitAbi,
  functionName: 'decimals',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"eip712Domain"`
 */
export const useReadErc20PermitEip712Domain =
  /*#__PURE__*/ createUseReadContract({
    abi: erc20PermitAbi,
    functionName: 'eip712Domain',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"name"`
 */
export const useReadErc20PermitName = /*#__PURE__*/ createUseReadContract({
  abi: erc20PermitAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"nonces"`
 */
export const useReadErc20PermitNonces = /*#__PURE__*/ createUseReadContract({
  abi: erc20PermitAbi,
  functionName: 'nonces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadErc20PermitSymbol = /*#__PURE__*/ createUseReadContract({
  abi: erc20PermitAbi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadErc20PermitTotalSupply =
  /*#__PURE__*/ createUseReadContract({
    abi: erc20PermitAbi,
    functionName: 'totalSupply',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20PermitAbi}__
 */
export const useWriteErc20Permit = /*#__PURE__*/ createUseWriteContract({
  abi: erc20PermitAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteErc20PermitApprove = /*#__PURE__*/ createUseWriteContract({
  abi: erc20PermitAbi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"permit"`
 */
export const useWriteErc20PermitPermit = /*#__PURE__*/ createUseWriteContract({
  abi: erc20PermitAbi,
  functionName: 'permit',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"transfer"`
 */
export const useWriteErc20PermitTransfer = /*#__PURE__*/ createUseWriteContract(
  { abi: erc20PermitAbi, functionName: 'transfer' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteErc20PermitTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: erc20PermitAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20PermitAbi}__
 */
export const useSimulateErc20Permit = /*#__PURE__*/ createUseSimulateContract({
  abi: erc20PermitAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateErc20PermitApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc20PermitAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"permit"`
 */
export const useSimulateErc20PermitPermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc20PermitAbi,
    functionName: 'permit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateErc20PermitTransfer =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc20PermitAbi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc20PermitAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateErc20PermitTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc20PermitAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc20PermitAbi}__
 */
export const useWatchErc20PermitEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: erc20PermitAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc20PermitAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchErc20PermitApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc20PermitAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc20PermitAbi}__ and `eventName` set to `"EIP712DomainChanged"`
 */
export const useWatchErc20PermitEip712DomainChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc20PermitAbi,
    eventName: 'EIP712DomainChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc20PermitAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchErc20PermitTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc20PermitAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__
 */
export const useReadErc721 = /*#__PURE__*/ createUseReadContract({
  abi: erc721Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadErc721BalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: erc721Abi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"getApproved"`
 */
export const useReadErc721GetApproved = /*#__PURE__*/ createUseReadContract({
  abi: erc721Abi,
  functionName: 'getApproved',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"isApprovedForAll"`
 */
export const useReadErc721IsApprovedForAll =
  /*#__PURE__*/ createUseReadContract({
    abi: erc721Abi,
    functionName: 'isApprovedForAll',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"name"`
 */
export const useReadErc721Name = /*#__PURE__*/ createUseReadContract({
  abi: erc721Abi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"ownerOf"`
 */
export const useReadErc721OwnerOf = /*#__PURE__*/ createUseReadContract({
  abi: erc721Abi,
  functionName: 'ownerOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"supportsInterface"`
 */
export const useReadErc721SupportsInterface =
  /*#__PURE__*/ createUseReadContract({
    abi: erc721Abi,
    functionName: 'supportsInterface',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"symbol"`
 */
export const useReadErc721Symbol = /*#__PURE__*/ createUseReadContract({
  abi: erc721Abi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"tokenURI"`
 */
export const useReadErc721TokenUri = /*#__PURE__*/ createUseReadContract({
  abi: erc721Abi,
  functionName: 'tokenURI',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc721Abi}__
 */
export const useWriteErc721 = /*#__PURE__*/ createUseWriteContract({
  abi: erc721Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"approve"`
 */
export const useWriteErc721Approve = /*#__PURE__*/ createUseWriteContract({
  abi: erc721Abi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useWriteErc721SafeTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: erc721Abi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useWriteErc721SetApprovalForAll =
  /*#__PURE__*/ createUseWriteContract({
    abi: erc721Abi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteErc721TransferFrom = /*#__PURE__*/ createUseWriteContract({
  abi: erc721Abi,
  functionName: 'transferFrom',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc721Abi}__
 */
export const useSimulateErc721 = /*#__PURE__*/ createUseSimulateContract({
  abi: erc721Abi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"approve"`
 */
export const useSimulateErc721Approve = /*#__PURE__*/ createUseSimulateContract(
  { abi: erc721Abi, functionName: 'approve' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useSimulateErc721SafeTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc721Abi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useSimulateErc721SetApprovalForAll =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc721Abi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link erc721Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateErc721TransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: erc721Abi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc721Abi}__
 */
export const useWatchErc721Event = /*#__PURE__*/ createUseWatchContractEvent({
  abi: erc721Abi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc721Abi}__ and `eventName` set to `"Approval"`
 */
export const useWatchErc721ApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc721Abi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc721Abi}__ and `eventName` set to `"ApprovalForAll"`
 */
export const useWatchErc721ApprovalForAllEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc721Abi,
    eventName: 'ApprovalForAll',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link erc721Abi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchErc721TransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: erc721Abi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link governableAbi}__
 */
export const useReadGovernable = /*#__PURE__*/ createUseReadContract({
  abi: governableAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link governableAbi}__ and `functionName` set to `"governor"`
 */
export const useReadGovernableGovernor = /*#__PURE__*/ createUseReadContract({
  abi: governableAbi,
  functionName: 'governor',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link governableAbi}__
 */
export const useWriteGovernable = /*#__PURE__*/ createUseWriteContract({
  abi: governableAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link governableAbi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useWriteGovernableTransferGovernorship =
  /*#__PURE__*/ createUseWriteContract({
    abi: governableAbi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link governableAbi}__
 */
export const useSimulateGovernable = /*#__PURE__*/ createUseSimulateContract({
  abi: governableAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link governableAbi}__ and `functionName` set to `"transferGovernorship"`
 */
export const useSimulateGovernableTransferGovernorship =
  /*#__PURE__*/ createUseSimulateContract({
    abi: governableAbi,
    functionName: 'transferGovernorship',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link governableAbi}__
 */
export const useWatchGovernableEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: governableAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link governableAbi}__ and `eventName` set to `"GovernorshipTransferred"`
 */
export const useWatchGovernableGovernorshipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: governableAbi,
    eventName: 'GovernorshipTransferred',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__
 */
export const useWriteIaxe = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useWriteIaxeAddTaxablePair = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
  functionName: 'addTaxablePair',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"liquidate"`
 */
export const useWriteIaxeLiquidate = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
  functionName: 'liquidate',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useWriteIaxeRemoveTaxablePair =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useWriteIaxeSetBuyTax = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
  functionName: 'setBuyTax',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useWriteIaxeSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useWriteIaxeSetSellTax = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
  functionName: 'setSellTax',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useWriteIaxeSetTreasury = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
  functionName: 'setTreasury',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"withdraw"`
 */
export const useWriteIaxeWithdraw = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
  functionName: 'withdraw',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useWriteIaxeWithdrawToken = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeAbi,
  functionName: 'withdrawToken',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__
 */
export const useSimulateIaxe = /*#__PURE__*/ createUseSimulateContract({
  abi: iaxeAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useSimulateIaxeAddTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeAbi,
    functionName: 'addTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"liquidate"`
 */
export const useSimulateIaxeLiquidate = /*#__PURE__*/ createUseSimulateContract(
  { abi: iaxeAbi, functionName: 'liquidate' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useSimulateIaxeRemoveTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useSimulateIaxeSetBuyTax = /*#__PURE__*/ createUseSimulateContract(
  { abi: iaxeAbi, functionName: 'setBuyTax' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useSimulateIaxeSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useSimulateIaxeSetSellTax =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeAbi,
    functionName: 'setSellTax',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useSimulateIaxeSetTreasury =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeAbi,
    functionName: 'setTreasury',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"withdraw"`
 */
export const useSimulateIaxeWithdraw = /*#__PURE__*/ createUseSimulateContract({
  abi: iaxeAbi,
  functionName: 'withdraw',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useSimulateIaxeWithdrawToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeAbi,
    functionName: 'withdrawToken',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__
 */
export const useWatchIaxeEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: iaxeAbi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"AxeLiquidated"`
 */
export const useWatchIaxeAxeLiquidatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'AxeLiquidated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"BuyTaxApplied"`
 */
export const useWatchIaxeBuyTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'BuyTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"BuyTaxChanged"`
 */
export const useWatchIaxeBuyTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'BuyTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"LiquidationSettingsChanged"`
 */
export const useWatchIaxeLiquidationSettingsChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'LiquidationSettingsChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"NativeWithdrawn"`
 */
export const useWatchIaxeNativeWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'NativeWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"SellTaxApplied"`
 */
export const useWatchIaxeSellTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'SellTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"SellTaxChanged"`
 */
export const useWatchIaxeSellTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'SellTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"TaxablePairAdded"`
 */
export const useWatchIaxeTaxablePairAddedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'TaxablePairAdded',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"TaxablePairRemoved"`
 */
export const useWatchIaxeTaxablePairRemovedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'TaxablePairRemoved',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"TokenWithdrawn"`
 */
export const useWatchIaxeTokenWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'TokenWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeAbi}__ and `eventName` set to `"TreasuryChanged"`
 */
export const useWatchIaxeTreasuryChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeAbi,
    eventName: 'TreasuryChanged',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__
 */
export const useWriteIaxeSource = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeSourceAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useWriteIaxeSourceAddTaxablePair =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeSourceAbi,
    functionName: 'addTaxablePair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"issue"`
 */
export const useWriteIaxeSourceIssue = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeSourceAbi,
  functionName: 'issue',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"liquidate"`
 */
export const useWriteIaxeSourceLiquidate = /*#__PURE__*/ createUseWriteContract(
  { abi: iaxeSourceAbi, functionName: 'liquidate' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useWriteIaxeSourceRemoveTaxablePair =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeSourceAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useWriteIaxeSourceSetBuyTax = /*#__PURE__*/ createUseWriteContract(
  { abi: iaxeSourceAbi, functionName: 'setBuyTax' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useWriteIaxeSourceSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeSourceAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useWriteIaxeSourceSetSellTax =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeSourceAbi,
    functionName: 'setSellTax',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useWriteIaxeSourceSetTreasury =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeSourceAbi,
    functionName: 'setTreasury',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"withdraw"`
 */
export const useWriteIaxeSourceWithdraw = /*#__PURE__*/ createUseWriteContract({
  abi: iaxeSourceAbi,
  functionName: 'withdraw',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useWriteIaxeSourceWithdrawToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: iaxeSourceAbi,
    functionName: 'withdrawToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__
 */
export const useSimulateIaxeSource = /*#__PURE__*/ createUseSimulateContract({
  abi: iaxeSourceAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"addTaxablePair"`
 */
export const useSimulateIaxeSourceAddTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'addTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"issue"`
 */
export const useSimulateIaxeSourceIssue =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'issue',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"liquidate"`
 */
export const useSimulateIaxeSourceLiquidate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'liquidate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"removeTaxablePair"`
 */
export const useSimulateIaxeSourceRemoveTaxablePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'removeTaxablePair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setBuyTax"`
 */
export const useSimulateIaxeSourceSetBuyTax =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'setBuyTax',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setLiquidationRouterAndToken"`
 */
export const useSimulateIaxeSourceSetLiquidationRouterAndToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'setLiquidationRouterAndToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setSellTax"`
 */
export const useSimulateIaxeSourceSetSellTax =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'setSellTax',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"setTreasury"`
 */
export const useSimulateIaxeSourceSetTreasury =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'setTreasury',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"withdraw"`
 */
export const useSimulateIaxeSourceWithdraw =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'withdraw',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iaxeSourceAbi}__ and `functionName` set to `"withdrawToken"`
 */
export const useSimulateIaxeSourceWithdrawToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iaxeSourceAbi,
    functionName: 'withdrawToken',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__
 */
export const useWatchIaxeSourceEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: iaxeSourceAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"AxeIssued"`
 */
export const useWatchIaxeSourceAxeIssuedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'AxeIssued',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"AxeLiquidated"`
 */
export const useWatchIaxeSourceAxeLiquidatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'AxeLiquidated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"BuyTaxApplied"`
 */
export const useWatchIaxeSourceBuyTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'BuyTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"BuyTaxChanged"`
 */
export const useWatchIaxeSourceBuyTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'BuyTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"LiquidationSettingsChanged"`
 */
export const useWatchIaxeSourceLiquidationSettingsChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'LiquidationSettingsChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"NativeWithdrawn"`
 */
export const useWatchIaxeSourceNativeWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'NativeWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"SellTaxApplied"`
 */
export const useWatchIaxeSourceSellTaxAppliedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'SellTaxApplied',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"SellTaxChanged"`
 */
export const useWatchIaxeSourceSellTaxChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'SellTaxChanged',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"TaxablePairAdded"`
 */
export const useWatchIaxeSourceTaxablePairAddedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'TaxablePairAdded',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"TaxablePairRemoved"`
 */
export const useWatchIaxeSourceTaxablePairRemovedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'TaxablePairRemoved',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"TokenWithdrawn"`
 */
export const useWatchIaxeSourceTokenWithdrawnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'TokenWithdrawn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iaxeSourceAbi}__ and `eventName` set to `"TreasuryChanged"`
 */
export const useWatchIaxeSourceTreasuryChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iaxeSourceAbi,
    eventName: 'TreasuryChanged',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__
 */
export const useReadIAxeMembership = /*#__PURE__*/ createUseReadContract({
  abi: iAxeMembershipAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadIAxeMembershipBalanceOf =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'balanceOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getApproved"`
 */
export const useReadIAxeMembershipGetApproved =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getApproved',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getCandidate"`
 */
export const useReadIAxeMembershipGetCandidate =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getCandidate',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getDelegationCountForGroupAtIndex"`
 */
export const useReadIAxeMembershipGetDelegationCountForGroupAtIndex =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getDelegationCountForGroupAtIndex',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getMemberCount"`
 */
export const useReadIAxeMembershipGetMemberCount =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getMemberCount',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getMemberId"`
 */
export const useReadIAxeMembershipGetMemberId =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getMemberId',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getNativeDonationAmount"`
 */
export const useReadIAxeMembershipGetNativeDonationAmount =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getNativeDonationAmount',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getNextRankedCandidate"`
 */
export const useReadIAxeMembershipGetNextRankedCandidate =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getNextRankedCandidate',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getNumberOfRankedGroups"`
 */
export const useReadIAxeMembershipGetNumberOfRankedGroups =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getNumberOfRankedGroups',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getRankedGroupAtIndex"`
 */
export const useReadIAxeMembershipGetRankedGroupAtIndex =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getRankedGroupAtIndex',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getTokenDonationAmount"`
 */
export const useReadIAxeMembershipGetTokenDonationAmount =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getTokenDonationAmount',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"getTopCandidates"`
 */
export const useReadIAxeMembershipGetTopCandidates =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'getTopCandidates',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"isApprovedForAll"`
 */
export const useReadIAxeMembershipIsApprovedForAll =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'isApprovedForAll',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"isMember"`
 */
export const useReadIAxeMembershipIsMember =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'isMember',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"ownerOf"`
 */
export const useReadIAxeMembershipOwnerOf = /*#__PURE__*/ createUseReadContract(
  { abi: iAxeMembershipAbi, functionName: 'ownerOf' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"supportsInterface"`
 */
export const useReadIAxeMembershipSupportsInterface =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipAbi,
    functionName: 'supportsInterface',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__
 */
export const useWriteIAxeMembership = /*#__PURE__*/ createUseWriteContract({
  abi: iAxeMembershipAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteIAxeMembershipApprove =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"delegate"`
 */
export const useWriteIAxeMembershipDelegate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'delegate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"donate"`
 */
export const useWriteIAxeMembershipDonate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'donate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"enlistAsCandidate"`
 */
export const useWriteIAxeMembershipEnlistAsCandidate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'enlistAsCandidate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"resignAsCandidate"`
 */
export const useWriteIAxeMembershipResignAsCandidate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'resignAsCandidate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useWriteIAxeMembershipSafeTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useWriteIAxeMembershipSetApprovalForAll =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setDonationReceiver"`
 */
export const useWriteIAxeMembershipSetDonationReceiver =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'setDonationReceiver',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setDonationToken"`
 */
export const useWriteIAxeMembershipSetDonationToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'setDonationToken',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setNativeDonationAmount"`
 */
export const useWriteIAxeMembershipSetNativeDonationAmount =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'setNativeDonationAmount',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setTokenDonationAmount"`
 */
export const useWriteIAxeMembershipSetTokenDonationAmount =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'setTokenDonationAmount',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteIAxeMembershipTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"undelegate"`
 */
export const useWriteIAxeMembershipUndelegate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipAbi,
    functionName: 'undelegate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__
 */
export const useSimulateIAxeMembership =
  /*#__PURE__*/ createUseSimulateContract({ abi: iAxeMembershipAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateIAxeMembershipApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"delegate"`
 */
export const useSimulateIAxeMembershipDelegate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'delegate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"donate"`
 */
export const useSimulateIAxeMembershipDonate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'donate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"enlistAsCandidate"`
 */
export const useSimulateIAxeMembershipEnlistAsCandidate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'enlistAsCandidate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"resignAsCandidate"`
 */
export const useSimulateIAxeMembershipResignAsCandidate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'resignAsCandidate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useSimulateIAxeMembershipSafeTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useSimulateIAxeMembershipSetApprovalForAll =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setDonationReceiver"`
 */
export const useSimulateIAxeMembershipSetDonationReceiver =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'setDonationReceiver',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setDonationToken"`
 */
export const useSimulateIAxeMembershipSetDonationToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'setDonationToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setNativeDonationAmount"`
 */
export const useSimulateIAxeMembershipSetNativeDonationAmount =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'setNativeDonationAmount',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"setTokenDonationAmount"`
 */
export const useSimulateIAxeMembershipSetTokenDonationAmount =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'setTokenDonationAmount',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateIAxeMembershipTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `functionName` set to `"undelegate"`
 */
export const useSimulateIAxeMembershipUndelegate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipAbi,
    functionName: 'undelegate',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__
 */
export const useWatchIAxeMembershipEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: iAxeMembershipAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchIAxeMembershipApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"ApprovalForAll"`
 */
export const useWatchIAxeMembershipApprovalForAllEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'ApprovalForAll',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"CandidateEnlisted"`
 */
export const useWatchIAxeMembershipCandidateEnlistedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'CandidateEnlisted',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"CandidateResigned"`
 */
export const useWatchIAxeMembershipCandidateResignedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'CandidateResigned',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"ERC20DonationReceived"`
 */
export const useWatchIAxeMembershipErc20DonationReceivedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'ERC20DonationReceived',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"NativeDonationReceived"`
 */
export const useWatchIAxeMembershipNativeDonationReceivedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'NativeDonationReceived',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"ObrigadoMuitoAxe"`
 */
export const useWatchIAxeMembershipObrigadoMuitoAxeEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'ObrigadoMuitoAxe',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchIAxeMembershipTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"VoteDelegated"`
 */
export const useWatchIAxeMembershipVoteDelegatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'VoteDelegated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipAbi}__ and `eventName` set to `"VoteUndelegated"`
 */
export const useWatchIAxeMembershipVoteUndelegatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipAbi,
    eventName: 'VoteUndelegated',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__
 */
export const useReadIAxeMembershipCouncil = /*#__PURE__*/ createUseReadContract(
  { abi: iAxeMembershipCouncilAbi },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"canRequestCouncilUpdate"`
 */
export const useReadIAxeMembershipCouncilCanRequestCouncilUpdate =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'canRequestCouncilUpdate',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"getCouncilMemberAtIndex"`
 */
export const useReadIAxeMembershipCouncilGetCouncilMemberAtIndex =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'getCouncilMemberAtIndex',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"getCurrentCouncilSize"`
 */
export const useReadIAxeMembershipCouncilGetCurrentCouncilSize =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'getCurrentCouncilSize',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"getCurrentMembers"`
 */
export const useReadIAxeMembershipCouncilGetCurrentMembers =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'getCurrentMembers',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"getJoiningMembers"`
 */
export const useReadIAxeMembershipCouncilGetJoiningMembers =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'getJoiningMembers',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"getLeavingMembers"`
 */
export const useReadIAxeMembershipCouncilGetLeavingMembers =
  /*#__PURE__*/ createUseReadContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'getLeavingMembers',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__
 */
export const useWriteIAxeMembershipCouncil =
  /*#__PURE__*/ createUseWriteContract({ abi: iAxeMembershipCouncilAbi })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"claimSeat"`
 */
export const useWriteIAxeMembershipCouncilClaimSeat =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'claimSeat',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"increaseCouncilLimit"`
 */
export const useWriteIAxeMembershipCouncilIncreaseCouncilLimit =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'increaseCouncilLimit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"requestCouncilUpdate"`
 */
export const useWriteIAxeMembershipCouncilRequestCouncilUpdate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'requestCouncilUpdate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__
 */
export const useSimulateIAxeMembershipCouncil =
  /*#__PURE__*/ createUseSimulateContract({ abi: iAxeMembershipCouncilAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"claimSeat"`
 */
export const useSimulateIAxeMembershipCouncilClaimSeat =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'claimSeat',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"increaseCouncilLimit"`
 */
export const useSimulateIAxeMembershipCouncilIncreaseCouncilLimit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'increaseCouncilLimit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `functionName` set to `"requestCouncilUpdate"`
 */
export const useSimulateIAxeMembershipCouncilRequestCouncilUpdate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iAxeMembershipCouncilAbi,
    functionName: 'requestCouncilUpdate',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__
 */
export const useWatchIAxeMembershipCouncilEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: iAxeMembershipCouncilAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `eventName` set to `"CouncilLimitIncreased"`
 */
export const useWatchIAxeMembershipCouncilCouncilLimitIncreasedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipCouncilAbi,
    eventName: 'CouncilLimitIncreased',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `eventName` set to `"CouncilUpdateRequested"`
 */
export const useWatchIAxeMembershipCouncilCouncilUpdateRequestedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipCouncilAbi,
    eventName: 'CouncilUpdateRequested',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iAxeMembershipCouncilAbi}__ and `eventName` set to `"SeatClaimed"`
 */
export const useWatchIAxeMembershipCouncilSeatClaimedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iAxeMembershipCouncilAbi,
    eventName: 'SeatClaimed',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__
 */
export const useReadIBaal = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"adminLock"`
 */
export const useReadIBaalAdminLock = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'adminLock',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"avatar"`
 */
export const useReadIBaalAvatar = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'avatar',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"encodeMultisend"`
 */
export const useReadIBaalEncodeMultisend = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'encodeMultisend',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"governorLock"`
 */
export const useReadIBaalGovernorLock = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'governorLock',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"gracePeriod"`
 */
export const useReadIBaalGracePeriod = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'gracePeriod',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"hashOperation"`
 */
export const useReadIBaalHashOperation = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'hashOperation',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"isAdmin"`
 */
export const useReadIBaalIsAdmin = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'isAdmin',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"isGovernor"`
 */
export const useReadIBaalIsGovernor = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'isGovernor',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"isManager"`
 */
export const useReadIBaalIsManager = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'isManager',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"latestSponsoredProposalId"`
 */
export const useReadIBaalLatestSponsoredProposalId =
  /*#__PURE__*/ createUseReadContract({
    abi: iBaalAbi,
    functionName: 'latestSponsoredProposalId',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lootPaused"`
 */
export const useReadIBaalLootPaused = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'lootPaused',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lootToken"`
 */
export const useReadIBaalLootToken = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'lootToken',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"managerLock"`
 */
export const useReadIBaalManagerLock = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'managerLock',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"minRetentionPercent"`
 */
export const useReadIBaalMinRetentionPercent =
  /*#__PURE__*/ createUseReadContract({
    abi: iBaalAbi,
    functionName: 'minRetentionPercent',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"multisendLibrary"`
 */
export const useReadIBaalMultisendLibrary = /*#__PURE__*/ createUseReadContract(
  { abi: iBaalAbi, functionName: 'multisendLibrary' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"proposalCount"`
 */
export const useReadIBaalProposalCount = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'proposalCount',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"proposalOffering"`
 */
export const useReadIBaalProposalOffering = /*#__PURE__*/ createUseReadContract(
  { abi: iBaalAbi, functionName: 'proposalOffering' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"proposals"`
 */
export const useReadIBaalProposals = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'proposals',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"quorumPercent"`
 */
export const useReadIBaalQuorumPercent = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'quorumPercent',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"shamans"`
 */
export const useReadIBaalShamans = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'shamans',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"sharesPaused"`
 */
export const useReadIBaalSharesPaused = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'sharesPaused',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"sharesToken"`
 */
export const useReadIBaalSharesToken = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'sharesToken',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"sponsorThreshold"`
 */
export const useReadIBaalSponsorThreshold = /*#__PURE__*/ createUseReadContract(
  { abi: iBaalAbi, functionName: 'sponsorThreshold' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"state"`
 */
export const useReadIBaalState = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'state',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"target"`
 */
export const useReadIBaalTarget = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'target',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"totalLoot"`
 */
export const useReadIBaalTotalLoot = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'totalLoot',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"totalShares"`
 */
export const useReadIBaalTotalShares = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'totalShares',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadIBaalTotalSupply = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'totalSupply',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"trustedForwarder"`
 */
export const useReadIBaalTrustedForwarder = /*#__PURE__*/ createUseReadContract(
  { abi: iBaalAbi, functionName: 'trustedForwarder' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"votingPeriod"`
 */
export const useReadIBaalVotingPeriod = /*#__PURE__*/ createUseReadContract({
  abi: iBaalAbi,
  functionName: 'votingPeriod',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__
 */
export const useWriteIBaal = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"burnLoot"`
 */
export const useWriteIBaalBurnLoot = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'burnLoot',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"burnShares"`
 */
export const useWriteIBaalBurnShares = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'burnShares',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"cancelProposal"`
 */
export const useWriteIBaalCancelProposal = /*#__PURE__*/ createUseWriteContract(
  { abi: iBaalAbi, functionName: 'cancelProposal' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"executeAsBaal"`
 */
export const useWriteIBaalExecuteAsBaal = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'executeAsBaal',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"getProposalStatus"`
 */
export const useWriteIBaalGetProposalStatus =
  /*#__PURE__*/ createUseWriteContract({
    abi: iBaalAbi,
    functionName: 'getProposalStatus',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lockAdmin"`
 */
export const useWriteIBaalLockAdmin = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'lockAdmin',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lockGovernor"`
 */
export const useWriteIBaalLockGovernor = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'lockGovernor',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lockManager"`
 */
export const useWriteIBaalLockManager = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'lockManager',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"mintLoot"`
 */
export const useWriteIBaalMintLoot = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'mintLoot',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"mintShares"`
 */
export const useWriteIBaalMintShares = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'mintShares',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"processProposal"`
 */
export const useWriteIBaalProcessProposal =
  /*#__PURE__*/ createUseWriteContract({
    abi: iBaalAbi,
    functionName: 'processProposal',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"ragequit"`
 */
export const useWriteIBaalRagequit = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'ragequit',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setAdminConfig"`
 */
export const useWriteIBaalSetAdminConfig = /*#__PURE__*/ createUseWriteContract(
  { abi: iBaalAbi, functionName: 'setAdminConfig' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setAvatar"`
 */
export const useWriteIBaalSetAvatar = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'setAvatar',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setGovernanceConfig"`
 */
export const useWriteIBaalSetGovernanceConfig =
  /*#__PURE__*/ createUseWriteContract({
    abi: iBaalAbi,
    functionName: 'setGovernanceConfig',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setShamans"`
 */
export const useWriteIBaalSetShamans = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'setShamans',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setTarget"`
 */
export const useWriteIBaalSetTarget = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'setTarget',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setTrustedForwarder"`
 */
export const useWriteIBaalSetTrustedForwarder =
  /*#__PURE__*/ createUseWriteContract({
    abi: iBaalAbi,
    functionName: 'setTrustedForwarder',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setUp"`
 */
export const useWriteIBaalSetUp = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'setUp',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"sponsorProposal"`
 */
export const useWriteIBaalSponsorProposal =
  /*#__PURE__*/ createUseWriteContract({
    abi: iBaalAbi,
    functionName: 'sponsorProposal',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"submitProposal"`
 */
export const useWriteIBaalSubmitProposal = /*#__PURE__*/ createUseWriteContract(
  { abi: iBaalAbi, functionName: 'submitProposal' },
)

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"submitVote"`
 */
export const useWriteIBaalSubmitVote = /*#__PURE__*/ createUseWriteContract({
  abi: iBaalAbi,
  functionName: 'submitVote',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"submitVoteWithSig"`
 */
export const useWriteIBaalSubmitVoteWithSig =
  /*#__PURE__*/ createUseWriteContract({
    abi: iBaalAbi,
    functionName: 'submitVoteWithSig',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__
 */
export const useSimulateIBaal = /*#__PURE__*/ createUseSimulateContract({
  abi: iBaalAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"burnLoot"`
 */
export const useSimulateIBaalBurnLoot = /*#__PURE__*/ createUseSimulateContract(
  { abi: iBaalAbi, functionName: 'burnLoot' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"burnShares"`
 */
export const useSimulateIBaalBurnShares =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'burnShares',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"cancelProposal"`
 */
export const useSimulateIBaalCancelProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'cancelProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"executeAsBaal"`
 */
export const useSimulateIBaalExecuteAsBaal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'executeAsBaal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"getProposalStatus"`
 */
export const useSimulateIBaalGetProposalStatus =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'getProposalStatus',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lockAdmin"`
 */
export const useSimulateIBaalLockAdmin =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'lockAdmin',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lockGovernor"`
 */
export const useSimulateIBaalLockGovernor =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'lockGovernor',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"lockManager"`
 */
export const useSimulateIBaalLockManager =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'lockManager',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"mintLoot"`
 */
export const useSimulateIBaalMintLoot = /*#__PURE__*/ createUseSimulateContract(
  { abi: iBaalAbi, functionName: 'mintLoot' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"mintShares"`
 */
export const useSimulateIBaalMintShares =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'mintShares',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"processProposal"`
 */
export const useSimulateIBaalProcessProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'processProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"ragequit"`
 */
export const useSimulateIBaalRagequit = /*#__PURE__*/ createUseSimulateContract(
  { abi: iBaalAbi, functionName: 'ragequit' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setAdminConfig"`
 */
export const useSimulateIBaalSetAdminConfig =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'setAdminConfig',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setAvatar"`
 */
export const useSimulateIBaalSetAvatar =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'setAvatar',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setGovernanceConfig"`
 */
export const useSimulateIBaalSetGovernanceConfig =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'setGovernanceConfig',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setShamans"`
 */
export const useSimulateIBaalSetShamans =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'setShamans',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setTarget"`
 */
export const useSimulateIBaalSetTarget =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'setTarget',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setTrustedForwarder"`
 */
export const useSimulateIBaalSetTrustedForwarder =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'setTrustedForwarder',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"setUp"`
 */
export const useSimulateIBaalSetUp = /*#__PURE__*/ createUseSimulateContract({
  abi: iBaalAbi,
  functionName: 'setUp',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"sponsorProposal"`
 */
export const useSimulateIBaalSponsorProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'sponsorProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"submitProposal"`
 */
export const useSimulateIBaalSubmitProposal =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'submitProposal',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"submitVote"`
 */
export const useSimulateIBaalSubmitVote =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'submitVote',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iBaalAbi}__ and `functionName` set to `"submitVoteWithSig"`
 */
export const useSimulateIBaalSubmitVoteWithSig =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iBaalAbi,
    functionName: 'submitVoteWithSig',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link icreate3FactoryAbi}__
 */
export const useReadIcreate3Factory = /*#__PURE__*/ createUseReadContract({
  abi: icreate3FactoryAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link icreate3FactoryAbi}__ and `functionName` set to `"getDeployed"`
 */
export const useReadIcreate3FactoryGetDeployed =
  /*#__PURE__*/ createUseReadContract({
    abi: icreate3FactoryAbi,
    functionName: 'getDeployed',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link icreate3FactoryAbi}__
 */
export const useWriteIcreate3Factory = /*#__PURE__*/ createUseWriteContract({
  abi: icreate3FactoryAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link icreate3FactoryAbi}__ and `functionName` set to `"deploy"`
 */
export const useWriteIcreate3FactoryDeploy =
  /*#__PURE__*/ createUseWriteContract({
    abi: icreate3FactoryAbi,
    functionName: 'deploy',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link icreate3FactoryAbi}__
 */
export const useSimulateIcreate3Factory =
  /*#__PURE__*/ createUseSimulateContract({ abi: icreate3FactoryAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link icreate3FactoryAbi}__ and `functionName` set to `"deploy"`
 */
export const useSimulateIcreate3FactoryDeploy =
  /*#__PURE__*/ createUseSimulateContract({
    abi: icreate3FactoryAbi,
    functionName: 'deploy',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc1363Abi}__
 */
export const useReadIerc1363 = /*#__PURE__*/ createUseReadContract({
  abi: ierc1363Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"allowance"`
 */
export const useReadIerc1363Allowance = /*#__PURE__*/ createUseReadContract({
  abi: ierc1363Abi,
  functionName: 'allowance',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadIerc1363BalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: ierc1363Abi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"supportsInterface"`
 */
export const useReadIerc1363SupportsInterface =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc1363Abi,
    functionName: 'supportsInterface',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadIerc1363TotalSupply = /*#__PURE__*/ createUseReadContract({
  abi: ierc1363Abi,
  functionName: 'totalSupply',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc1363Abi}__
 */
export const useWriteIerc1363 = /*#__PURE__*/ createUseWriteContract({
  abi: ierc1363Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"approve"`
 */
export const useWriteIerc1363Approve = /*#__PURE__*/ createUseWriteContract({
  abi: ierc1363Abi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"approveAndCall"`
 */
export const useWriteIerc1363ApproveAndCall =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc1363Abi,
    functionName: 'approveAndCall',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transfer"`
 */
export const useWriteIerc1363Transfer = /*#__PURE__*/ createUseWriteContract({
  abi: ierc1363Abi,
  functionName: 'transfer',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transferAndCall"`
 */
export const useWriteIerc1363TransferAndCall =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc1363Abi,
    functionName: 'transferAndCall',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteIerc1363TransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc1363Abi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transferFromAndCall"`
 */
export const useWriteIerc1363TransferFromAndCall =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc1363Abi,
    functionName: 'transferFromAndCall',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc1363Abi}__
 */
export const useSimulateIerc1363 = /*#__PURE__*/ createUseSimulateContract({
  abi: ierc1363Abi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"approve"`
 */
export const useSimulateIerc1363Approve =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc1363Abi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"approveAndCall"`
 */
export const useSimulateIerc1363ApproveAndCall =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc1363Abi,
    functionName: 'approveAndCall',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateIerc1363Transfer =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc1363Abi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transferAndCall"`
 */
export const useSimulateIerc1363TransferAndCall =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc1363Abi,
    functionName: 'transferAndCall',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateIerc1363TransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc1363Abi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc1363Abi}__ and `functionName` set to `"transferFromAndCall"`
 */
export const useSimulateIerc1363TransferFromAndCall =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc1363Abi,
    functionName: 'transferFromAndCall',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc1363Abi}__
 */
export const useWatchIerc1363Event = /*#__PURE__*/ createUseWatchContractEvent({
  abi: ierc1363Abi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc1363Abi}__ and `eventName` set to `"Approval"`
 */
export const useWatchIerc1363ApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc1363Abi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc1363Abi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchIerc1363TransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc1363Abi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20MetadataAbi}__
 */
export const useReadIerc20Metadata = /*#__PURE__*/ createUseReadContract({
  abi: ierc20MetadataAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"allowance"`
 */
export const useReadIerc20MetadataAllowance =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc20MetadataAbi,
    functionName: 'allowance',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadIerc20MetadataBalanceOf =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc20MetadataAbi,
    functionName: 'balanceOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"decimals"`
 */
export const useReadIerc20MetadataDecimals =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc20MetadataAbi,
    functionName: 'decimals',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"name"`
 */
export const useReadIerc20MetadataName = /*#__PURE__*/ createUseReadContract({
  abi: ierc20MetadataAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadIerc20MetadataSymbol = /*#__PURE__*/ createUseReadContract({
  abi: ierc20MetadataAbi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadIerc20MetadataTotalSupply =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc20MetadataAbi,
    functionName: 'totalSupply',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc20MetadataAbi}__
 */
export const useWriteIerc20Metadata = /*#__PURE__*/ createUseWriteContract({
  abi: ierc20MetadataAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteIerc20MetadataApprove =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc20MetadataAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"transfer"`
 */
export const useWriteIerc20MetadataTransfer =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc20MetadataAbi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteIerc20MetadataTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc20MetadataAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc20MetadataAbi}__
 */
export const useSimulateIerc20Metadata =
  /*#__PURE__*/ createUseSimulateContract({ abi: ierc20MetadataAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateIerc20MetadataApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc20MetadataAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateIerc20MetadataTransfer =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc20MetadataAbi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateIerc20MetadataTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc20MetadataAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc20MetadataAbi}__
 */
export const useWatchIerc20MetadataEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: ierc20MetadataAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchIerc20MetadataApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc20MetadataAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc20MetadataAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchIerc20MetadataTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc20MetadataAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20PermitAbi}__
 */
export const useReadIerc20Permit = /*#__PURE__*/ createUseReadContract({
  abi: ierc20PermitAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20PermitAbi}__ and `functionName` set to `"DOMAIN_SEPARATOR"`
 */
export const useReadIerc20PermitDomainSeparator =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc20PermitAbi,
    functionName: 'DOMAIN_SEPARATOR',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc20PermitAbi}__ and `functionName` set to `"nonces"`
 */
export const useReadIerc20PermitNonces = /*#__PURE__*/ createUseReadContract({
  abi: ierc20PermitAbi,
  functionName: 'nonces',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc20PermitAbi}__
 */
export const useWriteIerc20Permit = /*#__PURE__*/ createUseWriteContract({
  abi: ierc20PermitAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc20PermitAbi}__ and `functionName` set to `"permit"`
 */
export const useWriteIerc20PermitPermit = /*#__PURE__*/ createUseWriteContract({
  abi: ierc20PermitAbi,
  functionName: 'permit',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc20PermitAbi}__
 */
export const useSimulateIerc20Permit = /*#__PURE__*/ createUseSimulateContract({
  abi: ierc20PermitAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc20PermitAbi}__ and `functionName` set to `"permit"`
 */
export const useSimulateIerc20PermitPermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc20PermitAbi,
    functionName: 'permit',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc5267Abi}__
 */
export const useReadIerc5267 = /*#__PURE__*/ createUseReadContract({
  abi: ierc5267Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc5267Abi}__ and `functionName` set to `"eip712Domain"`
 */
export const useReadIerc5267Eip712Domain = /*#__PURE__*/ createUseReadContract({
  abi: ierc5267Abi,
  functionName: 'eip712Domain',
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc5267Abi}__
 */
export const useWatchIerc5267Event = /*#__PURE__*/ createUseWatchContractEvent({
  abi: ierc5267Abi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc5267Abi}__ and `eventName` set to `"EIP712DomainChanged"`
 */
export const useWatchIerc5267Eip712DomainChangedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc5267Abi,
    eventName: 'EIP712DomainChanged',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__
 */
export const useReadIerc721Metadata = /*#__PURE__*/ createUseReadContract({
  abi: ierc721MetadataAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadIerc721MetadataBalanceOf =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc721MetadataAbi,
    functionName: 'balanceOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"getApproved"`
 */
export const useReadIerc721MetadataGetApproved =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc721MetadataAbi,
    functionName: 'getApproved',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"isApprovedForAll"`
 */
export const useReadIerc721MetadataIsApprovedForAll =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc721MetadataAbi,
    functionName: 'isApprovedForAll',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"name"`
 */
export const useReadIerc721MetadataName = /*#__PURE__*/ createUseReadContract({
  abi: ierc721MetadataAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"ownerOf"`
 */
export const useReadIerc721MetadataOwnerOf =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc721MetadataAbi,
    functionName: 'ownerOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"supportsInterface"`
 */
export const useReadIerc721MetadataSupportsInterface =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc721MetadataAbi,
    functionName: 'supportsInterface',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadIerc721MetadataSymbol = /*#__PURE__*/ createUseReadContract(
  { abi: ierc721MetadataAbi, functionName: 'symbol' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"tokenURI"`
 */
export const useReadIerc721MetadataTokenUri =
  /*#__PURE__*/ createUseReadContract({
    abi: ierc721MetadataAbi,
    functionName: 'tokenURI',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc721MetadataAbi}__
 */
export const useWriteIerc721Metadata = /*#__PURE__*/ createUseWriteContract({
  abi: ierc721MetadataAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteIerc721MetadataApprove =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc721MetadataAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useWriteIerc721MetadataSafeTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc721MetadataAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useWriteIerc721MetadataSetApprovalForAll =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc721MetadataAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteIerc721MetadataTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc721MetadataAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc721MetadataAbi}__
 */
export const useSimulateIerc721Metadata =
  /*#__PURE__*/ createUseSimulateContract({ abi: ierc721MetadataAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateIerc721MetadataApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc721MetadataAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useSimulateIerc721MetadataSafeTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc721MetadataAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useSimulateIerc721MetadataSetApprovalForAll =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc721MetadataAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateIerc721MetadataTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc721MetadataAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc721MetadataAbi}__
 */
export const useWatchIerc721MetadataEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: ierc721MetadataAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchIerc721MetadataApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc721MetadataAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `eventName` set to `"ApprovalForAll"`
 */
export const useWatchIerc721MetadataApprovalForAllEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc721MetadataAbi,
    eventName: 'ApprovalForAll',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ierc721MetadataAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchIerc721MetadataTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ierc721MetadataAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc721ReceiverAbi}__
 */
export const useWriteIerc721Receiver = /*#__PURE__*/ createUseWriteContract({
  abi: ierc721ReceiverAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ierc721ReceiverAbi}__ and `functionName` set to `"onERC721Received"`
 */
export const useWriteIerc721ReceiverOnErc721Received =
  /*#__PURE__*/ createUseWriteContract({
    abi: ierc721ReceiverAbi,
    functionName: 'onERC721Received',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc721ReceiverAbi}__
 */
export const useSimulateIerc721Receiver =
  /*#__PURE__*/ createUseSimulateContract({ abi: ierc721ReceiverAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ierc721ReceiverAbi}__ and `functionName` set to `"onERC721Received"`
 */
export const useSimulateIerc721ReceiverOnErc721Received =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ierc721ReceiverAbi,
    functionName: 'onERC721Received',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__
 */
export const useReadIMulticall3 = /*#__PURE__*/ createUseReadContract({
  abi: iMulticall3Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getBasefee"`
 */
export const useReadIMulticall3GetBasefee = /*#__PURE__*/ createUseReadContract(
  { abi: iMulticall3Abi, functionName: 'getBasefee' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getBlockHash"`
 */
export const useReadIMulticall3GetBlockHash =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getBlockHash',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getBlockNumber"`
 */
export const useReadIMulticall3GetBlockNumber =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getBlockNumber',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getChainId"`
 */
export const useReadIMulticall3GetChainId = /*#__PURE__*/ createUseReadContract(
  { abi: iMulticall3Abi, functionName: 'getChainId' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getCurrentBlockCoinbase"`
 */
export const useReadIMulticall3GetCurrentBlockCoinbase =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getCurrentBlockCoinbase',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getCurrentBlockDifficulty"`
 */
export const useReadIMulticall3GetCurrentBlockDifficulty =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getCurrentBlockDifficulty',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getCurrentBlockGasLimit"`
 */
export const useReadIMulticall3GetCurrentBlockGasLimit =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getCurrentBlockGasLimit',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getCurrentBlockTimestamp"`
 */
export const useReadIMulticall3GetCurrentBlockTimestamp =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getCurrentBlockTimestamp',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getEthBalance"`
 */
export const useReadIMulticall3GetEthBalance =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getEthBalance',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"getLastBlockHash"`
 */
export const useReadIMulticall3GetLastBlockHash =
  /*#__PURE__*/ createUseReadContract({
    abi: iMulticall3Abi,
    functionName: 'getLastBlockHash',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iMulticall3Abi}__
 */
export const useWriteIMulticall3 = /*#__PURE__*/ createUseWriteContract({
  abi: iMulticall3Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"aggregate"`
 */
export const useWriteIMulticall3Aggregate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iMulticall3Abi,
    functionName: 'aggregate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"aggregate3"`
 */
export const useWriteIMulticall3Aggregate3 =
  /*#__PURE__*/ createUseWriteContract({
    abi: iMulticall3Abi,
    functionName: 'aggregate3',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"aggregate3Value"`
 */
export const useWriteIMulticall3Aggregate3Value =
  /*#__PURE__*/ createUseWriteContract({
    abi: iMulticall3Abi,
    functionName: 'aggregate3Value',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"blockAndAggregate"`
 */
export const useWriteIMulticall3BlockAndAggregate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iMulticall3Abi,
    functionName: 'blockAndAggregate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"tryAggregate"`
 */
export const useWriteIMulticall3TryAggregate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iMulticall3Abi,
    functionName: 'tryAggregate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"tryBlockAndAggregate"`
 */
export const useWriteIMulticall3TryBlockAndAggregate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iMulticall3Abi,
    functionName: 'tryBlockAndAggregate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iMulticall3Abi}__
 */
export const useSimulateIMulticall3 = /*#__PURE__*/ createUseSimulateContract({
  abi: iMulticall3Abi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"aggregate"`
 */
export const useSimulateIMulticall3Aggregate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iMulticall3Abi,
    functionName: 'aggregate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"aggregate3"`
 */
export const useSimulateIMulticall3Aggregate3 =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iMulticall3Abi,
    functionName: 'aggregate3',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"aggregate3Value"`
 */
export const useSimulateIMulticall3Aggregate3Value =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iMulticall3Abi,
    functionName: 'aggregate3Value',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"blockAndAggregate"`
 */
export const useSimulateIMulticall3BlockAndAggregate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iMulticall3Abi,
    functionName: 'blockAndAggregate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"tryAggregate"`
 */
export const useSimulateIMulticall3TryAggregate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iMulticall3Abi,
    functionName: 'tryAggregate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iMulticall3Abi}__ and `functionName` set to `"tryBlockAndAggregate"`
 */
export const useSimulateIMulticall3TryBlockAndAggregate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iMulticall3Abi,
    functionName: 'tryBlockAndAggregate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__
 */
export const useWriteITreasuryShaman = /*#__PURE__*/ createUseWriteContract({
  abi: iTreasuryShamanAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `functionName` set to `"deposit"`
 */
export const useWriteITreasuryShamanDeposit =
  /*#__PURE__*/ createUseWriteContract({
    abi: iTreasuryShamanAbi,
    functionName: 'deposit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `functionName` set to `"setConversionRate"`
 */
export const useWriteITreasuryShamanSetConversionRate =
  /*#__PURE__*/ createUseWriteContract({
    abi: iTreasuryShamanAbi,
    functionName: 'setConversionRate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `functionName` set to `"setDepositToken"`
 */
export const useWriteITreasuryShamanSetDepositToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: iTreasuryShamanAbi,
    functionName: 'setDepositToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__
 */
export const useSimulateITreasuryShaman =
  /*#__PURE__*/ createUseSimulateContract({ abi: iTreasuryShamanAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `functionName` set to `"deposit"`
 */
export const useSimulateITreasuryShamanDeposit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iTreasuryShamanAbi,
    functionName: 'deposit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `functionName` set to `"setConversionRate"`
 */
export const useSimulateITreasuryShamanSetConversionRate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iTreasuryShamanAbi,
    functionName: 'setConversionRate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `functionName` set to `"setDepositToken"`
 */
export const useSimulateITreasuryShamanSetDepositToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iTreasuryShamanAbi,
    functionName: 'setDepositToken',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iTreasuryShamanAbi}__
 */
export const useWatchITreasuryShamanEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: iTreasuryShamanAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `eventName` set to `"ConversionRateUpdated"`
 */
export const useWatchITreasuryShamanConversionRateUpdatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iTreasuryShamanAbi,
    eventName: 'ConversionRateUpdated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `eventName` set to `"DepositTokenUpdated"`
 */
export const useWatchITreasuryShamanDepositTokenUpdatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iTreasuryShamanAbi,
    eventName: 'DepositTokenUpdated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iTreasuryShamanAbi}__ and `eventName` set to `"TreasuryDepositReceived"`
 */
export const useWatchITreasuryShamanTreasuryDepositReceivedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iTreasuryShamanAbi,
    eventName: 'TreasuryDepositReceived',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__
 */
export const useReadIUniswapV2Factory = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2FactoryAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"allPairs"`
 */
export const useReadIUniswapV2FactoryAllPairs =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'allPairs',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"allPairsLength"`
 */
export const useReadIUniswapV2FactoryAllPairsLength =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'allPairsLength',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"feeTo"`
 */
export const useReadIUniswapV2FactoryFeeTo =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'feeTo',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"feeToSetter"`
 */
export const useReadIUniswapV2FactoryFeeToSetter =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'feeToSetter',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"getPair"`
 */
export const useReadIUniswapV2FactoryGetPair =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'getPair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__
 */
export const useWriteIUniswapV2Factory = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2FactoryAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"createPair"`
 */
export const useWriteIUniswapV2FactoryCreatePair =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'createPair',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"setFeeTo"`
 */
export const useWriteIUniswapV2FactorySetFeeTo =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'setFeeTo',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"setFeeToSetter"`
 */
export const useWriteIUniswapV2FactorySetFeeToSetter =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'setFeeToSetter',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__
 */
export const useSimulateIUniswapV2Factory =
  /*#__PURE__*/ createUseSimulateContract({ abi: iUniswapV2FactoryAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"createPair"`
 */
export const useSimulateIUniswapV2FactoryCreatePair =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'createPair',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"setFeeTo"`
 */
export const useSimulateIUniswapV2FactorySetFeeTo =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'setFeeTo',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `functionName` set to `"setFeeToSetter"`
 */
export const useSimulateIUniswapV2FactorySetFeeToSetter =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2FactoryAbi,
    functionName: 'setFeeToSetter',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__
 */
export const useWatchIUniswapV2FactoryEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: iUniswapV2FactoryAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2FactoryAbi}__ and `eventName` set to `"PairCreated"`
 */
export const useWatchIUniswapV2FactoryPairCreatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iUniswapV2FactoryAbi,
    eventName: 'PairCreated',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__
 */
export const useReadIUniswapV2Pair = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2PairAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"DOMAIN_SEPARATOR"`
 */
export const useReadIUniswapV2PairDomainSeparator =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'DOMAIN_SEPARATOR',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"MINIMUM_LIQUIDITY"`
 */
export const useReadIUniswapV2PairMinimumLiquidity =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'MINIMUM_LIQUIDITY',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"PERMIT_TYPEHASH"`
 */
export const useReadIUniswapV2PairPermitTypehash =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'PERMIT_TYPEHASH',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"allowance"`
 */
export const useReadIUniswapV2PairAllowance =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'allowance',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadIUniswapV2PairBalanceOf =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'balanceOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"decimals"`
 */
export const useReadIUniswapV2PairDecimals =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'decimals',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"factory"`
 */
export const useReadIUniswapV2PairFactory = /*#__PURE__*/ createUseReadContract(
  { abi: iUniswapV2PairAbi, functionName: 'factory' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"getReserves"`
 */
export const useReadIUniswapV2PairGetReserves =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'getReserves',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"kLast"`
 */
export const useReadIUniswapV2PairKLast = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2PairAbi,
  functionName: 'kLast',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"name"`
 */
export const useReadIUniswapV2PairName = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2PairAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"nonces"`
 */
export const useReadIUniswapV2PairNonces = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2PairAbi,
  functionName: 'nonces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"price0CumulativeLast"`
 */
export const useReadIUniswapV2PairPrice0CumulativeLast =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'price0CumulativeLast',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"price1CumulativeLast"`
 */
export const useReadIUniswapV2PairPrice1CumulativeLast =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'price1CumulativeLast',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadIUniswapV2PairSymbol = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2PairAbi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"token0"`
 */
export const useReadIUniswapV2PairToken0 = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2PairAbi,
  functionName: 'token0',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"token1"`
 */
export const useReadIUniswapV2PairToken1 = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2PairAbi,
  functionName: 'token1',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"totalSupply"`
 */
export const useReadIUniswapV2PairTotalSupply =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2PairAbi,
    functionName: 'totalSupply',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__
 */
export const useWriteIUniswapV2Pair = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2PairAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteIUniswapV2PairApprove =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2PairAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"burn"`
 */
export const useWriteIUniswapV2PairBurn = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2PairAbi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"initialize"`
 */
export const useWriteIUniswapV2PairInitialize =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2PairAbi,
    functionName: 'initialize',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"mint"`
 */
export const useWriteIUniswapV2PairMint = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2PairAbi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"permit"`
 */
export const useWriteIUniswapV2PairPermit =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2PairAbi,
    functionName: 'permit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"skim"`
 */
export const useWriteIUniswapV2PairSkim = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2PairAbi,
  functionName: 'skim',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"swap"`
 */
export const useWriteIUniswapV2PairSwap = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2PairAbi,
  functionName: 'swap',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"sync"`
 */
export const useWriteIUniswapV2PairSync = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2PairAbi,
  functionName: 'sync',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"transfer"`
 */
export const useWriteIUniswapV2PairTransfer =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2PairAbi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteIUniswapV2PairTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2PairAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__
 */
export const useSimulateIUniswapV2Pair =
  /*#__PURE__*/ createUseSimulateContract({ abi: iUniswapV2PairAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateIUniswapV2PairApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"burn"`
 */
export const useSimulateIUniswapV2PairBurn =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'burn',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"initialize"`
 */
export const useSimulateIUniswapV2PairInitialize =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'initialize',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"mint"`
 */
export const useSimulateIUniswapV2PairMint =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'mint',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"permit"`
 */
export const useSimulateIUniswapV2PairPermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'permit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"skim"`
 */
export const useSimulateIUniswapV2PairSkim =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'skim',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"swap"`
 */
export const useSimulateIUniswapV2PairSwap =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'swap',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"sync"`
 */
export const useSimulateIUniswapV2PairSync =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'sync',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"transfer"`
 */
export const useSimulateIUniswapV2PairTransfer =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'transfer',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateIUniswapV2PairTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2PairAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2PairAbi}__
 */
export const useWatchIUniswapV2PairEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: iUniswapV2PairAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchIUniswapV2PairApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iUniswapV2PairAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `eventName` set to `"Burn"`
 */
export const useWatchIUniswapV2PairBurnEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iUniswapV2PairAbi,
    eventName: 'Burn',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `eventName` set to `"Mint"`
 */
export const useWatchIUniswapV2PairMintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iUniswapV2PairAbi,
    eventName: 'Mint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `eventName` set to `"Swap"`
 */
export const useWatchIUniswapV2PairSwapEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iUniswapV2PairAbi,
    eventName: 'Swap',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `eventName` set to `"Sync"`
 */
export const useWatchIUniswapV2PairSyncEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iUniswapV2PairAbi,
    eventName: 'Sync',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link iUniswapV2PairAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchIUniswapV2PairTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: iUniswapV2PairAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__
 */
export const useReadIUniswapV2Router01 = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2Router01Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"WETH"`
 */
export const useReadIUniswapV2Router01Weth =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'WETH',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"factory"`
 */
export const useReadIUniswapV2Router01Factory =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'factory',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"getAmountIn"`
 */
export const useReadIUniswapV2Router01GetAmountIn =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'getAmountIn',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"getAmountOut"`
 */
export const useReadIUniswapV2Router01GetAmountOut =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'getAmountOut',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"getAmountsIn"`
 */
export const useReadIUniswapV2Router01GetAmountsIn =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'getAmountsIn',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"getAmountsOut"`
 */
export const useReadIUniswapV2Router01GetAmountsOut =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'getAmountsOut',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"quote"`
 */
export const useReadIUniswapV2Router01Quote =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'quote',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__
 */
export const useWriteIUniswapV2Router01 = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2Router01Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"addLiquidity"`
 */
export const useWriteIUniswapV2Router01AddLiquidity =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'addLiquidity',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"addLiquidityETH"`
 */
export const useWriteIUniswapV2Router01AddLiquidityEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'addLiquidityETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidity"`
 */
export const useWriteIUniswapV2Router01RemoveLiquidity =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidity',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidityETH"`
 */
export const useWriteIUniswapV2Router01RemoveLiquidityEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidityETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidityETHWithPermit"`
 */
export const useWriteIUniswapV2Router01RemoveLiquidityEthWithPermit =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidityETHWithPermit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidityWithPermit"`
 */
export const useWriteIUniswapV2Router01RemoveLiquidityWithPermit =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidityWithPermit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapETHForExactTokens"`
 */
export const useWriteIUniswapV2Router01SwapEthForExactTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapETHForExactTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapExactETHForTokens"`
 */
export const useWriteIUniswapV2Router01SwapExactEthForTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapExactETHForTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapExactTokensForETH"`
 */
export const useWriteIUniswapV2Router01SwapExactTokensForEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapExactTokensForETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapExactTokensForTokens"`
 */
export const useWriteIUniswapV2Router01SwapExactTokensForTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapExactTokensForTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapTokensForExactETH"`
 */
export const useWriteIUniswapV2Router01SwapTokensForExactEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapTokensForExactETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapTokensForExactTokens"`
 */
export const useWriteIUniswapV2Router01SwapTokensForExactTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapTokensForExactTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__
 */
export const useSimulateIUniswapV2Router01 =
  /*#__PURE__*/ createUseSimulateContract({ abi: iUniswapV2Router01Abi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"addLiquidity"`
 */
export const useSimulateIUniswapV2Router01AddLiquidity =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'addLiquidity',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"addLiquidityETH"`
 */
export const useSimulateIUniswapV2Router01AddLiquidityEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'addLiquidityETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidity"`
 */
export const useSimulateIUniswapV2Router01RemoveLiquidity =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidity',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidityETH"`
 */
export const useSimulateIUniswapV2Router01RemoveLiquidityEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidityETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidityETHWithPermit"`
 */
export const useSimulateIUniswapV2Router01RemoveLiquidityEthWithPermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidityETHWithPermit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"removeLiquidityWithPermit"`
 */
export const useSimulateIUniswapV2Router01RemoveLiquidityWithPermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'removeLiquidityWithPermit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapETHForExactTokens"`
 */
export const useSimulateIUniswapV2Router01SwapEthForExactTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapETHForExactTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapExactETHForTokens"`
 */
export const useSimulateIUniswapV2Router01SwapExactEthForTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapExactETHForTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapExactTokensForETH"`
 */
export const useSimulateIUniswapV2Router01SwapExactTokensForEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapExactTokensForETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapExactTokensForTokens"`
 */
export const useSimulateIUniswapV2Router01SwapExactTokensForTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapExactTokensForTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapTokensForExactETH"`
 */
export const useSimulateIUniswapV2Router01SwapTokensForExactEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapTokensForExactETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router01Abi}__ and `functionName` set to `"swapTokensForExactTokens"`
 */
export const useSimulateIUniswapV2Router01SwapTokensForExactTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router01Abi,
    functionName: 'swapTokensForExactTokens',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__
 */
export const useReadIUniswapV2Router02 = /*#__PURE__*/ createUseReadContract({
  abi: iUniswapV2Router02Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"WETH"`
 */
export const useReadIUniswapV2Router02Weth =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'WETH',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"factory"`
 */
export const useReadIUniswapV2Router02Factory =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'factory',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"getAmountIn"`
 */
export const useReadIUniswapV2Router02GetAmountIn =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'getAmountIn',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"getAmountOut"`
 */
export const useReadIUniswapV2Router02GetAmountOut =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'getAmountOut',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"getAmountsIn"`
 */
export const useReadIUniswapV2Router02GetAmountsIn =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'getAmountsIn',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"getAmountsOut"`
 */
export const useReadIUniswapV2Router02GetAmountsOut =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'getAmountsOut',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"quote"`
 */
export const useReadIUniswapV2Router02Quote =
  /*#__PURE__*/ createUseReadContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'quote',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__
 */
export const useWriteIUniswapV2Router02 = /*#__PURE__*/ createUseWriteContract({
  abi: iUniswapV2Router02Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"addLiquidity"`
 */
export const useWriteIUniswapV2Router02AddLiquidity =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'addLiquidity',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"addLiquidityETH"`
 */
export const useWriteIUniswapV2Router02AddLiquidityEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'addLiquidityETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidity"`
 */
export const useWriteIUniswapV2Router02RemoveLiquidity =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidity',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETH"`
 */
export const useWriteIUniswapV2Router02RemoveLiquidityEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETHSupportingFeeOnTransferTokens"`
 */
export const useWriteIUniswapV2Router02RemoveLiquidityEthSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETHSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETHWithPermit"`
 */
export const useWriteIUniswapV2Router02RemoveLiquidityEthWithPermit =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETHWithPermit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETHWithPermitSupportingFeeOnTransferTokens"`
 */
export const useWriteIUniswapV2Router02RemoveLiquidityEthWithPermitSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETHWithPermitSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityWithPermit"`
 */
export const useWriteIUniswapV2Router02RemoveLiquidityWithPermit =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityWithPermit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapETHForExactTokens"`
 */
export const useWriteIUniswapV2Router02SwapEthForExactTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapETHForExactTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactETHForTokens"`
 */
export const useWriteIUniswapV2Router02SwapExactEthForTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactETHForTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactETHForTokensSupportingFeeOnTransferTokens"`
 */
export const useWriteIUniswapV2Router02SwapExactEthForTokensSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactETHForTokensSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForETH"`
 */
export const useWriteIUniswapV2Router02SwapExactTokensForEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForETHSupportingFeeOnTransferTokens"`
 */
export const useWriteIUniswapV2Router02SwapExactTokensForEthSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForETHSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForTokens"`
 */
export const useWriteIUniswapV2Router02SwapExactTokensForTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForTokensSupportingFeeOnTransferTokens"`
 */
export const useWriteIUniswapV2Router02SwapExactTokensForTokensSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForTokensSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapTokensForExactETH"`
 */
export const useWriteIUniswapV2Router02SwapTokensForExactEth =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapTokensForExactETH',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapTokensForExactTokens"`
 */
export const useWriteIUniswapV2Router02SwapTokensForExactTokens =
  /*#__PURE__*/ createUseWriteContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapTokensForExactTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__
 */
export const useSimulateIUniswapV2Router02 =
  /*#__PURE__*/ createUseSimulateContract({ abi: iUniswapV2Router02Abi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"addLiquidity"`
 */
export const useSimulateIUniswapV2Router02AddLiquidity =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'addLiquidity',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"addLiquidityETH"`
 */
export const useSimulateIUniswapV2Router02AddLiquidityEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'addLiquidityETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidity"`
 */
export const useSimulateIUniswapV2Router02RemoveLiquidity =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidity',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETH"`
 */
export const useSimulateIUniswapV2Router02RemoveLiquidityEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETHSupportingFeeOnTransferTokens"`
 */
export const useSimulateIUniswapV2Router02RemoveLiquidityEthSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETHSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETHWithPermit"`
 */
export const useSimulateIUniswapV2Router02RemoveLiquidityEthWithPermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETHWithPermit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityETHWithPermitSupportingFeeOnTransferTokens"`
 */
export const useSimulateIUniswapV2Router02RemoveLiquidityEthWithPermitSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityETHWithPermitSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"removeLiquidityWithPermit"`
 */
export const useSimulateIUniswapV2Router02RemoveLiquidityWithPermit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'removeLiquidityWithPermit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapETHForExactTokens"`
 */
export const useSimulateIUniswapV2Router02SwapEthForExactTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapETHForExactTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactETHForTokens"`
 */
export const useSimulateIUniswapV2Router02SwapExactEthForTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactETHForTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactETHForTokensSupportingFeeOnTransferTokens"`
 */
export const useSimulateIUniswapV2Router02SwapExactEthForTokensSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactETHForTokensSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForETH"`
 */
export const useSimulateIUniswapV2Router02SwapExactTokensForEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForETHSupportingFeeOnTransferTokens"`
 */
export const useSimulateIUniswapV2Router02SwapExactTokensForEthSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForETHSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForTokens"`
 */
export const useSimulateIUniswapV2Router02SwapExactTokensForTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapExactTokensForTokensSupportingFeeOnTransferTokens"`
 */
export const useSimulateIUniswapV2Router02SwapExactTokensForTokensSupportingFeeOnTransferTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapExactTokensForTokensSupportingFeeOnTransferTokens',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapTokensForExactETH"`
 */
export const useSimulateIUniswapV2Router02SwapTokensForExactEth =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapTokensForExactETH',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link iUniswapV2Router02Abi}__ and `functionName` set to `"swapTokensForExactTokens"`
 */
export const useSimulateIUniswapV2Router02SwapTokensForExactTokens =
  /*#__PURE__*/ createUseSimulateContract({
    abi: iUniswapV2Router02Abi,
    functionName: 'swapTokensForExactTokens',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ixerc20Abi}__
 */
export const useReadIxerc20 = /*#__PURE__*/ createUseReadContract({
  abi: ixerc20Abi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"burningCurrentLimitOf"`
 */
export const useReadIxerc20BurningCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: ixerc20Abi,
    functionName: 'burningCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"burningMaxLimitOf"`
 */
export const useReadIxerc20BurningMaxLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: ixerc20Abi,
    functionName: 'burningMaxLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"mintingCurrentLimitOf"`
 */
export const useReadIxerc20MintingCurrentLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: ixerc20Abi,
    functionName: 'mintingCurrentLimitOf',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"mintingMaxLimitOf"`
 */
export const useReadIxerc20MintingMaxLimitOf =
  /*#__PURE__*/ createUseReadContract({
    abi: ixerc20Abi,
    functionName: 'mintingMaxLimitOf',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ixerc20Abi}__
 */
export const useWriteIxerc20 = /*#__PURE__*/ createUseWriteContract({
  abi: ixerc20Abi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"burn"`
 */
export const useWriteIxerc20Burn = /*#__PURE__*/ createUseWriteContract({
  abi: ixerc20Abi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"mint"`
 */
export const useWriteIxerc20Mint = /*#__PURE__*/ createUseWriteContract({
  abi: ixerc20Abi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"setLimits"`
 */
export const useWriteIxerc20SetLimits = /*#__PURE__*/ createUseWriteContract({
  abi: ixerc20Abi,
  functionName: 'setLimits',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"setLockbox"`
 */
export const useWriteIxerc20SetLockbox = /*#__PURE__*/ createUseWriteContract({
  abi: ixerc20Abi,
  functionName: 'setLockbox',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ixerc20Abi}__
 */
export const useSimulateIxerc20 = /*#__PURE__*/ createUseSimulateContract({
  abi: ixerc20Abi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"burn"`
 */
export const useSimulateIxerc20Burn = /*#__PURE__*/ createUseSimulateContract({
  abi: ixerc20Abi,
  functionName: 'burn',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"mint"`
 */
export const useSimulateIxerc20Mint = /*#__PURE__*/ createUseSimulateContract({
  abi: ixerc20Abi,
  functionName: 'mint',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"setLimits"`
 */
export const useSimulateIxerc20SetLimits =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ixerc20Abi,
    functionName: 'setLimits',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ixerc20Abi}__ and `functionName` set to `"setLockbox"`
 */
export const useSimulateIxerc20SetLockbox =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ixerc20Abi,
    functionName: 'setLockbox',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ixerc20Abi}__
 */
export const useWatchIxerc20Event = /*#__PURE__*/ createUseWatchContractEvent({
  abi: ixerc20Abi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ixerc20Abi}__ and `eventName` set to `"BridgeLimitsSet"`
 */
export const useWatchIxerc20BridgeLimitsSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ixerc20Abi,
    eventName: 'BridgeLimitsSet',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ixerc20Abi}__ and `eventName` set to `"LockboxSet"`
 */
export const useWatchIxerc20LockboxSetEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ixerc20Abi,
    eventName: 'LockboxSet',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__
 */
export const useReadMockNft = /*#__PURE__*/ createUseReadContract({
  abi: mockNftAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"balanceOf"`
 */
export const useReadMockNftBalanceOf = /*#__PURE__*/ createUseReadContract({
  abi: mockNftAbi,
  functionName: 'balanceOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"getApproved"`
 */
export const useReadMockNftGetApproved = /*#__PURE__*/ createUseReadContract({
  abi: mockNftAbi,
  functionName: 'getApproved',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"isApprovedForAll"`
 */
export const useReadMockNftIsApprovedForAll =
  /*#__PURE__*/ createUseReadContract({
    abi: mockNftAbi,
    functionName: 'isApprovedForAll',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"name"`
 */
export const useReadMockNftName = /*#__PURE__*/ createUseReadContract({
  abi: mockNftAbi,
  functionName: 'name',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"ownerOf"`
 */
export const useReadMockNftOwnerOf = /*#__PURE__*/ createUseReadContract({
  abi: mockNftAbi,
  functionName: 'ownerOf',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"supportsInterface"`
 */
export const useReadMockNftSupportsInterface =
  /*#__PURE__*/ createUseReadContract({
    abi: mockNftAbi,
    functionName: 'supportsInterface',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"symbol"`
 */
export const useReadMockNftSymbol = /*#__PURE__*/ createUseReadContract({
  abi: mockNftAbi,
  functionName: 'symbol',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"tokenURI"`
 */
export const useReadMockNftTokenUri = /*#__PURE__*/ createUseReadContract({
  abi: mockNftAbi,
  functionName: 'tokenURI',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link mockNftAbi}__
 */
export const useWriteMockNft = /*#__PURE__*/ createUseWriteContract({
  abi: mockNftAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"approve"`
 */
export const useWriteMockNftApprove = /*#__PURE__*/ createUseWriteContract({
  abi: mockNftAbi,
  functionName: 'approve',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useWriteMockNftSafeTransferFrom =
  /*#__PURE__*/ createUseWriteContract({
    abi: mockNftAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useWriteMockNftSetApprovalForAll =
  /*#__PURE__*/ createUseWriteContract({
    abi: mockNftAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useWriteMockNftTransferFrom = /*#__PURE__*/ createUseWriteContract(
  { abi: mockNftAbi, functionName: 'transferFrom' },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link mockNftAbi}__
 */
export const useSimulateMockNft = /*#__PURE__*/ createUseSimulateContract({
  abi: mockNftAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"approve"`
 */
export const useSimulateMockNftApprove =
  /*#__PURE__*/ createUseSimulateContract({
    abi: mockNftAbi,
    functionName: 'approve',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"safeTransferFrom"`
 */
export const useSimulateMockNftSafeTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: mockNftAbi,
    functionName: 'safeTransferFrom',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"setApprovalForAll"`
 */
export const useSimulateMockNftSetApprovalForAll =
  /*#__PURE__*/ createUseSimulateContract({
    abi: mockNftAbi,
    functionName: 'setApprovalForAll',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link mockNftAbi}__ and `functionName` set to `"transferFrom"`
 */
export const useSimulateMockNftTransferFrom =
  /*#__PURE__*/ createUseSimulateContract({
    abi: mockNftAbi,
    functionName: 'transferFrom',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link mockNftAbi}__
 */
export const useWatchMockNftEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: mockNftAbi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link mockNftAbi}__ and `eventName` set to `"Approval"`
 */
export const useWatchMockNftApprovalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: mockNftAbi,
    eventName: 'Approval',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link mockNftAbi}__ and `eventName` set to `"ApprovalForAll"`
 */
export const useWatchMockNftApprovalForAllEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: mockNftAbi,
    eventName: 'ApprovalForAll',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link mockNftAbi}__ and `eventName` set to `"Transfer"`
 */
export const useWatchMockNftTransferEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: mockNftAbi,
    eventName: 'Transfer',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__
 */
export const useReadMultiSendProposal = /*#__PURE__*/ createUseReadContract({
  abi: multiSendProposalAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"IS_TEST"`
 */
export const useReadMultiSendProposalIsTest =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'IS_TEST',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"encodeMultiCall"`
 */
export const useReadMultiSendProposalEncodeMultiCall =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'encodeMultiCall',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"excludeArtifacts"`
 */
export const useReadMultiSendProposalExcludeArtifacts =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'excludeArtifacts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"excludeContracts"`
 */
export const useReadMultiSendProposalExcludeContracts =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'excludeContracts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"excludeSenders"`
 */
export const useReadMultiSendProposalExcludeSenders =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'excludeSenders',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"targetArtifactSelectors"`
 */
export const useReadMultiSendProposalTargetArtifactSelectors =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'targetArtifactSelectors',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"targetArtifacts"`
 */
export const useReadMultiSendProposalTargetArtifacts =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'targetArtifacts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"targetContracts"`
 */
export const useReadMultiSendProposalTargetContracts =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'targetContracts',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"targetInterfaces"`
 */
export const useReadMultiSendProposalTargetInterfaces =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'targetInterfaces',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"targetSelectors"`
 */
export const useReadMultiSendProposalTargetSelectors =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'targetSelectors',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"targetSenders"`
 */
export const useReadMultiSendProposalTargetSenders =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'targetSenders',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"wrapForCustomTreasury"`
 */
export const useReadMultiSendProposalWrapForCustomTreasury =
  /*#__PURE__*/ createUseReadContract({
    abi: multiSendProposalAbi,
    functionName: 'wrapForCustomTreasury',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link multiSendProposalAbi}__
 */
export const useWriteMultiSendProposal = /*#__PURE__*/ createUseWriteContract({
  abi: multiSendProposalAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"failed"`
 */
export const useWriteMultiSendProposalFailed =
  /*#__PURE__*/ createUseWriteContract({
    abi: multiSendProposalAbi,
    functionName: 'failed',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link multiSendProposalAbi}__
 */
export const useSimulateMultiSendProposal =
  /*#__PURE__*/ createUseSimulateContract({ abi: multiSendProposalAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link multiSendProposalAbi}__ and `functionName` set to `"failed"`
 */
export const useSimulateMultiSendProposalFailed =
  /*#__PURE__*/ createUseSimulateContract({
    abi: multiSendProposalAbi,
    functionName: 'failed',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__
 */
export const useWatchMultiSendProposalEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: multiSendProposalAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log"`
 */
export const useWatchMultiSendProposalLogEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_address"`
 */
export const useWatchMultiSendProposalLogAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_array"`
 */
export const useWatchMultiSendProposalLogArrayEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_array',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_bytes"`
 */
export const useWatchMultiSendProposalLogBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_bytes32"`
 */
export const useWatchMultiSendProposalLogBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_int"`
 */
export const useWatchMultiSendProposalLogIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_address"`
 */
export const useWatchMultiSendProposalLogNamedAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_array"`
 */
export const useWatchMultiSendProposalLogNamedArrayEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_array',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_bytes"`
 */
export const useWatchMultiSendProposalLogNamedBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_bytes32"`
 */
export const useWatchMultiSendProposalLogNamedBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_decimal_int"`
 */
export const useWatchMultiSendProposalLogNamedDecimalIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_decimal_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_decimal_uint"`
 */
export const useWatchMultiSendProposalLogNamedDecimalUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_decimal_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_int"`
 */
export const useWatchMultiSendProposalLogNamedIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_string"`
 */
export const useWatchMultiSendProposalLogNamedStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_named_uint"`
 */
export const useWatchMultiSendProposalLogNamedUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_named_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_string"`
 */
export const useWatchMultiSendProposalLogStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"log_uint"`
 */
export const useWatchMultiSendProposalLogUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'log_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link multiSendProposalAbi}__ and `eventName` set to `"logs"`
 */
export const useWatchMultiSendProposalLogsEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: multiSendProposalAbi,
    eventName: 'logs',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link noncesAbi}__
 */
export const useReadNonces = /*#__PURE__*/ createUseReadContract({
  abi: noncesAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link noncesAbi}__ and `functionName` set to `"nonces"`
 */
export const useReadNoncesNonces = /*#__PURE__*/ createUseReadContract({
  abi: noncesAbi,
  functionName: 'nonces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ownableAbi}__
 */
export const useReadOwnable = /*#__PURE__*/ createUseReadContract({
  abi: ownableAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link ownableAbi}__ and `functionName` set to `"owner"`
 */
export const useReadOwnableOwner = /*#__PURE__*/ createUseReadContract({
  abi: ownableAbi,
  functionName: 'owner',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ownableAbi}__
 */
export const useWriteOwnable = /*#__PURE__*/ createUseWriteContract({
  abi: ownableAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ownableAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useWriteOwnableRenounceOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: ownableAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link ownableAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useWriteOwnableTransferOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: ownableAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ownableAbi}__
 */
export const useSimulateOwnable = /*#__PURE__*/ createUseSimulateContract({
  abi: ownableAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ownableAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useSimulateOwnableRenounceOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ownableAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link ownableAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useSimulateOwnableTransferOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: ownableAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ownableAbi}__
 */
export const useWatchOwnableEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: ownableAbi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link ownableAbi}__ and `eventName` set to `"OwnershipTransferred"`
 */
export const useWatchOwnableOwnershipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: ownableAbi,
    eventName: 'OwnershipTransferred',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__
 */
export const useReadTest = /*#__PURE__*/ createUseReadContract({ abi: testAbi })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"IS_TEST"`
 */
export const useReadTestIsTest = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'IS_TEST',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"excludeArtifacts"`
 */
export const useReadTestExcludeArtifacts = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'excludeArtifacts',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"excludeContracts"`
 */
export const useReadTestExcludeContracts = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'excludeContracts',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"excludeSenders"`
 */
export const useReadTestExcludeSenders = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'excludeSenders',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"targetArtifactSelectors"`
 */
export const useReadTestTargetArtifactSelectors =
  /*#__PURE__*/ createUseReadContract({
    abi: testAbi,
    functionName: 'targetArtifactSelectors',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"targetArtifacts"`
 */
export const useReadTestTargetArtifacts = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'targetArtifacts',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"targetContracts"`
 */
export const useReadTestTargetContracts = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'targetContracts',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"targetInterfaces"`
 */
export const useReadTestTargetInterfaces = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'targetInterfaces',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"targetSelectors"`
 */
export const useReadTestTargetSelectors = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'targetSelectors',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"targetSenders"`
 */
export const useReadTestTargetSenders = /*#__PURE__*/ createUseReadContract({
  abi: testAbi,
  functionName: 'targetSenders',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link testAbi}__
 */
export const useWriteTest = /*#__PURE__*/ createUseWriteContract({
  abi: testAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"failed"`
 */
export const useWriteTestFailed = /*#__PURE__*/ createUseWriteContract({
  abi: testAbi,
  functionName: 'failed',
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link testAbi}__
 */
export const useSimulateTest = /*#__PURE__*/ createUseSimulateContract({
  abi: testAbi,
})

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link testAbi}__ and `functionName` set to `"failed"`
 */
export const useSimulateTestFailed = /*#__PURE__*/ createUseSimulateContract({
  abi: testAbi,
  functionName: 'failed',
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__
 */
export const useWatchTestEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: testAbi,
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log"`
 */
export const useWatchTestLogEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: testAbi,
  eventName: 'log',
})

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_address"`
 */
export const useWatchTestLogAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_array"`
 */
export const useWatchTestLogArrayEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_array',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_bytes"`
 */
export const useWatchTestLogBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_bytes32"`
 */
export const useWatchTestLogBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_int"`
 */
export const useWatchTestLogIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_address"`
 */
export const useWatchTestLogNamedAddressEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_address',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_array"`
 */
export const useWatchTestLogNamedArrayEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_array',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_bytes"`
 */
export const useWatchTestLogNamedBytesEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_bytes',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_bytes32"`
 */
export const useWatchTestLogNamedBytes32Event =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_bytes32',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_decimal_int"`
 */
export const useWatchTestLogNamedDecimalIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_decimal_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_decimal_uint"`
 */
export const useWatchTestLogNamedDecimalUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_decimal_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_int"`
 */
export const useWatchTestLogNamedIntEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_int',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_string"`
 */
export const useWatchTestLogNamedStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_named_uint"`
 */
export const useWatchTestLogNamedUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_named_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_string"`
 */
export const useWatchTestLogStringEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_string',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"log_uint"`
 */
export const useWatchTestLogUintEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: testAbi,
    eventName: 'log_uint',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link testAbi}__ and `eventName` set to `"logs"`
 */
export const useWatchTestLogsEvent = /*#__PURE__*/ createUseWatchContractEvent({
  abi: testAbi,
  eventName: 'logs',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link treasuryShamanAbi}__
 */
export const useReadTreasuryShaman = /*#__PURE__*/ createUseReadContract({
  abi: treasuryShamanAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"baal"`
 */
export const useReadTreasuryShamanBaal = /*#__PURE__*/ createUseReadContract({
  abi: treasuryShamanAbi,
  functionName: 'baal',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"conversionRate"`
 */
export const useReadTreasuryShamanConversionRate =
  /*#__PURE__*/ createUseReadContract({
    abi: treasuryShamanAbi,
    functionName: 'conversionRate',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"depositReceiver"`
 */
export const useReadTreasuryShamanDepositReceiver =
  /*#__PURE__*/ createUseReadContract({
    abi: treasuryShamanAbi,
    functionName: 'depositReceiver',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"depositToken"`
 */
export const useReadTreasuryShamanDepositToken =
  /*#__PURE__*/ createUseReadContract({
    abi: treasuryShamanAbi,
    functionName: 'depositToken',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"owner"`
 */
export const useReadTreasuryShamanOwner = /*#__PURE__*/ createUseReadContract({
  abi: treasuryShamanAbi,
  functionName: 'owner',
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link treasuryShamanAbi}__
 */
export const useWriteTreasuryShaman = /*#__PURE__*/ createUseWriteContract({
  abi: treasuryShamanAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"deposit"`
 */
export const useWriteTreasuryShamanDeposit =
  /*#__PURE__*/ createUseWriteContract({
    abi: treasuryShamanAbi,
    functionName: 'deposit',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useWriteTreasuryShamanRenounceOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: treasuryShamanAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"setConversionRate"`
 */
export const useWriteTreasuryShamanSetConversionRate =
  /*#__PURE__*/ createUseWriteContract({
    abi: treasuryShamanAbi,
    functionName: 'setConversionRate',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"setDepositToken"`
 */
export const useWriteTreasuryShamanSetDepositToken =
  /*#__PURE__*/ createUseWriteContract({
    abi: treasuryShamanAbi,
    functionName: 'setDepositToken',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useWriteTreasuryShamanTransferOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: treasuryShamanAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link treasuryShamanAbi}__
 */
export const useSimulateTreasuryShaman =
  /*#__PURE__*/ createUseSimulateContract({ abi: treasuryShamanAbi })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"deposit"`
 */
export const useSimulateTreasuryShamanDeposit =
  /*#__PURE__*/ createUseSimulateContract({
    abi: treasuryShamanAbi,
    functionName: 'deposit',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useSimulateTreasuryShamanRenounceOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: treasuryShamanAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"setConversionRate"`
 */
export const useSimulateTreasuryShamanSetConversionRate =
  /*#__PURE__*/ createUseSimulateContract({
    abi: treasuryShamanAbi,
    functionName: 'setConversionRate',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"setDepositToken"`
 */
export const useSimulateTreasuryShamanSetDepositToken =
  /*#__PURE__*/ createUseSimulateContract({
    abi: treasuryShamanAbi,
    functionName: 'setDepositToken',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link treasuryShamanAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useSimulateTreasuryShamanTransferOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: treasuryShamanAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link treasuryShamanAbi}__
 */
export const useWatchTreasuryShamanEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: treasuryShamanAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link treasuryShamanAbi}__ and `eventName` set to `"ConversionRateUpdated"`
 */
export const useWatchTreasuryShamanConversionRateUpdatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: treasuryShamanAbi,
    eventName: 'ConversionRateUpdated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link treasuryShamanAbi}__ and `eventName` set to `"DepositTokenUpdated"`
 */
export const useWatchTreasuryShamanDepositTokenUpdatedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: treasuryShamanAbi,
    eventName: 'DepositTokenUpdated',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link treasuryShamanAbi}__ and `eventName` set to `"OwnershipTransferred"`
 */
export const useWatchTreasuryShamanOwnershipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: treasuryShamanAbi,
    eventName: 'OwnershipTransferred',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link treasuryShamanAbi}__ and `eventName` set to `"TreasuryDepositReceived"`
 */
export const useWatchTreasuryShamanTreasuryDepositReceivedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: treasuryShamanAbi,
    eventName: 'TreasuryDepositReceived',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__
 */
export const useReadVestingWallet = /*#__PURE__*/ createUseReadContract({
  abi: vestingWalletAbi,
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"duration"`
 */
export const useReadVestingWalletDuration = /*#__PURE__*/ createUseReadContract(
  { abi: vestingWalletAbi, functionName: 'duration' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"end"`
 */
export const useReadVestingWalletEnd = /*#__PURE__*/ createUseReadContract({
  abi: vestingWalletAbi,
  functionName: 'end',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"owner"`
 */
export const useReadVestingWalletOwner = /*#__PURE__*/ createUseReadContract({
  abi: vestingWalletAbi,
  functionName: 'owner',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"releasable"`
 */
export const useReadVestingWalletReleasable =
  /*#__PURE__*/ createUseReadContract({
    abi: vestingWalletAbi,
    functionName: 'releasable',
  })

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"released"`
 */
export const useReadVestingWalletReleased = /*#__PURE__*/ createUseReadContract(
  { abi: vestingWalletAbi, functionName: 'released' },
)

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"start"`
 */
export const useReadVestingWalletStart = /*#__PURE__*/ createUseReadContract({
  abi: vestingWalletAbi,
  functionName: 'start',
})

/**
 * Wraps __{@link useReadContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"vestedAmount"`
 */
export const useReadVestingWalletVestedAmount =
  /*#__PURE__*/ createUseReadContract({
    abi: vestingWalletAbi,
    functionName: 'vestedAmount',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link vestingWalletAbi}__
 */
export const useWriteVestingWallet = /*#__PURE__*/ createUseWriteContract({
  abi: vestingWalletAbi,
})

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"release"`
 */
export const useWriteVestingWalletRelease =
  /*#__PURE__*/ createUseWriteContract({
    abi: vestingWalletAbi,
    functionName: 'release',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useWriteVestingWalletRenounceOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: vestingWalletAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useWriteContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useWriteVestingWalletTransferOwnership =
  /*#__PURE__*/ createUseWriteContract({
    abi: vestingWalletAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link vestingWalletAbi}__
 */
export const useSimulateVestingWallet = /*#__PURE__*/ createUseSimulateContract(
  { abi: vestingWalletAbi },
)

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"release"`
 */
export const useSimulateVestingWalletRelease =
  /*#__PURE__*/ createUseSimulateContract({
    abi: vestingWalletAbi,
    functionName: 'release',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"renounceOwnership"`
 */
export const useSimulateVestingWalletRenounceOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: vestingWalletAbi,
    functionName: 'renounceOwnership',
  })

/**
 * Wraps __{@link useSimulateContract}__ with `abi` set to __{@link vestingWalletAbi}__ and `functionName` set to `"transferOwnership"`
 */
export const useSimulateVestingWalletTransferOwnership =
  /*#__PURE__*/ createUseSimulateContract({
    abi: vestingWalletAbi,
    functionName: 'transferOwnership',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link vestingWalletAbi}__
 */
export const useWatchVestingWalletEvent =
  /*#__PURE__*/ createUseWatchContractEvent({ abi: vestingWalletAbi })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link vestingWalletAbi}__ and `eventName` set to `"ERC20Released"`
 */
export const useWatchVestingWalletErc20ReleasedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: vestingWalletAbi,
    eventName: 'ERC20Released',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link vestingWalletAbi}__ and `eventName` set to `"EtherReleased"`
 */
export const useWatchVestingWalletEtherReleasedEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: vestingWalletAbi,
    eventName: 'EtherReleased',
  })

/**
 * Wraps __{@link useWatchContractEvent}__ with `abi` set to __{@link vestingWalletAbi}__ and `eventName` set to `"OwnershipTransferred"`
 */
export const useWatchVestingWalletOwnershipTransferredEvent =
  /*#__PURE__*/ createUseWatchContractEvent({
    abi: vestingWalletAbi,
    eventName: 'OwnershipTransferred',
  })

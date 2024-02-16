import { formatUnits } from 'viem';

//regexPattern("^(0x)?[0-9a-fA-F]{40}$");

// TODO put all contract interaction and error handling here

export function formatAxeUnits(value: bigint | undefined, decimals?: number): string {
  if (value) return formatUnits(value, decimals || 18);
  return '0';
}

import { formatUnits } from 'viem';

//regexPattern("^(0x)?[0-9a-fA-F]{40}$");

// TODO put all contract interaction and error handling here

export function formatAxeUnits(value: bigint | undefined, decimals?: number): string {
  if (value) {
    const units = Number(formatUnits(value, decimals || 18));
    if (units < 1) return '< 1';
    return Math.trunc(units).toLocaleString();
  }
  return '0';
}

export function formatStableUnits(value: bigint | undefined, decimals?: number) {
  if (value) {
    const units = Number(formatUnits(value, decimals || 18));
    if (units < 1) return '< 1';
    return units.toFixed(2).toLocaleString();
  }
  return '0';
}

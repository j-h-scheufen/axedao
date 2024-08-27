import { useWaitForTransactionReceipt } from 'wagmi';
import { Button } from '@nextui-org/button';
import { Address } from 'viem';

import ENV from '@/config/environment';
import { formatAxeUnits } from '@/utils/contract.utils';
import {
  useWriteVestingWalletRelease,
  useReadAxeSourceVestingWallet,
  useReadErc20BalanceOf,
  useReadVestingWalletReleasable,
} from '@/generated';

export default function Vesting() {
  const { data: vestingWallet } = useReadAxeSourceVestingWallet({
    address: ENV.axeTokenAddress,
  });

  const { data: releasable } = useReadVestingWalletReleasable({
    address: vestingWallet,
    args: [ENV.axeTokenAddress],
  });

  const { data: totalVested } = useReadErc20BalanceOf({
    address: ENV.axeTokenAddress,
    args: [vestingWallet as Address],
  });

  const {
    data: releaseHash,
    isPending: isReleasePending,
    writeContract: releaseVesting,
  } = useWriteVestingWalletRelease();

  const {
    isLoading: releaseLoading,
    isSuccess: releaseSuccess,
    error: releaseError,
  } = useWaitForTransactionReceipt({
    hash: releaseHash,
  });

  return (
    <div className="inline-block max-w-lg justify-center text-center">
      <div className="flex gap-2">
        <div>Vesting Wallet:</div>
        <div>{vestingWallet}</div>
      </div>
      <div className="flex gap-2">
        <div>Releasable:</div>
        <div>
          {formatAxeUnits(releasable, 18)} of total {formatAxeUnits(totalVested)} $AXÉ
        </div>
      </div>
      <Button
        className="mt-3 size-unit-lg w-full"
        disabled={isReleasePending}
        onClick={() => {
          releaseVesting({
            address: vestingWallet as Address,
            args: [ENV.axeTokenAddress],
          });
        }}
      >
        {isReleasePending ? 'Confirming...' : 'Release'}
      </Button>
      {releaseHash && <div className="mt-4">TX Receipt: {releaseHash}</div>}
      {releaseLoading && <div className="mt-4">Waiting for confirmation...</div>}
      {releaseSuccess && <div className="mt-4">Transaction confirmed.</div>}
      {releaseError && <div className="mt-4">Transaction failed: {releaseError.message}</div>}
    </div>
  );
}

'use client';

import { useAccount, useWaitForTransactionReceipt } from 'wagmi';
import { Button } from '@nextui-org/button';

import {
  useReadAxeVestingWallet,
  useReadErc20BalanceOf,
  useReadVestingWalletOwner,
  useReadVestingWalletReleasable,
  useWriteAxeIssue,
  useWriteVestingWalletRelease,
} from '@/generated';
import { config as env } from '@/config/environment';
import { formatAxeUnits } from './_utils/contract.utils';
import { Address, parseUnits } from 'viem';

export default function Home() {
  const account = useAccount();

  const { data: userBalance } = useReadErc20BalanceOf({
    address: env.axeTokenAddress,
    args: [account.address as Address],
  });

  const { data: userDaoShares } = useReadErc20BalanceOf({
    address: env.axeDaoSharesAddress,
    args: [account.address as Address],
  });

  const { data: treasuryBalance } = useReadErc20BalanceOf({
    address: env.axeTokenAddress,
    args: [env.axeTreasuryAddress],
  });

  const { data: vestingWallet } = useReadAxeVestingWallet({
    address: env.axeTokenAddress,
  });

  const { data: beneficiary } = useReadVestingWalletOwner({
    address: vestingWallet,
  });

  const { data: releasable } = useReadVestingWalletReleasable({
    address: vestingWallet,
    args: [env.axeTokenAddress],
  });

  const { data: totalVested } = useReadErc20BalanceOf({
    address: env.axeTokenAddress,
    args: [vestingWallet as Address],
  });

  const { data: issueHash, isPending: isIssuePending, writeContract: issueAxe } = useWriteAxeIssue();

  const {
    data: releaseHash,
    isPending: isReleasePending,
    writeContract: releaseVesting,
  } = useWriteVestingWalletRelease();

  const {
    isLoading: issueLoading,
    isSuccess: issueSuccess,
    error: issueError,
  } = useWaitForTransactionReceipt({
    hash: issueHash,
  });

  const {
    isLoading: releaseLoading,
    isSuccess: releaseSuccess,
    error: releaseError,
  } = useWaitForTransactionReceipt({
    hash: releaseHash,
  });

  return (
    <section className="flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <div className="inline-block max-w-lg justify-center text-center">
        <div>Chain: {account.chain?.id}</div>
        <div>AXÉ in Treasury: {formatAxeUnits(treasuryBalance)} $AXÉ</div>
        <div className="my-8 flex flex-col">
          <div className="flex gap-2">
            <div>User Balance:</div>
            <div>{formatAxeUnits(userBalance)} $AXÉ</div>
          </div>
          <div className="flex gap-2">
            <div>DAO Member:</div>
            <div>{userDaoShares && userDaoShares > 0 ? 'Yes' : 'No'}</div>
          </div>
          <div className="flex gap-2">
            <div>Vesting Wallet:</div>
            <div>{vestingWallet}</div>
          </div>
          <div className="flex gap-2">
            <div>Beneficiary:</div>
            <div>{beneficiary == account.address ? 'You' : beneficiary}</div>
          </div>
          <div className="flex gap-2">
            <div>Releasable:</div>
            <div>
              {formatAxeUnits(releasable, 18)} of total {formatAxeUnits(totalVested)} $AXÉ
            </div>
          </div>
          <Button
            className="mt-3 size-unit-lg w-full"
            disabled={isIssuePending}
            onClick={() => {
              issueAxe({
                address: env.axeTokenAddress,
                args: [parseUnits('10000', 18)],
              });
            }}
          >
            {isIssuePending ? 'Confirming...' : 'Issue'}
          </Button>
          <Button
            className="mt-3 size-unit-lg w-full"
            disabled={isReleasePending}
            onClick={() => {
              releaseVesting({
                address: vestingWallet as Address,
                args: [env.axeTokenAddress],
              });
            }}
          >
            {isReleasePending ? 'Confirming...' : 'Release'}
          </Button>
          {issueHash && <div className="mt-4">TX Receipt: {issueHash}</div>}
          {issueLoading && <div className="mt-4">Waiting for confirmation...</div>}
          {issueSuccess && <div className="mt-4">Transaction confirmed.</div>}
          {issueError && <div className="mt-4">Transaction failed: {issueError.message}</div>}
          {releaseHash && <div className="mt-4">TX Receipt: {releaseHash}</div>}
          {releaseLoading && <div className="mt-4">Waiting for confirmation...</div>}
          {releaseSuccess && <div className="mt-4">Transaction confirmed.</div>}
          {releaseError && <div className="mt-4">Transaction failed: {releaseError.message}</div>}
        </div>
      </div>
    </section>
  );
}

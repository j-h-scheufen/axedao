'use client';

import { useAccount } from 'wagmi';

// import { Button } from '@nextui-org/button';

import { useReadErc20BalanceOf } from '@/generated';
import { config as env } from '@/config/environment';
import { formatAxeUnits } from './_utils/contract.utils';

export default function Home() {
  const account = useAccount();

  const { data: userBalance } = useReadErc20BalanceOf({
    address: env.axeTokenAddress,
    args: [account.address || '0x0'],
  });

  const { data: userDaoShares } = useReadErc20BalanceOf({
    address: env.axeDaoSharesAddress,
    args: [account.address || '0x0'],
  });

  const { data: treasuryBalance } = useReadErc20BalanceOf({
    address: env.axeTokenAddress,
    args: [env.axeTreasuryAddress],
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
        </div>
      </div>
    </section>
  );
}

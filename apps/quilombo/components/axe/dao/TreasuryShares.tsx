'use client';

import type { Address } from 'viem';
import { useAccount } from 'wagmi';

import ENV from '@/config/environment';
import { useReadAxeMembershipIsMember, useReadErc20BalanceOf, useReadErc20TotalSupply } from '@/generated';
import { add, divide, format, from, greaterThan, multiply } from 'dnum';
import { Suspense } from 'react';
import { CouncilBadge, MemberBadge } from './Badges';
import { isCurrentUserOnCouncilAtom } from '@/hooks/state/dao';
import { useAtomValue } from 'jotai';

const TreasuryShares: React.FC = () => {
  const account = useAccount();
  // SHARES
  const { data: userDaoShares } = useReadErc20BalanceOf({
    address: ENV.daoSharesAddress,
    args: [account.address as Address],
  });
  const { data: totalShares } = useReadErc20TotalSupply({
    address: ENV.daoSharesAddress,
  });
  // LOOT
  const { data: userDaoLoot } = useReadErc20BalanceOf({
    address: ENV.daoLootAddress,
    args: [account.address as Address],
  });
  const { data: totalLoot } = useReadErc20TotalSupply({
    address: ENV.daoLootAddress,
  });
  const { data: usdDao } = useReadErc20BalanceOf({
    address: ENV.axeSwapTokenAddress,
    args: [ENV.daoTreasuryAddress],
  });
  const { data: isMember = false } = useReadAxeMembershipIsMember({
    address: ENV.axeMembershipAddress,
    args: [account.address as Address],
  });

  const isOnCouncil = useAtomValue(isCurrentUserOnCouncilAtom);
  const totalRageQuitShares = add([userDaoShares || BigInt(0), 18], [userDaoLoot || BigInt(0), 18]);
  const sumOfAllShares = add([totalShares || BigInt(0), 18], [totalLoot || BigInt(0), 18]);
  const userTreasuryPercent = greaterThan(sumOfAllShares, 0)
    ? multiply(divide(totalRageQuitShares, sumOfAllShares), 100)
    : from(0);
  const userTreasuryUsdTotal = multiply(divide([usdDao || BigInt(0), 18], from(100)), userTreasuryPercent);

  return (
    <div className="flex flex-col w-full items-center">
      <div className="flex flex-col gap-2 w-full px-2">
        <div className="flex gap-2 sm:gap-4">
          <MemberBadge isMember={isMember} />
          {isMember ? (
            `You own ${format(totalRageQuitShares)} share(s) of the community treasury equivalent to ${format(
              userTreasuryPercent,
              2
            )}% (or $ ${format(userTreasuryUsdTotal, 2)})`
          ) : (
            <span>You&apos;re not a member.</span>
          )}
        </div>
        <div className="flex gap-2 sm:gap-4">
          <CouncilBadge isCouncil={isOnCouncil} />
          {isOnCouncil
            ? `You have ${format([userDaoShares ?? BigInt(0), 18])} voting share(s)`
            : 'You are not a council member'}
        </div>
      </div>
    </div>
  );
};

export default function DaoMembership() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <TreasuryShares />
    </Suspense>
  );
}

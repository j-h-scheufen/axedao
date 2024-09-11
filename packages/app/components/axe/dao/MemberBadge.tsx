'use client';

import { Address } from 'viem';
import { useAccount } from 'wagmi';

import ENV from '@/config/environment';
import { useReadErc20BalanceOf } from '@/generated';
import { Suspense } from 'react';

const MemberBadge = () => {
  const account = useAccount();
  const { data: userDaoShares } = useReadErc20BalanceOf({
    address: ENV.axeDaoSharesAddress,
    args: [account.address as Address],
  });

  return (
    <Suspense fallback={<></>}>
      <div className="inline-block justify-center text-center">
        <div className="my-8 flex gap-1">
          <div>DAO Member:</div>
          <div>{userDaoShares && userDaoShares > 0 ? 'Yes' : 'No'}</div>
        </div>
      </div>
    </Suspense>
  );
};

export default MemberBadge;

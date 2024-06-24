'use client';

import { useAccount } from 'wagmi';

import AxeSwap from '@/components/AxeSwap/AxeSwap';
import ENV from '@/config/environment';
import { useReadErc20BalanceOf } from '@/generated';
import { usePathname, useRouter } from 'next/navigation';
import { useEffect } from 'react';
import { Address } from 'viem';

export default function Home() {
  const router = useRouter();
  const pathname = usePathname();
  const account = useAccount();

  const { data: userDaoShares } = useReadErc20BalanceOf({
    address: ENV.axeDaoSharesAddress,
    args: [account.address as Address],
  });

  useEffect(() => {
    if (pathname === '/') router.push('/dashboard/profile');
  }, [pathname, router]);

  return (
    <section className="flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <div className="inline-block max-w-lg justify-center text-center">
        <div className="my-8 flex flex-col">
          <div className="flex gap-2">
            <div>DAO Member:</div>
            <div>{userDaoShares && userDaoShares > 0 ? 'Yes' : 'No'}</div>
          </div>
        </div>
      </div>
      <AxeSwap />
    </section>
  );
}

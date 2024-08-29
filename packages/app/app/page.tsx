'use client';

import { useAccount } from 'wagmi';

import AxeSwap from '@/components/AxeSwap/AxeSwap';
import RippleBackground from '@/components/RippleBackground';
import ENV from '@/config/environment';
import { useReadErc20BalanceOf } from '@/generated';
import { Button } from '@nextui-org/react';
import { useSession } from 'next-auth/react';
import Link from 'next/link';
import { Address } from 'viem';

export default function Home() {
  const account = useAccount();

  const { data: userDaoShares } = useReadErc20BalanceOf({
    address: ENV.axeDaoSharesAddress,
    args: [account.address as Address],
  });

  const session = useSession();
  const isLoggedIn = session?.status === 'authenticated';

  return (
    <>
      <header className="mx-5 py-8 md:py-10">
        <div className="relative text-center max-w-[500px] mx-auto">
          <RippleBackground />
          <div className="relative z-[1]">
            <h1 className="font-bold text-xl mb-6">Welcome to AXE DAO</h1>
            <p className="my-3 text-default-600 text-sm">
              The advent of crypto/web3 has given the world a new set of tools. We are Capoeiristas from different
              corners of the world bringing these tools to the Capoeira community to create shared value. It is time for
              Capoeira to build its own open infrastructure and participate in the digital asset economy while giving
              every member a voice in shaping the future of this art form we love.
            </p>
            <p className="my-3 text-default-600 text-sm">
              Like Capoeira, the cypherpunk culture from which crypto/web3 originates is rooted in the spirit of
              autonomy, resistance, freedom and self-determination. Axé DAO is a pioneering effort by Capoeiristas for
              Capoeiristas to channel collective resources into efforts that benefit Capoeira guided by the principles
              of decentralization and collective action.
            </p>
          </div>
          <div className="pt-5 flex flex-col items-center justify-center gap-3 sm:flex-row">
            {isLoggedIn ? (
              <Button
                as={Link}
                href="/dashboard/profile"
                color="primary"
                className="w-full font-medium sm:flex-1 sm:max-w-40"
              >
                Go to dashboard
              </Button>
            ) : (
              <>
                <Button
                  as={Link}
                  href="/auth?tab=sign-up"
                  variant="bordered"
                  className="w-full font-medium sm:flex-1 sm:max-w-40"
                >
                  Sign up
                </Button>
                <Button
                  as={Link}
                  href="/auth?tab=sign-in"
                  color="primary"
                  className="w-full font-medium sm:flex-1 sm:max-w-40"
                >
                  Sign in
                </Button>
              </>
            )}
          </div>
        </div>
      </header>
      <section className="mx-5 flex flex-col items-center justify-center gap-4 py-8 md:py-10">
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
    </>
  );
}

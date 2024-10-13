'use client';

import { Button } from '@nextui-org/button';
import { useSession } from 'next-auth/react';
import Link from 'next/link';

import RippleBackground from '@/components/RippleBackground';
import { PATHS } from '@/config/constants';

export default function Home() {
  const { data: session } = useSession();

  return (
    <>
      <header className="mx-5 mt-8 md:mt-16">
        <div className="relative text-center mx-auto">
          <RippleBackground />
          <div className="relative z-[1]">
            <h1 className="font-bold text-xl mb-6">Welcome to Quilombo</h1>
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
          <div className="pt-5">
            {session ? (
              <Button
                as={Link}
                href={PATHS.search}
                color="primary"
                className="w-full font-medium sm:flex-1 sm:max-w-40"
              >
                Go to Dashboard
              </Button>
            ) : (
              <Button as={Link} href={PATHS.login} color="primary" className="w-full font-medium sm:flex-1 sm:max-w-40">
                Log In
              </Button>
            )}
          </div>
          <footer className="mt-auto flex w-full items-center justify-center gap-1 pb-20 md:pb-10 py-10">
            <span className="text-default-600">Powered by </span>
            <span className="text-primary">AXÉ DAO</span>
          </footer>
        </div>
      </header>
    </>
  );
}

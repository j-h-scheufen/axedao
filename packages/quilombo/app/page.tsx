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
      <header className="mx-4 mt-8 sm:mt-16">
        <div className="relative text-center mx-auto">
          <RippleBackground />
          <div className="relative z-[1]">
            <h1 className="font-bold text-2xl mb-5">Welcome to Quilombo</h1>
            <p className="my-3 text-medium sm:text-lg">The first app specifically made for Capoeira</p>
            <p className="my-3 text-default-600 text-sm sm:text-medium">
              We are capoeiristas from different corners of the world and from different schools who come together to
              build our own tools instead of relying on social media platforms that don&apos;t serve our needs.
            </p>
            <p className="my-3 text-default-600 text-sm sm:text-medium">
              Quilombo starts with a simple directory of capoeira groups and their members, but it can grow into a place
              where we can share our events, pay for classes, and support each other in many ways.
            </p>
            <p className="my-3 text-default-600 text-sm sm:text-medium">
              If you are in any way involved in Capoeira, we invite you to join us on this journey. This app is free!
              Make an account, create your profile, join or register a group, and help populate the{' '}
              <i>geneology tree of Capoeira</i>.
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

'use client';

import { Button } from '@nextui-org/button';
import { useSession } from 'next-auth/react';
import Link from 'next/link';

import RippleBackground from '@/components/RippleBackground';
import { PATHS } from '@/config/constants';
import ENV from '@/config/environment';

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
              Quilombo is a registry application for Capoeiristas and Capoeira groups. By making profiles and
              registering groups, users contribute to creating a map of the Capoeira world.
              <br />
              But there is more ... Quilombo is also your portal to everything we&apos;re creating. Send digital Axé to
              your friends and participate in the governance of the platform.
            </p>
            <p className="my-3 text-default-600 text-sm sm:text-medium">
              If you are in any way involved in Capoeira, we invite you to join us on this journey. This app is free!
              Create your profile, join or register a group, and help populate the <i>geneology tree of Capoeira</i>.
            </p>
            <p className="my-3 text-default-600 text-sm sm:text-medium">
              This is a community-driven app. We are building it together and we need your help! To get involved send an{' '}
              <a href={`mailto:${ENV.axeDaoEmail}`} className="hover:text-primary underline">
                email
              </a>{' '}
              or join our{' '}
              <a href={ENV.axeDaoDiscord} className="hover:text-primary underline">
                group chat
              </a>{' '}
              on Discord.
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
                Log In / Sign Up
              </Button>
            )}
          </div>
        </div>
      </header>
      <footer className="mt-auto flex w-full items-center justify-center gap-1 pb-20 md:pb-10 py-10">
        <div className="text-default-600">
          Powered by{' '}
          <a href={ENV.axeDaoSiteUrl} className="text-primary">
            AXÉ DAO
          </a>
        </div>
      </footer>
    </>
  );
}

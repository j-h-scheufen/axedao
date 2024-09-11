'use client';

import { Button } from '@nextui-org/button';
import Link from 'next/link';

import { Transfer } from '@/components/axe';
import { PATHS } from '@/config/constants';

export default function SwapPage() {
  return (
    <section className="mx-5 flex flex-col items-center justify-center gap-2 sm:gap-4 py-8 sm:py-10">
      <Transfer />
      <div className="inline-block w-full max-w-lg">
        <div className="my-8 flex flex-col gap-2">
          <Button as={Link} href={PATHS.dao}>
            Axé DAO
          </Button>
          <Button as={Link} href={PATHS.swap}>
            Buy/Sell Axé
          </Button>
        </div>
      </div>
    </section>
  );
}

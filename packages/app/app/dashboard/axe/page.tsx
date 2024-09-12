'use client';

import { Button } from '@nextui-org/button';
import Link from 'next/link';

import { Transfer } from '@/components/axe';
import { PATHS } from '@/config/constants';

export default function SwapPage() {
  return (
    <section className="flex flex-col items-center justify-center gap-2 sm:gap-4 p-2 sm:p-4 max-w-lg w-full mx-auto">
      <Transfer />
      <div className="w-full my-8 flex flex-col gap-2">
        <Button as={Link} href={PATHS.dao}>
          Axé DAO
        </Button>
        <Button as={Link} href={PATHS.swap}>
          Buy/Sell Axé
        </Button>
      </div>
    </section>
  );
}

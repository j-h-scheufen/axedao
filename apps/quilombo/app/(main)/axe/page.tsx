'use client';

import { Tab } from '@heroui/react';

import PageTabs from '@/components/PageTabs';
import { Swap, Transfer } from '@/components/axe';

const AxePage = () => {
  return (
    <PageTabs>
      <Tab key="axe" title="Send" className="w-full max-w-lg mx-auto">
        <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
          <h2 className="text-3xl font-bold text-center mb-1">Send Axé</h2>
          <p className="text-center">Send Axé to members of the community</p>
          <Transfer />
        </div>
      </Tab>
      <Tab key="trade" title="Trade" className="w-full max-w-lg mx-auto">
        <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
          <h2 className="text-3xl font-bold text-center mb-1">Buy / Sell Axé</h2>
          <p className="text-center">Buy and sell Axé with USD.</p>
          <Swap />
        </div>
      </Tab>
    </PageTabs>
  );
};

export default AxePage;

'use client';

import { Tab, Tabs } from '@nextui-org/tabs';

import { Swap, Transfer } from '@/components/axe';

const AxePage = () => {
  return (
    <section className="flex flex-col items-center justify-center max-w-lg pt-2 sm:pt-4 w-full mx-auto">
      <Tabs aria-label="Options" color="primary" size="lg" fullWidth>
        <Tab key="axe" title="Axé" className="w-full">
          <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
            <h2 className="text-3xl font-bold text-center mb-1">Send Axé</h2>
            <p className="text-center">Send Axé to members of the community</p>
            <Transfer />
          </div>
        </Tab>
        <Tab key="trade" title="Trade" className="w-full">
          <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
            <h2 className="text-3xl font-bold text-center mb-1">Buy / Sell Axé</h2>
            <p className="text-center">Buy and sell Axé with USD.</p>
            <Swap />
          </div>
        </Tab>
      </Tabs>
    </section>
  );
};

export default AxePage;

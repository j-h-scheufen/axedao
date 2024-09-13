'use client';

import { Tab, Tabs } from '@nextui-org/tabs';

import { Swap, Transfer } from '@/components/axe';
import { DaoMembership, Treasury } from '@/components/axe/dao';

const AxePage = () => {
  return (
    <section className="flex flex-col items-center justify-center max-w-lg p-2 sm:p-4 w-full mx-auto">
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
        <Tab key="dao" title="DAO" className="w-full">
          <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
            <h2 className="text-3xl font-bold text-center mb-1">Axé DAO</h2>
            <p className="text-center">The Axé DAO governs the community treasury and the Axé Safe.</p>
            <Treasury />
            <DaoMembership />
          </div>
        </Tab>
      </Tabs>
    </section>
  );
};

export default AxePage;

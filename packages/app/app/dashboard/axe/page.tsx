'use client';

import { Swap, Transfer } from '@/components/axe';
import { MemberBadge } from '@/components/axe/dao';
import Treasury from '@/components/axe/dao/Treasury';
import { Tab, Tabs } from '@nextui-org/tabs';

const AxePage = () => {
  return (
    <section className="flex flex-col items-center justify-center max-w-lg p-2 sm:p-4 w-full mx-auto">
      <Tabs aria-label="Options" color="primary" size="lg" fullWidth>
        <Tab key="axe" title="Axé" className="w-full">
          <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
            <h2 className="text-3xl font-bold text-center my-2">Send Axé</h2>
            <p className="text-center">Send Axé to members of the community</p>
            <Transfer />
          </div>
        </Tab>
        <Tab key="trade" title="Trade">
          <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
            <h2 className="text-3xl font-bold text-center my-2">Buy / Sell Axé</h2>
            <p className="text-center">
              In case you need to, you can buy and sell Axé here. The liquidity for swapping is provided by the Axé DAO
              and other community members.
            </p>
            <Swap />
          </div>
        </Tab>
        <Tab key="dao" title="DAO">
          <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
            <h2 className="text-3xl font-bold text-center my-2">Axé DAO</h2>
            <MemberBadge />
            <p className="text-center">The Axé DAO governs the treasury which currently holds the following assets.</p>
            <Treasury />
          </div>
        </Tab>
      </Tabs>
    </section>
  );
};

export default AxePage;

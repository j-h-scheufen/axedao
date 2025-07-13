'use client';

import { Tab } from '@heroui/react';

import PageTabs from '@/components/PageTabs';
import { CouncilPanel, DaoMembership, Proposals, Treasury, TreasuryShares } from '@/components/axe/dao';

const DaoPage = () => {
  return (
    <PageTabs>
      <Tab key="dao" title="Axé DAO" className="w-full">
        <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
          <h2 className="text-3xl font-bold text-center mb-1">Axé DAO</h2>
          <p className="text-center">The Axé DAO governs the community treasury and the Axé Safe.</p>
          <DaoMembership />
        </div>
      </Tab>
      <Tab key="council" title="Council" className="w-full max-w-lg mx-auto">
        <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
          <h2 className="text-3xl font-bold text-center mb-1">Council</h2>
          <p className="text-center">The Council is the decision-making body of the Axé DAO.</p>
          <CouncilPanel />
        </div>
      </Tab>
      <Tab key="proposals" title="Proposals" className="w-full">
        <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
          <h2 className="text-3xl font-bold text-center mb-1">Proposals</h2>
          <p className="text-center">The following proposals are currently active.</p>
          <Proposals />
        </div>
      </Tab>
      <Tab key="assets" title="Assets" className="w-full max-w-lg mx-auto">
        <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
          <h2 className="text-3xl font-bold text-center mb-1">Assets</h2>
          <p className="text-center">The Axé DAO controls multiple treasuries.</p>
          <div className="flex flex-col gap-2 sm:gap-4 w-full items-center">
            <Treasury />
            <TreasuryShares />
          </div>
        </div>
      </Tab>
    </PageTabs>
  );
};

export default DaoPage;

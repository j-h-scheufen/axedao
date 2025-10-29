'use client';

import { Tab } from '@heroui/react';

import PageTabs from '@/components/PageTabs';
import { CouncilPanel, DaoMembership, Proposals, Treasury, TreasuryShares } from '@/components/axe/dao';

const DaoPage = () => {
  return (
    <PageTabs defaultTab="dao">
      <Tab key="dao" title="Axé DAO" className="w-full">
        <div className="tab-content">
          <h2 className="text-3xl font-bold text-center mb-1">Axé DAO</h2>
          <p className="text-center">The Axé DAO governs the community treasury and the Axé Safe.</p>
          <DaoMembership />
        </div>
      </Tab>
      <Tab key="council" title="Council" className="tab-wrapper">
        <div className="tab-content">
          <h2 className="text-3xl font-bold text-center mb-1">Council</h2>
          <p className="text-center">The Council is the decision-making body of the Axé DAO.</p>
          <CouncilPanel />
        </div>
      </Tab>
      <Tab key="proposals" title="Proposals" className="w-full">
        <div className="tab-content">
          <h2 className="text-3xl font-bold text-center mb-1">Proposals</h2>
          <p className="text-center">The following proposals are currently active.</p>
          <Proposals />
        </div>
      </Tab>
      <Tab key="assets" title="Assets" className="tab-wrapper">
        <div className="tab-content">
          <h2 className="text-3xl font-bold text-center mb-1">Assets</h2>
          <p className="text-center">The Axé DAO controls multiple treasuries.</p>
          <div className="gap-responsive flex flex-col w-full items-center">
            <Treasury />
            <TreasuryShares />
          </div>
        </div>
      </Tab>
    </PageTabs>
  );
};

export default DaoPage;

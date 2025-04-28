'use client';

import { Tab, Tabs } from '@nextui-org/tabs';
import { ArrowLeftRight } from 'lucide-react';

import { useInitializeCouncilState } from '@/hooks/state/dao';
import Candidates from './Candidates';
import Council from './Council';
import CouncilMembership from './CouncilMembership';
import CouncilSeatExchange from './CouncilSeatExchange';

const CouncilPanel: React.FC = () => {
  useInitializeCouncilState(); // TODO: there should be a better way to do this

  return (
    <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
      <h2 className="text-3xl font-bold text-center mb-1">Council</h2>
      <p className="text-center">The Council is the decision-making body of the Axé DAO.</p>
      <CouncilMembership />
      <Tabs aria-label="Axé DAO Council Tabs" color="secondary" size="lg" fullWidth>
        <Tab key="ranking" title="Ranking" className="w-full">
          <Candidates />
        </Tab>
        <Tab key="exchange" title={<ArrowLeftRight />} className="w-full">
          <CouncilSeatExchange />
        </Tab>
        <Tab key="current" title="Council" className="w-full">
          <Council />
        </Tab>
      </Tabs>
    </div>
  );
};

export default CouncilPanel;

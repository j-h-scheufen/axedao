'use client';

import { Tab, Tabs } from "@heroui/tabs";
import { ArrowLeftRight } from 'lucide-react';

import { useInitializeCouncilState } from '@/hooks/state/dao';
import Candidates from './Candidates';
import Council from './Council';
import CouncilMembership from './CouncilMembership';
import CouncilSeatExchange from './CouncilSeatExchange';

const CouncilPanel: React.FC = () => {
  // All components inside CouncilPanel depend on the council state being initialized
  useInitializeCouncilState(); // TODO: there should be a better way to do this

  return (
    <div className="flex flex-col w-full">
      <CouncilMembership />
      <div className="w-full flex flex-col mt-4 gap-2 sm:gap-4">
        <p className="text-2xl text-center">Council Formation</p>
        <Tabs aria-label="Axé DAO Council Tabs" color="secondary" size="lg" fullWidth>
          <Tab key="candidates" title="Candidates" className="w-full">
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
    </div>
  );
};

export default CouncilPanel;

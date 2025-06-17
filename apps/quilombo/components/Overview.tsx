'use client';

import { Tab, Tabs } from '@heroui/react';
import { useAtom } from 'jotai';

import { searchTabAtom } from '@/hooks/state/app';
import Groups from './Groups';
import Users from './Users';

const Overview = () => {
  const [searchTab, setSearchTab] = useAtom(searchTabAtom);

  return (
    <div>
      <Tabs
        variant="bordered"
        aria-label="Options"
        className="mb-3"
        defaultSelectedKey={searchTab || undefined}
        onSelectionChange={(key) => setSearchTab(key.toString() as 'users' | 'groups')}
      >
        <Tab key="users" title="People">
          <Users />
        </Tab>
        <Tab key="groups" title="Groups">
          <Groups />
        </Tab>
      </Tabs>
    </div>
  );
};
export default Overview;

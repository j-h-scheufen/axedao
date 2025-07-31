'use client';

import { Tab } from '@heroui/react';

import PageTabs from '@/components/PageTabs';
import Groups from '@/components/Groups';
import Users from '@/components/Users';
import { Events } from '@/components/events';

const SearchPage = () => {
  return (
    <PageTabs>
      <Tab key="users" title="People">
        <Users />
      </Tab>
      <Tab key="groups" title="Groups">
        <Groups />
      </Tab>
      <Tab key="events" title="Events" className="w-full">
        <Events />
      </Tab>
    </PageTabs>
  );
};
export default SearchPage;

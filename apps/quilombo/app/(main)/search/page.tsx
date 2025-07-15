'use client';

import { Tab } from '@heroui/react';

import PageTabs from '@/components/PageTabs';
import Users from '@/components/Users';
import Groups from '@/components/Groups';

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
        <div className="w-full items-center justify-center mt-2 text-center">Coming soon: Find events in your area</div>
      </Tab>
      <Tab key="rodas" title="Rodas" className="w-full">
        <div className="w-full items-center justify-center mt-2 text-center">
          Coming soon: Post and find public rodas
        </div>
      </Tab>
    </PageTabs>
  );
};
export default SearchPage;

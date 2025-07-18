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
        <div className="w-full items-center justify-center mt-4 text-center">
          Coming soon ...
          <br />
          <br />
          Find events like workshops or public rodas in your area
        </div>
      </Tab>
    </PageTabs>
  );
};
export default SearchPage;

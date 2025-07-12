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
      <Tab key="rodas" title="Rodas">
        <div>Rodas</div>
      </Tab>
    </PageTabs>
  );
};
export default SearchPage;

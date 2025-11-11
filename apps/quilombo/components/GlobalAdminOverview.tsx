'use client';

import { Tab, Tabs } from '@heroui/react';

import useGlobalAdminOverview from '@/hooks/useGlobalAdminOverview';
import GlobalAdminGroupsTable from '@/components/groups/GlobalAdminGroupsTable';
import GlobalAdminUsersTable from '@/components/GlobalAdminUsersTable';

const GlobalAdminOverview = () => {
  const [query, setQuery] = useGlobalAdminOverview();

  const { tab } = query;

  return (
    <div>
      <Tabs
        variant="bordered"
        aria-label="Options"
        className="mb-3"
        classNames={{ tabList: 'mb-5', panel: 'px-0' }}
        defaultSelectedKey={tab || undefined}
        onSelectionChange={(key) => {
          const tab = key.toString() as 'users' | 'groups';
          setQuery({ tab, searchBy: tab === 'users' ? 'name' : null, searchTerm: null });
        }}
      >
        <Tab key="users" title="Users">
          <GlobalAdminUsersTable />
        </Tab>
        <Tab key="groups" title="Groups">
          <GlobalAdminGroupsTable />
        </Tab>
      </Tabs>
    </div>
  );
};
export default GlobalAdminOverview;

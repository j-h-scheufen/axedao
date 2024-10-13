'use client';

import { Tab, Tabs } from '@nextui-org/tabs';

import useGlobalAdminOverview from '@/hooks/useGlobalAdminOverview';
import GlobalAdminGroupsTable from './GlobalAdminGroupsTable';
import GlobalAdminUsersTable from './GlobalAdminUsersTable';

const GlobalAdminOverview = () => {
  const [query, setQuery] = useGlobalAdminOverview();

  const { tab } = query;

  return (
    <div>
      <Tabs
        variant="bordered"
        aria-label="Options"
        className="mb-3"
        classNames={{ tabList: 'mb-5' }}
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

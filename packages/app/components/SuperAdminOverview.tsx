'use client';

import useSuperAdminOverview from '@/hooks/useSuperAdminOverview';
import { Tab, Tabs } from '@nextui-org/tabs';
import SuperAdminGroupsTable from './SuperAdminGroupsTable';
import SuperAdminUsersTable from './SuperAdminUsersTable';

const SuperAdminOverview = () => {
  const [query, setQuery] = useSuperAdminOverview();

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
          <SuperAdminUsersTable />
        </Tab>
        <Tab key="groups" title="Groups">
          <SuperAdminGroupsTable />
        </Tab>
      </Tabs>
    </div>
  );
};
export default SuperAdminOverview;

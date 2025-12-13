'use client';

import { Tab, Tabs } from '@heroui/react';

import useGlobalAdminOverview from '@/hooks/useGlobalAdminOverview';
import GlobalAdminGroupsTable from '@/components/groups/GlobalAdminGroupsTable';
import GlobalAdminUsersTable from '@/components/GlobalAdminUsersTable';
import AdminClaimsTable from '@/components/admin/AdminClaimsTable';
import AdminPersonClaimsTable from '@/components/admin/AdminPersonClaimsTable';

type AdminTab = 'users' | 'groups' | 'groupClaims' | 'profileClaims';

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
          const newTab = key.toString() as AdminTab;
          setQuery({ tab: newTab, searchBy: newTab === 'users' ? 'name' : null, searchTerm: null });
        }}
      >
        <Tab key="users" title="Users">
          <GlobalAdminUsersTable />
        </Tab>
        <Tab key="groups" title="Groups">
          <GlobalAdminGroupsTable />
        </Tab>
        <Tab key="groupClaims" title="Group Claims">
          <AdminClaimsTable />
        </Tab>
        <Tab key="profileClaims" title="Profile Claims">
          <AdminPersonClaimsTable />
        </Tab>
      </Tabs>
    </div>
  );
};
export default GlobalAdminOverview;

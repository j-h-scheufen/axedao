'use client';

import { Tabs, Tab } from '@nextui-org/tabs';
import GroupsTable from './GroupsTable';
import UsersTable from './UsersTable';

const Admin = () => {
  return (
    <div>
      <Tabs variant="bordered" aria-label="Options" className="mb-3">
        <Tab key="users" title="Users">
          <UsersTable />
        </Tab>
        <Tab key="groups" title="Groups" className="flex flex-col gap-5">
          <GroupsTable />
        </Tab>
      </Tabs>
    </div>
  );
};
export default Admin;

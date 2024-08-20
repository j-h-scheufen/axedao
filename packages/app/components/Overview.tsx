'use client';

import useOverviewQueries from '@/hooks/useOverviewQueries';
import { Tab, Tabs } from '@nextui-org/tabs';
import Groups from './Groups';
import Users from './Users';

const Overview = () => {
  const [query, setQuery] = useOverviewQueries();

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

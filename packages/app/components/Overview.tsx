'use client';

import useOverview from '@/hooks/useOverview';
import { Tab, Tabs } from '@nextui-org/tabs';
import Groups from './Groups';
import Users from './Users';

const Overview = () => {
  const [query, setQuery] = useOverview();

  const { tab } = query;

  return (
    <div>
      <Tabs
        variant="bordered"
        aria-label="Options"
        className="mb-3"
        // classNames={{ base: 'sticky top-16 left-0 z-20 bg-background' }}
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

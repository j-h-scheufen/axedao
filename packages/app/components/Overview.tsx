'use client';
import useUpdateSearchParams from '@/hooks/useUpdateSearchParams';
import { Tab, Tabs } from '@nextui-org/tabs';
import { useSearchParams } from 'next/navigation';
import Groups from './Groups';
import Users from './Users';

const Overview = () => {
  const searchParams = useSearchParams();
  const updateSearchParams = useUpdateSearchParams(searchParams);
  const tab = searchParams.get('tab');

  return (
    <div>
      <Tabs
        variant="bordered"
        aria-label="Options"
        className="mb-3"
        classNames={{ base: 'sticky top-16 left-0 z-20 bg-background' }}
        defaultSelectedKey={tab || undefined}
        onSelectionChange={(key) => updateSearchParams('tab', key.toString())}
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

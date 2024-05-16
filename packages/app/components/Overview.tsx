'use client';
import { useSearchParams } from 'next/navigation';
import { Tabs, Tab } from '@nextui-org/tabs';
import Users from './Users';
import Groups from './Groups';
import useUpdateSearchParams from '@/hooks/useUpdateSearchParams';

type Props = {};
const Overview = (props: Props) => {
  const searchParams = useSearchParams();
  const updateSearchParams = useUpdateSearchParams(searchParams);
  const tab = searchParams.get('tab');

  return (
    <div>
      <Tabs
        variant="bordered"
        aria-label="Options"
        className="mb-3"
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

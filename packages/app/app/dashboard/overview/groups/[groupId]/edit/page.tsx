'use client';

import { useSearchParams } from 'next/navigation';
import PageHeading from '@/components/PageHeading';
import GroupForm from '@/components/GroupForm';

const Page = () => {
  const searchParams = useSearchParams();
  const groupId = searchParams.get('groupId');

  return (
    <>
      <PageHeading back={`/dashboard/overview/groups/${groupId}`}>Edit group</PageHeading>
      <GroupForm />
    </>
  );
};
export default Page;

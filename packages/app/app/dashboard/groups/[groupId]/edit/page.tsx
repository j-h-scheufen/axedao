'use client';

import { useSearchParams } from 'next/navigation';
import PageHeading from '@/components/PageHeading';
import GroupForm from '@/components/GroupForm';

type Props = {};
const page = (props: Props) => {
  const searchParams = useSearchParams();
  const groupId = searchParams.get('groupId');

  return (
    <>
      <PageHeading back={`/dashboard/groups/${groupId}`}>Edit group</PageHeading>
      <GroupForm />
    </>
  );
};
export default page;

'use client';

import { useSearchParams } from 'next/navigation';
import PageHeading from '@/components/PageHeading';
import UserProfile from '@/components/UserProfile';

const Page = () => {
  const searchParams = useSearchParams();
  const groupId = searchParams.get('groupId');

  return (
    <div>
      <PageHeading back={`/dashboard/overview/groups/${groupId}`}>John Doe</PageHeading>
      <UserProfile />
    </div>
  );
};
export default Page;

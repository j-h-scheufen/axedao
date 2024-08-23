'use client';

import UserProfile from '@/app/dashboard/overview/users/[userId]/_components/UserProfile';
import PageHeading from '@/components/PageHeading';
import { useSearchParams } from 'next/navigation';

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

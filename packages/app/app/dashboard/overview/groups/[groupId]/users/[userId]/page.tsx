import UserProfile from '@/app/dashboard/overview/users/[userId]/_components/UserProfile';
import PageHeading from '@/components/PageHeading';
import { fetchUserProfile } from '@/db';

const Page = async ({ params }: { params: { userId: string } }) => {
  const userProfile = await fetchUserProfile(params.userId);
  if (!userProfile) throw new Error('No user found for the given ID');

  return (
    <div>
      <PageHeading back={`/dashboard/overview/groups/${userProfile.user.groupId}`}>John Doe</PageHeading>
      <UserProfile profile={userProfile} />
    </div>
  );
};
export default Page;

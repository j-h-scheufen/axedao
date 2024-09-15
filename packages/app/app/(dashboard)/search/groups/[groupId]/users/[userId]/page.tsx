import PageHeading from '@/components/PageHeading';
import UserProfile from '@/components/UserProfile';
import { fetchUserProfile } from '@/db';

const Page = async ({ params }: { params: { userId: string } }) => {
  const userProfile = await fetchUserProfile(params.userId);
  if (!userProfile) throw new Error('No user found for the given ID');

  return (
    <div>
      <PageHeading back={`/search/groups/${userProfile.user.groupId}`}>John Doe</PageHeading>
      <UserProfile profile={userProfile} />
    </div>
  );
};
export default Page;

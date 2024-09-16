import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import UserGroupAssociation from '@/components/UserGroupAssociation';
import UserProfile from '@/components/UserProfile';
import { fetchUserProfile } from '@/db';

const Page = async ({ params }: { params: { userId: string } }) => {
  let userProfile;
  try {
    userProfile = await fetchUserProfile(params.userId);
  } catch (error) {
    console.error('Error fetching user profile', error);
    // TODO need to handle 404
  }
  if (!userProfile) throw new Error('No user found for the given ID');
  return (
    <>
      <PageHeading back="/search?tab=users">User profile</PageHeading>
      <UserProfile profile={userProfile} />
      <SectionHeading>Group association</SectionHeading>
      <UserGroupAssociation />
    </>
  );
};

export default Page;

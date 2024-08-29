import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import { fetchUserProfile } from '@/db';
import UserGroupAssociation from './_components/UserGroupAssociation';
import UserProfile from './_components/UserProfile';

const Page = async ({ params }: { params: { userId: string } }) => {
  const userProfile = await fetchUserProfile(params.userId);
  if (!userProfile) throw new Error('No user found for the given ID');
  return (
    <>
      <PageHeading back="/dashboard/overview?tab=users">User profile</PageHeading>
      <UserProfile profile={userProfile} />
      <SectionHeading>Group association</SectionHeading>
      <UserGroupAssociation />
    </>
  );
};

export default Page;

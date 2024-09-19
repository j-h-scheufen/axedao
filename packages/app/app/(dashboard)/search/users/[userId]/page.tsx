import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import UserGroupAssociation from '@/components/UserGroupAssociation';
import UserProfile from '@/components/UserProfile';
import { fetchUserProfile } from '@/db';
import { notFound } from 'next/navigation';

const Page = async ({ params }: { params: { userId: string } }) => {
  let userProfile;
  try {
    userProfile = await fetchUserProfile(params.userId);
  } catch (error) {
    console.error('Error fetching user profile:', error);
    return notFound();
  }
  if (!userProfile) return notFound();
  return (
    <>
      <PageHeading back="/search?tab=users">User profile</PageHeading>
      <UserProfile profile={userProfile} />
      {/* TODO in the future, use the userProfile.store somewhere in this tree, if you want to seperate out the components for layout reasons. Currently ok to pass the profile into the few components that are here.*/}
      <SectionHeading>Group association</SectionHeading>
      <UserGroupAssociation group={userProfile.group} />
    </>
  );
};

export default Page;

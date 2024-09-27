import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import UserGroupAssociation from '@/components/UserGroupAssociation';
import UserProfile from '@/components/UserProfile';
import { fetchUserProfile } from '@/db';
import UserProfileProvider from '@/store/userProfile.store';
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
    <UserProfileProvider profile={userProfile}>
      <PageHeading back="/search?tab=users">User profile</PageHeading>
      <UserProfile />
      <SectionHeading>Group association</SectionHeading>
      <UserGroupAssociation />
    </UserProfileProvider>
  );
};

export default Page;

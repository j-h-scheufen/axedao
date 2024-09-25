import GroupAssociation from '@/components/GroupAssociation';
import PageHeading from '@/components/PageHeading';
import Profile from '@/components/Profile';
import SectionHeading from '@/components/SectionHeading';

// TODO bring back SSR by fetching the user profile on the server
// and using it on the regular UserProfile component to achieve
// first meaningful paint. The core user attributes should be shown
// while secondary information, e.g. the group association loads
// async. Also, pre-populate the queryClient with the user profile.

const ProfilePage = () => {
  return (
    <>
      <PageHeading>Profile</PageHeading>
      <Profile />
      <SectionHeading>Group association</SectionHeading>
      <GroupAssociation />
    </>
  );
};
export default ProfilePage;

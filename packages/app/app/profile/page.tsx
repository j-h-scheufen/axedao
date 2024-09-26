import GroupAssociation from '@/components/GroupAssociation';
import PageHeading from '@/components/PageHeading';
import Profile from '@/components/Profile';
import SectionHeading from '@/components/SectionHeading';

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

import PageHeading from '@/components/PageHeading';
import { Profile, ProfileGroupAssociation } from '@/components/Profile';
import SectionHeading from '@/components/SectionHeading';

const ProfilePage = () => {
  return (
    <>
      <PageHeading>Profile</PageHeading>
      <Profile />
      <SectionHeading>Group association</SectionHeading>
      <ProfileGroupAssociation />
    </>
  );
};
export default ProfilePage;

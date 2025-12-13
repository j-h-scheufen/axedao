import PageHeading from '@/components/PageHeading';
import { Profile, ProfileActionsDropdown, ProfileGroupAssociation } from '@/components/Profile';
import SectionHeading from '@/components/SectionHeading';

const ProfilePage = () => {
  return (
    <>
      <PageHeading actions={<ProfileActionsDropdown />}>Profile</PageHeading>
      <Profile />
      <SectionHeading>Group association</SectionHeading>
      <ProfileGroupAssociation />
    </>
  );
};
export default ProfilePage;

import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import UserGroupAssociation from '@/components/UserGroupAssociation';
import UserProfile from '@/components/UserProfile';

type Props = { params: { userId: string } };

// TODO the UserGroupAssociation is used on both the profile and users/id/ pages! Make a copy! ProfileGroupAssociation

const UserProfilePage = async ({ params: { userId } }: Props) => {
  if (!userId) return null;

  return (
    <>
      <PageHeading back="/search?tab=users">User profile</PageHeading>
      <UserProfile userId={userId} />
      <SectionHeading>Group association</SectionHeading>
      <UserGroupAssociation />
    </>
  );
};

export default UserProfilePage;

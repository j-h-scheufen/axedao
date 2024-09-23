import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import UserGroupAssociation from '@/components/UserGroupAssociation';
import UserProfile from '@/components/UserProfile';
import { PATHS } from '@/config/constants';

type Props = { params: { userId: string } };

const UserProfilePage = async ({ params: { userId } }: Props) => {
  if (!userId) return null;

  return (
    <>
      <PageHeading back={`${PATHS.search}?tab=users`}>User profile</PageHeading>
      <UserProfile userId={userId} />
      <SectionHeading>Group association</SectionHeading>
      <UserGroupAssociation />
    </>
  );
};

export default UserProfilePage;

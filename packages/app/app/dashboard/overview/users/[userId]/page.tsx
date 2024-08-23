import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import UserGroupAssociation from './_components/UserGroupAssociation';
import UserProfile from './_components/UserProfile';

const Page = () => {
  return (
    <>
      <PageHeading back="/dashboard/overview?tab=users">User profile</PageHeading>
      <UserProfile />
      <SectionHeading>Group association</SectionHeading>
      <UserGroupAssociation />
    </>
  );
};
export default Page;

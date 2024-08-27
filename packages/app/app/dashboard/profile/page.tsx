import PageHeading from '@/components/PageHeading';
import SectionHeading from '@/components/SectionHeading';
import GroupAssociation from './_components/GroupAssociation';
import Profile from './_components/Profile';

const page = () => {
  return (
    <>
      <PageHeading>Profile</PageHeading>
      <Profile />
      <SectionHeading>Group association</SectionHeading>
      <GroupAssociation />
    </>
  );
};
export default page;

import GroupAssociation from '@/components/GroupAssociation';
import PageHeading from '@/components/PageHeading';
import Profile from '@/components/Profile';
import SectionHeading from '@/components/SectionHeading';

const page = () => {
  return (
    <>
      <PageHeading>Profile</PageHeading>
      <Profile />
      <SectionHeading>Group</SectionHeading>
      <GroupAssociation />
    </>
  );
};
export default page;

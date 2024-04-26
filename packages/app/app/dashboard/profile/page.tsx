import GroupAssociation from '@/components/GroupAssociation';
import PageHeading from '@/components/PageHeading';
import Profile from '@/components/Profile';
import SectionHeading from '@/components/SectionHeading';

type Props = {};
const page = (props: Props) => {
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

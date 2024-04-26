'use client';
import PageHeading from '@/components/PageHeading';
import GroupBanner from '@/components/GroupBanner';
import GroupDetails from '@/components/GroupDetails';
import groups from '@/data/groups.json';
import SectionHeading from '@/components/SectionHeading';
import GroupMembers from '@/components/GroupMembers';

type Props = { params: { groupId: string } };
const page = ({ params: { groupId = '' } }: Props) => {
  const group = groups.find((g) => g.id.toString() === groupId);
  const { banner, email, description, logo } = group || {};
  const links = [
    'https://www.example3.com',
    'https://www.example1.com',
    'https://www.example.com',
    'https://www.example4.com',
  ];

  return (
    <div className="relative">
      <PageHeading back="/dashboard/groups">Group name</PageHeading>
      <GroupBanner banner={banner} email={email} phone="+606 772 038 739" />
      <GroupDetails description={description} links={links} logo={logo} />
      <SectionHeading>Members</SectionHeading>
      <GroupMembers />
    </div>
  );
};
export default page;

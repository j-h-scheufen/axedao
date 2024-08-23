import PageHeading from '@/components/PageHeading';
import GroupForm from '../_components/GroupForm';

type Props = { params: { groupId: string } };
const page = ({ params: { groupId = '' } }: Props) => {
  return (
    <>
      <PageHeading back={`/dashboard/overview/groups/${groupId}`}>Edit group</PageHeading>
      <GroupForm id={groupId} />
    </>
  );
};
export default page;

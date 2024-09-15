import GroupForm from '@/components/GroupForm';
import PageHeading from '@/components/PageHeading';

type Props = { params: { groupId: string } };
const page = ({ params: { groupId = '' } }: Props) => {
  return (
    <>
      <PageHeading back={`/search/groups/${groupId}`}>Edit group</PageHeading>
      <GroupForm id={groupId} />
    </>
  );
};
export default page;

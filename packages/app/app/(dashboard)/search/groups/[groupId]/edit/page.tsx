import GroupForm from '@/components/GroupForm';
import { GroupProfileClientState } from '@/components/GroupProfile';
import PageHeading from '@/components/PageHeading';
import { PATHS } from '@/config/constants';

const page = ({ params: { groupId } }: { params: { groupId: string } }) => {
  return (
    <>
      <PageHeading back={`${PATHS.groups}/${groupId}`}>Edit group</PageHeading>
      <GroupProfileClientState groupId={groupId} />
      <GroupForm />
    </>
  );
};
export default page;

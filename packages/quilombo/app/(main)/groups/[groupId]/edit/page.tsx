import { GroupEdit } from '@/components/forms/group';
import { GroupProfileClientState } from '@/components/GroupProfile';
import PageHeading from '@/components/PageHeading';
import { PATHS } from '@/config/constants';

const GroupEditPage = ({ params: { groupId } }: { params: { groupId: string } }) => {
  return (
    <>
      <PageHeading back={`${PATHS.groups}/${groupId}`}>Edit group</PageHeading>
      <GroupProfileClientState groupId={groupId}>
        <GroupEdit />
      </GroupProfileClientState>
    </>
  );
};

export default GroupEditPage;

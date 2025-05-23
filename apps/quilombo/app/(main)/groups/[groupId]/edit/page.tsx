import { GroupEdit } from '@/components/forms/group';
import { GroupProfileClientState } from '@/components/GroupProfile';
import PageHeading from '@/components/PageHeading';
import { PATHS } from '@/config/constants';
import type { NextPageProps } from '@/app/layout';

const GroupEditPage = async ({ params }: NextPageProps<{ groupId: string }>) => {
  const { groupId } = await params;

  return (
    <>
      <PageHeading backUrl={`${PATHS.groups}/${groupId}`}>Edit group</PageHeading>
      <GroupProfileClientState groupId={groupId}>
        <GroupEdit />
      </GroupProfileClientState>
    </>
  );
};

export default GroupEditPage;

import { getServerSession } from 'next-auth';
import { redirect } from 'next/navigation';

import { GroupEdit } from '@/components/forms/group';
import { GroupProfileClientState } from '@/components/groups/GroupProfile';
import PageHeading from '@/components/PageHeading';
import { PATHS } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { isGroupAdmin } from '@/db';
import type { NextPageProps } from '@/app/layout';

const GroupEditPage = async ({ params }: NextPageProps<{ groupId: string }>) => {
  const session = await getServerSession(nextAuthOptions);
  const { groupId } = await params;

  // Redirect to login if not authenticated
  if (!session?.user.id) {
    redirect(PATHS.login);
  }

  // Check if user is a group admin
  const isAdmin = await isGroupAdmin(groupId, session.user.id);

  // Redirect to group view page if not an admin
  if (!isAdmin) {
    redirect(`${PATHS.groups}/${groupId}`);
  }

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

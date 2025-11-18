import { getServerSession } from 'next-auth';
import { redirect } from 'next/navigation';

import { GroupEdit } from '@/components/forms/group';
import { GroupProfileClientState } from '@/components/groups/GroupProfile';
import PageHeading from '@/components/PageHeading';
import { PATHS } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { fetchGroup, isGroupAdmin } from '@/db';
import type { NextPageProps } from '@/app/layout';

const GroupEditPage = async ({ params }: NextPageProps<{ groupId: string }>) => {
  const session = await getServerSession(nextAuthOptions);
  const { groupId } = await params;

  // Note: Authentication is handled by middleware - session is guaranteed to exist here
  // This page only handles authorization (who can edit this specific group)
  const userId = session?.user.id ?? '';
  const isGlobalAdmin = session?.user.isGlobalAdmin ?? false;

  // Check authorization: group admin OR global admin on unmanaged groups
  const isAdmin = await isGroupAdmin(groupId, userId);
  const group = await fetchGroup(groupId);
  const canEditAsGlobalAdmin = isGlobalAdmin && group?.adminCount === 0;

  if (!isAdmin && !canEditAsGlobalAdmin) {
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

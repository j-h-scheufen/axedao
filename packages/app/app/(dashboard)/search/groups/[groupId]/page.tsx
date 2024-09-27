import { notFound } from 'next/navigation';

import GroupProfile from '@/components/GroupProfile';
import { fetchGroupProfile } from '@/db';

type Props = { params: { groupId: string } };

const GroupPage = async ({ params: { groupId = '' } }: Props) => {
  if (!groupId) return null;
  const groupProfile = await fetchGroupProfile(groupId);
  if (!groupProfile) return notFound();

  return (
    <div className="relative">
      <GroupProfile profile={groupProfile} />
    </div>
  );
};

export default GroupPage;

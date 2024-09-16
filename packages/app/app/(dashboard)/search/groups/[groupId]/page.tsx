import GroupProfile from '@/components/GroupProfile';

type Props = { params: { groupId: string } };

const GroupPage = async ({ params: { groupId = '' } }: Props) => {
  if (!groupId) return null;
  // const groupProfile = await fetchGroup(groupId);

  return (
    <div className="relative">
      <GroupProfile id={groupId} />
    </div>
  );
};

export default GroupPage;

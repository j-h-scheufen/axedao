import GroupProfile from '@/components/GroupProfile';

type Props = { params: { groupId: string } };

const GroupPage = async ({ params: { groupId } }: Props) => {
  if (!groupId) return null;

  return (
    <div className="relative">
      <GroupProfile groupId={groupId} />
    </div>
  );
};

export default GroupPage;

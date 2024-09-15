import GroupProfile from '@/components/GroupProfile';

type Props = { params: { groupId: string } };
const page = ({ params: { groupId = '' } }: Props) => {
  return (
    <div className="relative">
      <GroupProfile id={groupId} />
    </div>
  );
};
export default page;

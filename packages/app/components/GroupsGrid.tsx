import { Group } from '@/types/model';
import GroupCard from './GroupCard';

type Props = { groups: Group[] };
const GroupsGrid = ({ groups = [] }: Props) => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {groups.map((group, i) => {
        return <GroupCard key={i} group={group} />;
      })}
    </div>
  );
};
export default GroupsGrid;

import { Group } from '@/types/model';
import GroupCard from './GroupCard';
import GroupCardSkeleton from './skeletons/GroupCardSkeleton';

type Props = { groups: Group[]; isLoading?: boolean };
const GroupsGrid = ({ groups = [], isLoading = false }: Props) => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {groups.map((group, i) => {
        return <GroupCard key={i} group={group} />;
      })}
      {isLoading && [...Array(20)].map((_, i) => <GroupCardSkeleton key={i} />)}
    </div>
  );
};
export default GroupsGrid;

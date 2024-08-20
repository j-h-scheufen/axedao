import { Group } from '@/types/model';
import { Avatar, AvatarGroup, Tooltip } from '@nextui-org/react';
import GroupCard from './GroupCard';
import GroupCardSkeleton from './skeletons/GroupCardSkeleton';

type Props = { groups: Group[]; isLoading?: boolean };
const GroupsGrid = ({ groups = [], isLoading = false }: Props) => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {groups.map((group, i) => {
        return (
          <GroupCard
            key={i}
            group={group}
            startFooter={
              <AvatarGroup
                size="sm"
                max={3}
                total={20}
                renderCount={(count) => <span className="text-xs text-default-500 font-medium ms-2">+{count}</span>}
                isBordered
              >
                <Tooltip content={<span className="text-nowrap text-xs">Member 1</span>}>
                  <Avatar src="https://i.pravatar.cc/150?u=a042581f4e29026024d" />
                </Tooltip>
                <Tooltip content={<span className="text-nowrap text-xs">Member 2</span>}>
                  <Avatar src="https://i.pravatar.cc/150?u=a04258a2462d826712d" />
                </Tooltip>
                <Tooltip content={<span className="text-nowrap text-xs">Member 3</span>}>
                  <Avatar src="https://i.pravatar.cc/150?u=a042581f4e29026704d" />
                </Tooltip>
              </AvatarGroup>
            }
          />
        );
      })}
      {isLoading && [...Array(20)].map((_, i) => <GroupCardSkeleton key={i} />)}
    </div>
  );
};
export default GroupsGrid;

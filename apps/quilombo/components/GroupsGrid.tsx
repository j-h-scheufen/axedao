import type { RefObject } from 'react';

import type { Group } from '@/types/model';
import GroupCard from './GroupCard';
import GroupCardSkeleton from './skeletons/GroupCardSkeleton';

type Props = { groups?: Group[]; isLoading?: boolean; scrollerRef?: RefObject<HTMLElement> };

const GroupsGrid = ({ groups = [], isLoading = false, scrollerRef }: Props) => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3">
      {groups.map((group) => {
        return <GroupCard key={`group-card-${group.id}`} group={group} className="" />;
      })}
      {/* biome-ignore lint/suspicious/noArrayIndexKey: safe to use index as key for skeleton */}
      {isLoading && [...Array(20)].map((_, i) => <GroupCardSkeleton key={i} />)}
      {scrollerRef && <div ref={scrollerRef as RefObject<HTMLDivElement>} className="hidden" hidden />}
    </div>
  );
};
export default GroupsGrid;

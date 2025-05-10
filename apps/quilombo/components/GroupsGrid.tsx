import { RefObject } from 'react';

import { Group } from '@/types/model';
import GroupCard from './GroupCard';
import GroupCardSkeleton from './skeletons/GroupCardSkeleton';

type Props = { groups?: Group[]; isLoading?: boolean; scrollerRef?: RefObject<HTMLElement> };

const GroupsGrid = ({ groups = [], isLoading = false, scrollerRef }: Props) => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3">
      {groups.map((group, i) => {
        return <GroupCard key={i} group={group} className="" />;
      })}
      {isLoading && [...Array(20)].map((_, i) => <GroupCardSkeleton key={i} />)}
      {scrollerRef && <div ref={scrollerRef as RefObject<HTMLDivElement>} className="hidden" hidden></div>}
    </div>
  );
};
export default GroupsGrid;

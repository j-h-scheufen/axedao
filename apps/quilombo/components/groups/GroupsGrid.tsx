import type { RefObject } from 'react';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import type { Group } from '@/types/model';
import GroupCard from '@/components/groups/GroupCard';
import GroupCardSkeleton from '@/components/skeletons/GroupCardSkeleton';

type Props = {
  groups?: Group[];
  isLoading?: boolean;
  scrollerRef?: RefObject<HTMLElement | null>;
};

const GroupsGrid = ({ groups = [], isLoading = false, scrollerRef }: Props) => {
  return (
    <div className="w-full">
      <div className="grid w-full grid-cols-1 gap-3 md:gap-4 sm:grid-cols-2 md:grid-cols-3">
        {groups.map((group) => {
          return <GroupCard key={`group-card-${group.id}`} group={group} className="" />;
        })}
        {isLoading &&
          // biome-ignore lint/suspicious/noArrayIndexKey: safe to use the index for the skeletons
          [...Array(QUERY_DEFAULT_PAGE_SIZE)].map((_, i) => <GroupCardSkeleton key={`group-skeleton-${i}`} />)}
      </div>
      {/* Infinite scroll trigger - positioned at the bottom of the grid */}
      {scrollerRef && (
        <div
          ref={scrollerRef as RefObject<HTMLDivElement>}
          className="h-1 w-full mt-4"
          style={{ visibility: 'hidden' }}
          aria-hidden="true"
        />
      )}
    </div>
  );
};
export default GroupsGrid;

import type { User } from '@/types/model';
import type { RefObject } from 'react';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import UserCard from './UserCard';
import UserCardSkeleton from './skeletons/UserCardSkeleton';

type Props = {
  users?: User[];
  isLoading?: boolean;
  scrollerRef?: RefObject<HTMLElement | null>;
};
const UsersGrid = ({ users = [], isLoading = false, scrollerRef }: Props) => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3">
      {users.map((user) => (
        <UserCard key={user.id} user={user} />
      ))}
      {isLoading &&
        // biome-ignore lint/suspicious/noArrayIndexKey: safe to use the index for the skeletons
        [...Array(QUERY_DEFAULT_PAGE_SIZE)].map((_, i) => <UserCardSkeleton key={`user-skeleton-${i}`} />)}
      {/* Infinite scroll trigger - hidden but observed by intersection observer */}
      {scrollerRef && (
        <div
          ref={scrollerRef as RefObject<HTMLDivElement>}
          className="h-1 w-full col-span-full"
          style={{ visibility: 'hidden' }}
          aria-hidden="true"
        />
      )}
    </div>
  );
};
export default UsersGrid;

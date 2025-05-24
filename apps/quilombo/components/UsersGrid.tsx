import type { User } from '@/types/model';
import type { RefObject } from 'react';

import UserCard from './UserCard';
import UserCardSkeleton from './skeletons/UserCardSkeleton';

type Props = {
  users?: User[];
  isLoading?: boolean;
  scrollerRef?: RefObject<HTMLElement>;
};
const UsersGrid = ({ users = [], isLoading = false, scrollerRef }: Props) => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3">
      {users.map((user) => (
        <UserCard key={user.id} user={user} />
      ))}
      {scrollerRef && <div ref={scrollerRef as RefObject<HTMLDivElement>} className="hidden" hidden />}
      {/* biome-ignore lint/suspicious/noArrayIndexKey: safe to use the index for the skeletons */}
      {isLoading && [...Array(20)].map((_, i) => <UserCardSkeleton key={`user-card-skeleton-${i}`} />)}
    </div>
  );
};
export default UsersGrid;

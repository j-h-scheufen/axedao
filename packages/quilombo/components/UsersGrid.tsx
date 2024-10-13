import { User } from '@/types/model';
import { RefObject } from 'react';

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
      {users.map((user, i) => (
        <UserCard key={i} user={user} />
      ))}
      {scrollerRef && <div ref={scrollerRef as RefObject<HTMLDivElement>} className="hidden" hidden></div>}
      {isLoading && [...Array(20)].map((_, i) => <UserCardSkeleton key={i} />)}
    </div>
  );
};
export default UsersGrid;

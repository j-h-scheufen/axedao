import { User } from '@/types/model';
import { cn } from '@/utils/tailwind';
import { Link } from '@nextui-org/link';
import { ReactNode, RefObject } from 'react';
import UserCard, { UserCardProps } from './UserCard';

type Props = {
  users?: User[];
  emptyContent?: ReactNode;
  className?: string;
  userCardProps?: UserCardProps;
  scrollerRef?: RefObject<HTMLElement>;
};
const UsersGrid = ({ users, emptyContent, className = '', userCardProps, scrollerRef }: Props) => {
  return (
    <div className={cn('grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4', className)}>
      {users?.length ? (
        users.map((user, i) => {
          const { id } = user;
          return (
            <Link key={i} href={`/dashboard/overview/users/${id}`} className="inline-block">
              <UserCard {...((userCardProps as UserCardProps) || {})} user={user} />
            </Link>
          );
        })
      ) : (
        <div className="mb-3 text-small text-default-400">{emptyContent || 'No users to display'}</div>
      )}
      {scrollerRef && <div ref={scrollerRef as RefObject<HTMLDivElement>} className="hidden" hidden></div>}
    </div>
  );
};
export default UsersGrid;

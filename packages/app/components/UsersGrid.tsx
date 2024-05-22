import { ReactNode } from 'react';
import { Link } from '@nextui-org/link';
import UserCard, { UserCardProps } from './UserCard';
import { cn } from '@/utils/tailwind';

type Props = { users?: { id: string }[]; emptyContent?: ReactNode; className?: string; userCardProps?: UserCardProps };
const UsersGrid = ({ users, emptyContent, className = '', userCardProps = {} }: Props) => {
  return (
    <div className={cn('grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4', className)}>
      {users?.length ? (
        users.map((_, i) => (
          <Link key={i} href="/dashboard/overview/users/1" className="inline-block">
            <UserCard {...(userCardProps as any)} />
          </Link>
        ))
      ) : (
        <div className="mb-3 text-small text-default-400">{emptyContent || 'No users to display'}</div>
      )}
    </div>
  );
};
export default UsersGrid;

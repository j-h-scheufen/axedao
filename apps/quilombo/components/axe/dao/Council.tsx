'use client';

import UserCard from '@/components/UserCard';
import { useCouncil } from '@/hooks/state/dao';
import { Spinner } from '@nextui-org/spinner';

export default function Council() {
  const { members, isLoading: councilLoading, error } = useCouncil();

  if (councilLoading) {
    return <Spinner className="w-10 h-10" label="Loading..." />;
  }

  if (error) {
    return <div className="text-danger">Error: {error}</div>;
  }

  return (
    <div className="w-full flex flex-col gap-4">
      {members.length === 0 ? (
        <p className="text-lg text-gray-500 text-center">No members on the council</p>
      ) : (
        members.map((member) => <UserCard key={member.id} user={member} />)
      )}
    </div>
  );
}

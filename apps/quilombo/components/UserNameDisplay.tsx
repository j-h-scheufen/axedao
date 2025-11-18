import type { User } from '@/types/model';

type Props = { user: User };

const UserNameDisplay = ({ user }: Props) => {
  return (
    <div className="flex flex-col gap-1">
      <span className="font-semibold leading-none text-default-700">{user.nickname || user.name}</span>
      {user.nickname && user.name && (
        <span className="text-small font-semibold leading-none text-default-500 mt-1">{user.name}</span>
      )}
    </div>
  );
};

export default UserNameDisplay;

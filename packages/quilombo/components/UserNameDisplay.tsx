import { User } from '@/types/model';
import { getUserDisplayName } from '@/utils';

type Props = { user: User };

const UserNameDisplay = ({ user }: Props) => {
  return (
    <div className="flex flex-col gap-1">
      <span className="font-semibold leading-none text-default-700">{getUserDisplayName(user)}</span>
      {user.nickname && user.name && (
        <span className="text-small font-semibold leading-none text-default-500 mt-1">{user.name}</span>
      )}
    </div>
  );
};

export default UserNameDisplay;

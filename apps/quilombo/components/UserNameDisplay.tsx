import type { User } from '@/types/model';
import { getUserDisplayName } from '@/utils';

type Props = { user: User };

const UserNameDisplay = ({ user }: Props) => {
  // If both nickname and name exist, show nickname as primary and name as secondary
  if (user.nickname && user.name) {
    return (
      <div className="flex flex-col gap-1">
        <span className="font-semibold leading-none text-default-700">{user.nickname}</span>
        <span className="text-small font-semibold leading-none text-default-500 mt-1">{user.name}</span>
      </div>
    );
  }

  // Otherwise use getUserDisplayName which handles all fallbacks (name, nickname, email, Anonymous)
  return (
    <div className="flex flex-col gap-1">
      <span className="font-semibold leading-none text-default-700">{getUserDisplayName(user)}</span>
    </div>
  );
};

export default UserNameDisplay;

import { Link } from '@nextui-org/link';
import UserCard from './UserCard';

const UsersGrid = () => {
  return (
    <div className="grid w-full grid-cols-1 gap-5 xs:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {[...Array(75)].map((_, i) => (
        <Link key={i} href="/dashboard/overview/users/1" className="inline-block">
          <UserCard />
        </Link>
      ))}
    </div>
  );
};
export default UsersGrid;

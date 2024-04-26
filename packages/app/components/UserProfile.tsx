import { Avatar } from '@nextui-org/avatar';
import { Button } from '@nextui-org/button';
import { Camera, Edit } from 'lucide-react';
import Links from './Links';
import Link from 'next/link';

type Props = {};
const UserProfile = (props: Props) => {
  return (
    <div className="flex items-center gap-5">
      <Avatar
        showFallback
        src="https://images.unsplash.com/broken"
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="aspect-square h-full max-h-32 w-full max-w-32"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex gap-10">
          <div>
            <h2 className="text-lg font-medium">Jane Doe</h2>
            <div className="text-small text-default-500">Contra Mestre</div>
          </div>
        </div>
        <Links />
      </div>
    </div>
  );
};
export default UserProfile;

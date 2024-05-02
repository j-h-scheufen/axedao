import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import Links from './Links';

const UserProfile = () => {
  return (
    <div className="xs:flex xs:items-center xs:gap-5">
      <Avatar
        showFallback
        src="https://images.unsplash.com/broken"
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="xs:mx-0 xs:mb-0 mx-auto mb-5 aspect-square h-full max-h-32 w-full max-w-32"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex gap-10">
          <div className="xs:text-left xs:mx-0 mx-auto text-center">
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

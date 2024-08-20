import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import ContactInfo from './ContactInfo';

const UserProfile = () => {
  return (
    <div className="xs:flex xs:items-center xs:gap-5">
      <Avatar
        showFallback
        src="https://images.unsplash.com/broken"
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="mx-auto mb-5 aspect-square h-full max-h-32 w-full max-w-32 xs:mx-0 xs:mb-0"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex gap-10">
          <div className="mx-auto text-center xs:mx-0 xs:text-left">
            <h2 className="text-lg font-medium">Jane Doe</h2>
            <div className="text-small text-default-500">Contra Mestre</div>
          </div>
        </div>
        <ContactInfo />
      </div>
    </div>
  );
};
export default UserProfile;

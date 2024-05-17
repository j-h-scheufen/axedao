import { Avatar } from '@nextui-org/react';
import { Button } from '@nextui-org/button';
import { Camera, Edit, Mail, Phone } from 'lucide-react';
import Links from './Links';
import Link from 'next/link';

const Profile = () => {
  return (
    <div className="flex flex-col items-center gap-5 sm:flex-row">
      <Avatar
        showFallback
        src="https://images.unsplash.com/broken"
        fallback={<Camera className="h-10 w-10 animate-pulse text-default-500" strokeWidth={1} size={20} />}
        className="aspect-square h-full max-h-32 w-full max-w-32"
      />
      <div className="flex flex-1 flex-col gap-3">
        <div className="flex flex-col items-center justify-center gap-10 xs:flex-row">
          <div className="text-center xs:text-left">
            <h3 className="text-lg font-medium">John Doe</h3>
            <div className="text-small text-default-500">Mestre</div>
          </div>
          <div className="xs:mb-auto xs:ml-auto">
            <Button
              as={Link}
              href="/dashboard/profile/edit"
              startContent={<Edit className="h-4 w-4" />}
              size="sm"
              variant="bordered"
            >
              Edit profile
            </Button>
          </div>
        </div>
        <div className="mx-auto flex items-center gap-1 xs:mx-0">
          <Mail className="h-4 w-4" strokeWidth={1.4} /> example@example.com
        </div>
        <div className="mx-auto flex items-center gap-1 xs:mx-0">
          <Phone className="h-4 w-4" strokeWidth={1.4} /> +XXX XXX XXX
        </div>
        <Links className="mt-3" />
      </div>
    </div>
  );
};
export default Profile;

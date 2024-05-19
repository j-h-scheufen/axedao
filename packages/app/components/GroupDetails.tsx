import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import ContactInfo from './ContactInfo';

type Props = { description?: string; logo?: string; links?: string[] };
const GroupDetails = ({ description }: Props) => {
  return (
    <>
      <div className="mt-5 xs:flex xs:gap-5">
        <Avatar
          showFallback
          src="https://images.unsplash.com/broken"
          fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="mx-auto mb-5 block aspect-square h-full max-h-20 w-full max-w-20 xs:mx-0 xs:mb-0 xs:inline-block"
        />
        <ContactInfo />
      </div>
      <p className="mt-5 text-center text-small xs:text-left">{description}</p>
    </>
  );
};
export default GroupDetails;

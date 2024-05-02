import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import Links from './Links';

type Props = { description?: string; logo?: string; links?: string[] };
const GroupDetails = ({ description }: Props) => {
  return (
    <>
      <div className="xs:flex xs:gap-5 mt-5">
        <Avatar
          showFallback
          src="https://images.unsplash.com/broken"
          fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="xs:mx-0 xs:mb-0 xs:inline-block mx-auto mb-5 block aspect-square h-full max-h-20 w-full max-w-20"
        />
        <Links />
      </div>
      <p className="xs:text-left mt-5 text-center text-small">{description}</p>
    </>
  );
};
export default GroupDetails;

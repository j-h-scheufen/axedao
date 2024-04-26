import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import Links from './Links';

type Props = { description?: string; logo?: string; links?: string[] };
const GroupDetails = ({ description, logo, links }: Props) => {
  return (
    <>
      <div className="mt-5 flex gap-5">
        <Avatar
          showFallback
          src="https://images.unsplash.com/broken"
          fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="aspect-square h-full max-h-20 w-full max-w-20"
        />
        <Links />
      </div>
      <p className="mt-5 text-small">{description}</p>
    </>
  );
};
export default GroupDetails;

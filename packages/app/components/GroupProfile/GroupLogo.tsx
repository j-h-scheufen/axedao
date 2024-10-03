import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';

type Props = { url: string | undefined };

const GroupLogo = ({ url }: Props) => {
  return (
    <Avatar
      showFallback
      src={url}
      fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
      className="mx-auto mb-5 block aspect-square h-full max-h-20 w-full max-w-20 xs:mx-0 xs:mb-0 xs:inline-block"
    />
  );
};

export default GroupLogo;

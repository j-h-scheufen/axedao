import { Avatar } from "@heroui/avatar";
import { Camera } from 'lucide-react';

type Props = { url: string | undefined };

const GroupLogo = ({ url }: Props) => {
  return (
    <Avatar
      showFallback
      src={url}
      fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
      className="block aspect-square h-full max-h-20 w-full max-w-20 xs:inline-block"
    />
  );
};

export default GroupLogo;

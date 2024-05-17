import clsx from 'clsx';
import { Facebook, Globe, Instagram, Twitter } from 'lucide-react';

type Props = { className?: string };
const Links = ({ className = '' }: Props) => {
  return (
    <div
      className={clsx(
        'grid h-fit grid-cols-1 gap-4 text-center text-small text-default-500 xs:w-fit xs:grid-cols-2 xs:gap-y-2',
        className,
      )}
    >
      <div className="mx-auto flex items-center gap-1 xs:mx-0">
        <Globe className="h-4 w-4" strokeWidth={1.4} /> www.johndoe.com
      </div>
      <div className="mx-auto flex items-center gap-1 xs:mx-0">
        <Instagram className="h-4 w-4" strokeWidth={1.4} /> RealJohnDoe
      </div>
      <div className="mx-auto flex items-center gap-1 xs:mx-0">
        <Facebook className="h-4 w-4" strokeWidth={1.4} /> JohnDoeOfficial
      </div>
      <div className="mx-auto flex items-center gap-1 xs:mx-0">
        <Twitter className="h-4 w-4" strokeWidth={1.4} /> TheRealJohnDoe
      </div>
    </div>
  );
};
export default Links;

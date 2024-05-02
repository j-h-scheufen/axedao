import clsx from 'clsx';
import { Facebook, Globe, Instagram, Mail, Phone, Twitter } from 'lucide-react';

type Props = { className?: string };
const Links = ({ className = '' }: Props) => {
  return (
    <div
      className={clsx(
        'xs:w-fit xs:grid-cols-2 xs:gap-y-2 grid h-fit grid-cols-1 gap-4 text-center text-small text-default-500',
        className,
      )}
    >
      <div className="xs:mx-0 mx-auto flex items-center gap-1">
        <Globe className="h-4 w-4" strokeWidth={1.4} /> www.johndoe.com
      </div>
      <div className="xs:mx-0 mx-auto flex items-center gap-1">
        <Mail className="h-4 w-4" strokeWidth={1.4} /> example@example.com
      </div>
      <div className="xs:mx-0 mx-auto flex items-center gap-1">
        <Phone className="h-4 w-4" strokeWidth={1.4} /> +XXX XXX XXX
      </div>
      <div className="xs:mx-0 mx-auto flex items-center gap-1">
        <Instagram className="h-4 w-4" strokeWidth={1.4} /> RealJohnDoe
      </div>
      <div className="xs:mx-0 mx-auto flex items-center gap-1">
        <Facebook className="h-4 w-4" strokeWidth={1.4} /> JohnDoeOfficial
      </div>
      <div className="xs:mx-0 mx-auto flex items-center gap-1">
        <Twitter className="h-4 w-4" strokeWidth={1.4} /> TheRealJohnDoe
      </div>
    </div>
  );
};
export default Links;

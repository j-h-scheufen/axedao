import { GroupProfile } from '@/types/model';
import clsx from 'clsx';
import { FacebookIcon, InstagramIcon, LinkIcon, LinkedinIcon, TwitterIcon } from 'lucide-react';

const icons = {
  twitter: TwitterIcon,
  facebook: FacebookIcon,
  instagram: InstagramIcon,
  linkedin: LinkedinIcon,
};

type Props = { className?: string; links?: GroupProfile['links'] };
const ContactInfo = ({ className = '', links = [] }: Props) => {
  return (
    <div
      className={clsx(
        'grid h-fit grid-cols-1 gap-4 text-center text-small text-default-500 xs:w-fit xs:grid-cols-2 xs:gap-y-2',
        className,
      )}
    >
      {links.map((link) => {
        const { type, url, id } = link;
        const Icon = type ? icons[type] : LinkIcon;
        return (
          <div key={id} className="mx-auto flex items-center gap-1 xs:mx-0">
            <Icon className="h-4 w-4" strokeWidth={1.4} /> {url}
          </div>
        );
      })}
    </div>
  );
};
export default ContactInfo;

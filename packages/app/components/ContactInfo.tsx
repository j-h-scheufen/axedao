import useContactInfo from '@/hooks/useContactInfo';
import { GroupProfile } from '@/types/model';
import clsx from 'clsx';
import ContactInfoSkeleton from './skeletons/ContactInfoSkeleton';

type Props = { className?: string; links?: GroupProfile['links']; isLoading?: boolean };
const ContactInfo = ({ className = '', links = [], isLoading }: Props) => {
  const { getLinkIcon } = useContactInfo();
  if (isLoading) return <ContactInfoSkeleton />;
  return (
    <div className={clsx('flex flex-wrap gap-3 h-fit w-full text-small text-default-500', className)}>
      {links.map((link) => {
        const { type, url, id } = link;
        const Icon = getLinkIcon(type);
        return (
          <div key={id} className="mx-auto flex items-center gap-1 text-default-400 hover:text-primary xs:mx-0">
            <Icon className="pointer-events-none h-4 w-4 flex-shrink-0" strokeWidth={1.4} />
            <a href={url} target="_blank" className="link">
              {url}
            </a>
          </div>
        );
      })}
    </div>
  );
};
export default ContactInfo;

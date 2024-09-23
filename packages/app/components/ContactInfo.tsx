'use client';

import useContactInfo from '@/hooks/useContactInfo';
import { Group } from '@/types/model';
import clsx from 'clsx';
import ContactInfoSkeleton from './skeletons/ContactInfoSkeleton';

type Props = { className?: string; links?: Group['links']; isLoading?: boolean };
const ContactInfo = ({ className = '', links = [], isLoading }: Props) => {
  const { getLinkIcon } = useContactInfo();
  if (isLoading) return <ContactInfoSkeleton />;
  return (
    <div className={clsx('flex flex-wrap gap-2 h-fit w-full text-small text-default-500', className)}>
      {links.map((link, index) => {
        const { type, url } = link;
        const Icon = getLinkIcon(type ?? null);
        return (
          <div
            key={`link-item-${index}`}
            className="mx-auto flex items-center gap-1 text-default-400 hover:text-primary xs:mx-0"
          >
            <Icon className="pointer-events-none h-4 w-4 flex-shrink-0" strokeWidth={1.4} />
            <a href={url.startsWith('https://') ? url : `https://${url}`} target="_blank" className="link">
              {url}
            </a>
          </div>
        );
      })}
    </div>
  );
};
export default ContactInfo;

'use client';

import useContactInfo from '@/hooks/useContactInfo';
import type { Group } from '@/types/model';
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
        const showUrl = !type || type === 'website';

        return (
          <a
            // biome-ignore lint/suspicious/noArrayIndexKey: Safe to use the index as key here
            key={`link-item-${index}`}
            href={url}
            target="_blank"
            rel="noreferrer"
            className="flex gap-1 items-center text-default-400 hover:text-primary"
          >
            <Icon className="h-4 w-4 flex-shrink-0" strokeWidth={1.4} />
            {showUrl && <span className="link">{url}</span>}
          </a>
        );
      })}
    </div>
  );
};
export default ContactInfo;

import { SiX } from '@icons-pack/react-simple-icons';
import type { ZonedDateTime } from '@internationalized/date';
import { Facebook, Instagram, LinkedinIcon, LinkIcon } from 'lucide-react';

export const getLinkIcon = (domain: string | null | undefined) => {
  switch (domain) {
    case 'facebook':
      return <Facebook className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
    case 'instagram':
      return <Instagram className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
    case 'linkedin':
      return <LinkedinIcon className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
    case 'twitter':
      return <SiX className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
    default:
      return <LinkIcon className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
  }
};

export const formatDate = (date: ZonedDateTime | Date) => {
  const jsDate = date instanceof Date ? date : date.toDate();
  return new Intl.DateTimeFormat(undefined, {
    year: 'numeric',
    month: 'numeric',
    day: 'numeric',
  }).format(jsDate);
};

export const formatTime = (date: ZonedDateTime | Date) => {
  const jsDate = date instanceof Date ? date : date.toDate();
  return new Intl.DateTimeFormat(undefined, {
    hour: 'numeric',
    minute: '2-digit',
  }).format(jsDate);
};

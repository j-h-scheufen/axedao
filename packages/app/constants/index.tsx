import { SiX } from '@icons-pack/react-simple-icons';
import { Facebook, Instagram, LinkedinIcon, LinkIcon } from 'lucide-react';

export const titles = [
  'mestre',
  'contra-mestre',
  'mestrando',
  'professor',
  'instrutor',
  'monitor',
  'aluno-graduado',
  'aluno',
  'iniciante',
] as const;

export const linkTypes = ['twitter', 'facebook', 'instagram', 'linkedin'] as const;

export const validFileExtensions = { image: ['jpg', 'gif', 'png', 'jpeg', 'svg', 'webp'] } as const;

export const linkBaseUrls = [
  {
    type: 'twitter',
    baseUrls: ['twitter.com', 'twitter.co', 'x.com', 'twitterinc.com'],
  },
  {
    type: 'facebook',
    baseUrls: ['facebook.com', 'facebook.co', 'facebook.net', 'fb.com', 'fb.me'],
  },
  {
    type: 'instagram',
    baseUrls: ['instagram.com', 'ig.me'],
  },
  {
    type: 'linkedin',
    baseUrls: ['linkedin.com', 'linkedin.cn'],
  },
];

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

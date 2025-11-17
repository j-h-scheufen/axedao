'use client';
import { SiX } from '@icons-pack/react-simple-icons';
import { Facebook, Instagram, LinkIcon, LinkedinIcon, Globe } from 'lucide-react';
import { useCallback } from 'react';

const useContactInfo = () => {
  const getLinkIcon = useCallback((type: string | null) => {
    switch (type) {
      case 'facebook':
        return Facebook;
      case 'instagram':
        return Instagram;
      case 'linkedin':
        return LinkedinIcon;
      case 'twitter':
        return SiX;
      case 'website':
        return Globe;
      default:
        return LinkIcon;
    }
  }, []);
  return { getLinkIcon };
};

export default useContactInfo;

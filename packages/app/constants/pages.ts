import { LucideIcon, User } from 'lucide-react';
import { OverviewLayout } from '@/components/icons';

export type PageType = { href: string; name: string; icon?: LucideIcon };
const pages: PageType[] = [
  {
    href: '/dashboard/profile',
    name: 'Profile',
    icon: User,
  },
  {
    href: '/dashboard/overview',
    name: 'Overview',
    icon: OverviewLayout,
  },
];

export default pages;

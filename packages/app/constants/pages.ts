import { OverviewLayout } from '@/components/icons';
import { LucideIcon, Shield, User } from 'lucide-react';

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
  {
    href: '/dashboard/super-admin',
    name: 'Super Admin',
    icon: Shield,
  },
];

export default pages;

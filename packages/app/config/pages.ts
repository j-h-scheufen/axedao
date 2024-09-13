import { OverviewLayout } from '@/components/icons';
import { LucideIcon, Shield, User, Wallet2 } from 'lucide-react';

export type PageType = { href: string; name: string; icon?: LucideIcon; forGlobalAdminOnly?: boolean };
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
    href: '/dashboard/axe',
    name: 'Axé',
    icon: Wallet2,
  },
  {
    href: '/dashboard/global-admin',
    name: 'Admin',
    icon: Shield,
    forGlobalAdminOnly: true,
  },
];

export default pages;

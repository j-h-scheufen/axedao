'use client';

import {
  Avatar,
  Link,
  Dropdown,
  DropdownItem,
  DropdownMenu,
  DropdownTrigger,
  NavbarBrand,
  NavbarContent,
  NavbarItem,
  NavbarMenu,
  NavbarMenuItem,
  NavbarMenuToggle,
  Navbar as NextUINavbar,
} from '@heroui/react';
import { useAtomValue } from 'jotai';
import { useSession } from 'next-auth/react';
import NextLink from 'next/link';
import { usePathname } from 'next/navigation';
import { useState } from 'react';
import clsx from 'clsx';

import { PATHS } from '@/config/constants';
import { currentUserAtom, currentUserAvatarUrlAtom } from '@/hooks/state/currentUser';
import useAuth from '@/hooks/useAuth';
import { getUserDisplayName } from '@/utils';
import OnboardingModal from './OnboardingModal';
import { useSyncManager } from '@/hooks/useSyncManager';

const Navbar: React.FC = () => {
  const { data: session } = useSession();
  const pathname = usePathname();
  const { data: user } = useAtomValue(currentUserAtom);
  const avatarUrl = useAtomValue(currentUserAvatarUrlAtom);
  const { logout } = useAuth();
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  useSyncManager();

  const isPathDashboard = pathname === PATHS.search;
  const isPathAxe = pathname === PATHS.axe;
  const isPathDao = pathname === PATHS.dao;

  const NAV_PAGES = [
    { key: 'search', label: 'Find', path: PATHS.search },
    { key: 'axe', label: 'Axé', path: PATHS.axe },
    { key: 'dao', label: 'Organization', path: PATHS.dao },
  ];

  // Determine active page
  const activePage = NAV_PAGES.find((p) => pathname === p.path) || NAV_PAGES[0];
  const inactivePages = NAV_PAGES.filter((p) => p.key !== activePage.key);

  return (
    <>
      <NextUINavbar
        maxWidth="md"
        position="sticky"
        shouldHideOnScroll={false}
        isMenuOpen={isMenuOpen}
        onMenuOpenChange={setIsMenuOpen}
        classNames={{
          // WORKAROUND: HeroUI Navbar doesn't output dark:bg-background/20 on Vercel builds
          // We use a custom CSS class defined in globals.css instead
          // See: docs/DARK_MODE_INVESTIGATION.md
          base: ['navbar-dark-bg'],
          item: ['data-[active=true]:text-primary-400', 'data-[active=true]:dark:text-primary'],
          menuItem: ['data-[active=true]:text-primary-400', 'data-[active=true]:dark:text-primary'],
        }}
      >
        <NavbarContent>
          <NavbarMenuToggle aria-label={isMenuOpen ? 'Close menu' : 'Open menu'} className="sm:hidden" />
          <NavbarBrand>
            <NextLink className="flex items-center justify-start gap-1" href="/">
              <h1 className="text-2xl font-bold">Quilombo</h1>
            </NextLink>
          </NavbarBrand>
        </NavbarContent>

        <NavbarContent className="flex sm:hidden w-full" justify="center">
          <NavbarItem isActive>
            <Link color="primary" href={activePage.path} size="lg" className="text-xl font-bold">
              {activePage.label}
            </Link>
          </NavbarItem>
        </NavbarContent>

        <NavbarContent className="hidden sm:flex gap-4" justify="center">
          <NavbarItem isActive={isPathDashboard}>
            <Link
              color="foreground"
              href={PATHS.search}
              size="lg"
              className={clsx('text-inherit w-full', isPathDashboard && 'text-xl font-bold')}
            >
              Find
            </Link>
          </NavbarItem>
          <NavbarItem isActive={isPathAxe}>
            <Link
              color="foreground"
              href={PATHS.axe}
              size="lg"
              className={clsx('text-inherit w-full', isPathAxe && 'text-xl font-bold')}
            >
              Axé
            </Link>
          </NavbarItem>
          <NavbarItem isActive={isPathDao}>
            <Link
              color="foreground"
              href={PATHS.dao}
              size="lg"
              className={clsx('text-inherit w-full', isPathDao && 'text-xl font-bold')}
            >
              Organization
            </Link>
          </NavbarItem>
        </NavbarContent>

        <NavbarContent justify="end">
          {session && !!user && (
            <Dropdown placement="bottom-end">
              <DropdownTrigger>
                <Avatar
                  isBordered
                  as="button"
                  className="transition-transform"
                  color="primary"
                  name={user.name || undefined}
                  size="sm"
                  src={avatarUrl}
                />
              </DropdownTrigger>
              <DropdownMenu aria-label="Profile Actions" variant="flat">
                <DropdownItem
                  key="profile"
                  className="h-14 gap-2"
                  textValue={`Signed in as ${getUserDisplayName(user)}`}
                >
                  <p className="font-semibold">Signed in as</p>
                  <p className="font-semibold">{getUserDisplayName(user)}</p>
                </DropdownItem>
                <DropdownItem key="my-profile" href={PATHS.profile}>
                  My Profile
                </DropdownItem>
                <DropdownItem
                  key="my-group"
                  href={`${PATHS.groups}/${user.groupId || ''}`}
                  className={user.groupId ? '' : 'hidden'}
                >
                  My Group
                </DropdownItem>
                <DropdownItem key="invites" href={PATHS.invites}>
                  Invite Friends
                </DropdownItem>
                <DropdownItem key="settings" href={PATHS.settings}>
                  Settings
                </DropdownItem>
                <DropdownItem key="admin" href={PATHS.admin} className={user.isGlobalAdmin ? '' : 'hidden'}>
                  Admin
                </DropdownItem>
                <DropdownItem key="logout" color="danger" onPress={logout}>
                  Log out
                </DropdownItem>
              </DropdownMenu>
            </Dropdown>
          )}
        </NavbarContent>
        {/* Mobile burger menu */}
        <NavbarMenu>
          {inactivePages.map((page) => (
            <NavbarMenuItem key={page.key}>
              <Link
                color="foreground"
                className="text-inherit w-full"
                href={page.path}
                size="lg"
                onPress={() => setIsMenuOpen(false)}
              >
                {page.label}
              </Link>
            </NavbarMenuItem>
          ))}
        </NavbarMenu>
      </NextUINavbar>
      <OnboardingModal />
    </>
  );
};

export default Navbar;

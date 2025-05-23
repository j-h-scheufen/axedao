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

  return (
    <>
      <NextUINavbar
        maxWidth="md"
        position="sticky"
        shouldHideOnScroll={false}
        isMenuOpen={isMenuOpen}
        onMenuOpenChange={setIsMenuOpen}
        classNames={{
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
          <NavbarItem isActive={isPathDashboard}>
            <Link color="foreground" href={PATHS.search} size="lg" className="text-inherit">
              Search
            </Link>
          </NavbarItem>
        </NavbarContent>

        <NavbarContent className="hidden sm:flex gap-4" justify="center">
          <NavbarItem isActive={isPathDashboard}>
            <Link color="foreground" href={PATHS.search} size="lg" className="text-inherit">
              Search
            </Link>
          </NavbarItem>
          <NavbarItem isActive={isPathAxe}>
            <Link color="foreground" href={PATHS.axe} size="lg" className="text-inherit">
              Axé
            </Link>
          </NavbarItem>
          <NavbarItem isActive={isPathDao}>
            <Link color="foreground" href={PATHS.dao} size="lg" className="text-inherit">
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
                <DropdownItem key="profile" className="h-14 gap-2">
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
        <NavbarMenu>
          <NavbarMenuItem isActive={isPathAxe}>
            <Link
              color="foreground"
              className="w-full text-inherit"
              href={PATHS.axe}
              size="lg"
              onPress={() => setIsMenuOpen(false)}
            >
              Axé
            </Link>
          </NavbarMenuItem>
          <NavbarMenuItem isActive={isPathDao}>
            <Link
              color="foreground"
              className="w-full text-inherit"
              href={PATHS.dao}
              size="lg"
              onPress={() => setIsMenuOpen(false)}
            >
              Organization
            </Link>
          </NavbarMenuItem>
        </NavbarMenu>
      </NextUINavbar>
      <OnboardingModal />
    </>
  );
};

export default Navbar;

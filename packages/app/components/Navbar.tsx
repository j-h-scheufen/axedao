'use client';

import { Avatar } from '@nextui-org/avatar';
import { Dropdown, DropdownItem, DropdownMenu, DropdownTrigger } from '@nextui-org/dropdown';
import { Link } from '@nextui-org/link';
import {
  NavbarBrand,
  NavbarContent,
  NavbarItem,
  NavbarMenu,
  NavbarMenuItem,
  NavbarMenuToggle,
  Navbar as NextUINavbar,
} from '@nextui-org/navbar';
import { useSession } from 'next-auth/react';
import NextLink from 'next/link';
import { usePathname } from 'next/navigation';
import { useState } from 'react';

import { PATHS } from '@/config/constants';
import useAuth from '@/hooks/useAuth';
import { initProfile } from '@/hooks/useCurrentUser';
import { getUserDisplayName } from '@/utils';
import { ThemeSwitch } from './ThemeSwitch';

const Navbar: React.FC = () => {
  const { data: session } = useSession();
  const pathname = usePathname();
  const { profile } = initProfile();
  const { logout } = useAuth();
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const isPathDashboard = pathname === PATHS.search;
  const isPathAxe = pathname === PATHS.axe;
  const isPathDao = pathname === PATHS.dao;

  return (
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

      <NavbarContent as="div" justify="end">
        <ThemeSwitch />
        {session && (
          <Dropdown placement="bottom-end">
            <DropdownTrigger>
              <Avatar
                isBordered
                as="button"
                className="transition-transform"
                color="primary"
                name={profile?.user.name || undefined}
                size="sm"
                src={profile?.user.avatar || undefined}
              />
            </DropdownTrigger>
            <DropdownMenu aria-label="Profile Actions" variant="flat">
              <DropdownItem key="profile" className="h-14 gap-2">
                <p className="font-semibold">Signed in as</p>
                <p className="font-semibold">
                  {profile?.user ? getUserDisplayName(profile.user) : profile?.user.email}
                </p>
              </DropdownItem>
              <DropdownItem key="my-profile" href={PATHS.profile}>
                My Profile
              </DropdownItem>
              <DropdownItem
                key="my-group"
                href={`${PATHS.groups}/${profile?.user.groupId || ''}`}
                className={!!profile?.user.groupId ? '' : 'hidden'}
              >
                My Group
              </DropdownItem>
              <DropdownItem key="admin" href={PATHS.admin} className={profile?.user.isGlobalAdmin ? '' : 'hidden'}>
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
        <NavbarMenuItem isActive={isPathDashboard}>
          <Link
            color="foreground"
            className="w-full text-inherit"
            href={PATHS.search}
            size="lg"
            onPress={() => setIsMenuOpen(false)}
          >
            Dashboard
          </Link>
        </NavbarMenuItem>
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
  );
};

export default Navbar;

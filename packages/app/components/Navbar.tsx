'use client';

import { Navbar as NextUINavbar, NavbarContent, NavbarBrand } from '@nextui-org/navbar';
import NextLink from 'next/link';
import { ConnectButton } from '@rainbow-me/rainbowkit';

import { Card } from '@nextui-org/react';

import { ThemeSwitch } from './theme-switch';
// import Account from './web3/Account';

const Navbar: React.FC = () => {
  return (
    <NextUINavbar maxWidth="xl" position="sticky" shouldHideOnScroll={false}>
      <NavbarContent className="basis-1/5 sm:basis-full" justify="center">
        <NavbarBrand className="mr-auto max-w-fit gap-3">
          <NextLink className="flex items-center justify-start gap-1" href="/">
            <Card className="flex flex-row gap-1 bg-secondary p-2 dark:text-black">
              <p className="text-lg font-bold text-inherit">Home</p>
            </Card>
          </NextLink>
        </NavbarBrand>
        <ThemeSwitch />
        {/* <Account /> */}
        <ConnectButton />
      </NavbarContent>
    </NextUINavbar>
  );
};

export default Navbar;

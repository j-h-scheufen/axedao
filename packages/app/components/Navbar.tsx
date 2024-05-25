'use client';

import { Navbar as NextUINavbar, NavbarContent, NavbarBrand } from '@nextui-org/navbar';
import NextLink from 'next/link';
// import { ConnectButton } from '@rainbow-me/rainbowkit';

// import { Card } from '@nextui-org/card';

import { ThemeSwitch } from './theme-switch';
import AuthButton from './AuthButton';
// import Account from './web3/Account';

const Navbar: React.FC = () => {
  return (
    <NextUINavbar maxWidth="xl" position="sticky" shouldHideOnScroll={false}>
      <NavbarContent className="basis-full" justify="center">
        <NavbarBrand className="mr-auto max-w-fit gap-3">
          <NextLink className="flex items-center justify-start gap-1" href="/">
            <h1 className="text-lg font-bold">Quilombo</h1>
          </NextLink>
        </NavbarBrand>
        <ThemeSwitch />
        {/* <Account /> */}
        {/* <ConnectButton /> */}
        <AuthButton />
      </NavbarContent>
    </NextUINavbar>
  );
};

export default Navbar;

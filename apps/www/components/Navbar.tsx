import { Button, Link, NavbarContent, Navbar as NextUINavbar } from '@heroui/react';

// import { siteConfig } from '@/config/site';
// import NextLink from 'next/link';
// import { link as linkStyles } from '@heroui/theme';
// import clsx from 'clsx';

import ENV from '@/config/environment';
import LocaleSwitch from './LocaleSwitch';
import ThemeSwitch from './ThemeSwitch';

const Navbar: React.FC = () => {
  return (
    <NextUINavbar maxWidth="full" position="sticky" shouldHideOnScroll={false}>
      <NavbarContent justify="end">
        <ThemeSwitch />
        <LocaleSwitch />
        <Button as={Link} className="flex flex-row p-2" href={ENV.appUrl}>
          <p className="text-lg text-inherit">APP</p>
        </Button>
      </NavbarContent>
    </NextUINavbar>
  );
};

export default Navbar;

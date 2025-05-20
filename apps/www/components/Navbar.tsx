import { Navbar as NextUINavbar, NavbarContent } from '@nextui-org/navbar';
import { Button } from '@nextui-org/button';

// import { siteConfig } from '@/config/site';
// import NextLink from 'next/link';
// import { link as linkStyles } from '@nextui-org/theme';
// import clsx from 'clsx';

import ENV from '@/config/environment';
import ThemeSwitch from './ThemeSwitch';
import LocaleSwitch from './LocaleSwitch';
import { Link } from '@nextui-org/link';

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

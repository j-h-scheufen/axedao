import { Navbar as NextUINavbar, NavbarContent } from '@nextui-org/navbar';
// import { siteConfig } from '@/config/site';
// import NextLink from 'next/link';
import { Button, Link } from '@nextui-org/react';
// import { link as linkStyles } from '@nextui-org/theme';
// import clsx from 'clsx';

import ENV from '@/config/environment';
import { ThemeSwitch } from './theme-switch';

const Navbar: React.FC = () => {
  return (
    <NextUINavbar maxWidth="full" position="sticky" shouldHideOnScroll={false}>
      <NavbarContent className="basis-1/5 sm:basis-full" justify="end">
        {/* <NavbarBrand className="mr-auto max-w-fit gap-3">
          <NextLink className="flex items-center justify-start gap-1" href="/">
            <Card className="flex flex-row gap-1 bg-white p-2">
              <Image
                alt="AXÉ Logo"
                src="/logos/axe.png"
                height="30px"
                width="30px"
              />
              <p className="text-lg font-bold text-inherit">AXÉ DAO</p>
            </Card>
          </NextLink>
        </NavbarBrand>
        {siteConfig.navItems.map((item) => (
          <NavbarItem key={item.href}>
            <NextLink
              className={clsx(
                linkStyles({ color: 'foreground' }),
                'data-[active=true]:font-medium data-[active=true]:text-primary'
              )}
              color="foreground"
              href={item.href}
            >
              {item.label}
            </NextLink>
          </NavbarItem>
        ))} */}
        <ThemeSwitch className="ml-auto" />
        <Button as={Link} className="flex flex-row p-2" href={ENV.appUrl}>
          <p className="text-lg text-inherit">APP</p>
        </Button>
      </NavbarContent>
    </NextUINavbar>
  );
};

export default Navbar;

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

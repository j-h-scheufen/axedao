'use client';

import { useProfile } from '@/app/dashboard/profile/store';
import pages, { PageType } from '@/constants/pages';
import useScreenSize from '@/hooks/useScreenSize';
import { cn } from '@/utils/tailwind';
import { Tab, Tabs } from '@nextui-org/tabs';
import { usePathname, useRouter } from 'next/navigation';
import { useEffect, useMemo, useState } from 'react';

type SidebarListProps = { pages: PageType[]; selectedPage?: string };
const SidebarList = ({ pages, selectedPage }: SidebarListProps) => {
  const router = useRouter();
  const profile = useProfile();
  const { isGlobalAdmin } = profile;

  return (
    <Tabs
      size="sm"
      variant="light"
      color="primary"
      aria-label="Navigation tabs"
      classNames={{
        base: 'px-0 h-fit w-full',
        tabList: 'flex flex-col w-full',
        tab: 'px-0 justify-start items-center w-full text-small',
        cursor: 'bg-transparent',
      }}
      selectedKey={selectedPage}
      onSelectionChange={(href) => router.push(href as string)}
    >
      {pages.map(({ name, href, icon: Icon, forGlobalAdminOnly }) => {
        const active = href === selectedPage;
        if (forGlobalAdminOnly && !isGlobalAdmin) return null;
        return (
          <Tab
            key={href}
            title={
              <div
                className={cn('flex items-center gap-2 hover:text-primary hover:opacity-100', {
                  'text-primary font-medium': active,
                })}
              >
                {Icon && <Icon className="h-4 w-4" fill={active ? 'currentColor' : 'none'} strokeWidth={1.25} />}
                <span>{name}</span>
              </div>
            }
          />
        );
      })}
    </Tabs>
  );
};

const Sidebar = () => {
  const [hidden, setHidden] = useState(false);

  const router = useRouter();
  const pathname = usePathname();
  const { width } = useScreenSize();
  const isSmallScreen = width < 768;

  useEffect(() => {
    setHidden(isSmallScreen);
  }, [isSmallScreen]);

  const selectedPage = useMemo(() => {
    return pathname.split('/').slice(0, 3).join('/');
  }, [pathname]);

  useEffect(() => {
    const currentPage = pathname.split('/').slice(0, 3).join('/');
    if (selectedPage === currentPage || isSmallScreen) return;
    router.push(selectedPage);
  }, [pathname, selectedPage, isSmallScreen, width, router]);

  if (hidden) return null;

  return (
    <div className={cn('fixed left-0 top-0 h-screen w-56 p-6 pb-6 pt-16 md:flex md:flex-col', { hidden })}>
      <SidebarList pages={pages} selectedPage={selectedPage} />
    </div>
  );
};
export default Sidebar;

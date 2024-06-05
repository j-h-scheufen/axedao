'use client';
import { useMemo } from 'react';
import { usePathname, useRouter } from 'next/navigation';
import { Tabs, Tab } from '@nextui-org/tabs';
import pages from '@/constants/pages';
import useScreenSize from '@/hooks/useScreenSize';

const BottomBar = () => {
  const router = useRouter();
  const pathname = usePathname();
  const { width } = useScreenSize();
  const isLargeScreen = width >= 768;

  const selectedPage = useMemo(() => {
    return pathname.split('/').slice(0, 3).join('/');
  }, [pathname]);

  if (isLargeScreen) return null;

  return (
    <div className="fixed bottom-0 left-0 z-20 block h-12 w-full bg-background px-5 md:hidden">
      <Tabs
        size="sm"
        variant="underlined"
        color="primary"
        aria-label="Navigation tabs"
        classNames={{ base: 'flex w-full h-full mx-auto max-w-sm', tabList: 'w-full h-full mx-auto', tab: 'h-full' }}
        selectedKey={selectedPage}
        onSelectionChange={(href) => router.push(href as string)}
      >
        {pages.map(({ name, href, icon: Icon }) => {
          const active = href === selectedPage;
          return (
            <Tab
              key={href}
              title={
                <div className="flex flex-col items-center">
                  {Icon && <Icon className="h-4 w-4" fill={active ? 'currentColor' : 'none'} strokeWidth={1.25} />}
                  <span>{name}</span>
                </div>
              }
            />
          );
        })}
      </Tabs>
    </div>
  );
};
export default BottomBar;
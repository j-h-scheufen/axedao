'use client';
import { usePathname } from 'next/navigation';
import { Tabs, Tab } from '@nextui-org/tabs';
import pages from '@/constants/pages';

type Props = {};
const BottomBar = (props: Props) => {
  const pathname = usePathname();
  const selectedPage = pathname.split('/').slice(0, 3).join('/');

  return (
    <div className="fixed bottom-0 left-0 z-20 h-12 w-full bg-black px-5 md:hidden">
      <Tabs
        size="sm"
        variant="underlined"
        color="primary"
        aria-label="Navigation tabs"
        classNames={{ base: 'flex w-full h-full mx-auto max-w-sm', tabList: 'w-full h-full mx-auto', tab: 'h-full' }}
        selectedKey={selectedPage}
      >
        {pages.map(({ name, href, icon: Icon }) => {
          return (
            <Tab
              key={href}
              href={href}
              title={
                <div className="flex flex-col items-center">
                  <Icon className="h-4 w-4" />
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

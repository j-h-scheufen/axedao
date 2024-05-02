'use client';

import { usePathname } from 'next/navigation';
import clsx from 'clsx';
import pages from '@/constants/pages';
import { Listbox, ListboxItem } from '@nextui-org/listbox';

const Sidebar = () => {
  const pathname = usePathname();
  const selectedPage = pathname.split('/').slice(0, 3).join('/');

  return (
    <div className="fixed left-0 top-0 hidden h-screen w-56 p-6 py-16 md:block">
      <Listbox
        aria-label="Dashboard pages"
        variant="light"
        disallowEmptySelection
        selectionMode="single"
        selectedKeys={[selectedPage]}
        hideSelectedIcon
      >
        {pages.map(({ href, name, icon: Icon }) => {
          const active = href === selectedPage;
          return (
            <ListboxItem
              key={href}
              href={href}
              classNames={{
                base: clsx({ 'text-primary': active, 'hover:!text-primary focus:!text-primary': !active }),
              }}
              startContent={
                <Icon className="mr-1 h-4 w-4" fill={active ? 'currentColor' : 'none'} strokeWidth={1.25} />
              }
            >
              {name}
            </ListboxItem>
          );
        })}
      </Listbox>
    </div>
  );
};
export default Sidebar;

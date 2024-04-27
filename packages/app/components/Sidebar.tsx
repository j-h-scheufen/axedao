'use client';
import { usePathname } from 'next/navigation';
import pages from '@/constants/pages';
import { Listbox, ListboxItem } from '@nextui-org/listbox';
import { useState } from 'react';

const Sidebar = () => {
  const [selectedKeys, setSelectedKeys] = useState<any>(new Set([pages[0].href]));

  const pathname = usePathname();

  // const selectedValue = useMemo(() => Array.from(selectedKeys).join(', '), [selectedKeys]);

  return (
    <div className="fixed left-0 top-0 h-screen w-64 p-6 py-20">
      <Listbox
        aria-label="Dashboard pages"
        variant="solid"
        disallowEmptySelection
        selectionMode="single"
        selectedKeys={selectedKeys}
        onSelectionChange={setSelectedKeys}
        hideSelectedIcon
      >
        {pages.map(({ href, name }) => {
          const active = href.split('/')[2] === pathname.split('/')[2];
          return (
            <ListboxItem
              key={href}
              href={href}
              classNames={{
                base: active ? 'text-default-foreground bg-default' : '',
              }}
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

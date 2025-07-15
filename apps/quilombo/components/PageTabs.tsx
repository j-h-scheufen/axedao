'use client';

import { Tabs } from '@heroui/react';
import { usePathname, useRouter, useSearchParams } from 'next/navigation';
import type { PropsWithChildren, ReactElement } from 'react';

const PageTabs = ({ children }: PropsWithChildren): ReactElement => {
  const searchParams = useSearchParams();
  const router = useRouter();
  const pathname = usePathname();
  const tabFromUrl = searchParams.get('tab');

  const handleSelectionChange = (key: React.Key) => {
    const params = new URLSearchParams(searchParams);
    params.set('tab', key.toString());
    router.push(`${pathname}?${params.toString()}`);
  };

  return (
    <Tabs
      selectedKey={tabFromUrl || undefined}
      onSelectionChange={handleSelectionChange}
      color="primary"
      size="lg"
      fullWidth
      variant="bordered"
      classNames={{
        tabList: 'mx-auto max-w-lg',
        panel: 'px-0',
      }}
    >
      {children}
    </Tabs>
  );
};

export default PageTabs;

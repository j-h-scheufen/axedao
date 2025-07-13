'use client';

import { useState, type PropsWithChildren, type ReactElement } from 'react';
import { Tabs } from '@heroui/react';
import { useSearchParams } from 'next/navigation';

const PageTabs = ({ children }: PropsWithChildren): ReactElement => {
  const searchParams = useSearchParams();
  const tabFromUrl = searchParams.get('tab');
  const [selectedKey, setSelectedKey] = useState<string | undefined>(tabFromUrl || undefined);

  return (
    <Tabs
      selectedKey={selectedKey}
      onSelectionChange={(key) => setSelectedKey(key.toString())}
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

'use client';

import { useState, type PropsWithChildren, type ReactElement } from 'react';
import { Tabs } from '@heroui/react';

const PageTabs = ({ children }: PropsWithChildren): ReactElement => {
  const [selectedKey, setSelectedKey] = useState<string | undefined>(undefined);
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
      }}
    >
      {children}
    </Tabs>
  );
};

export default PageTabs;

'use client';

import { Tabs } from '@heroui/react';
import { parseAsString, useQueryStates } from 'nuqs';
import type { PropsWithChildren, ReactElement } from 'react';

const PageTabs = ({ children }: PropsWithChildren): ReactElement => {
  const [{ tab }, setQueryStates] = useQueryStates({
    tab: parseAsString,
  });

  const handleSelectionChange = (key: React.Key) => {
    setQueryStates({ tab: key.toString() });
  };

  return (
    <Tabs
      selectedKey={tab || undefined}
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

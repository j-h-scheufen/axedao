'use client';

import { Tabs } from '@heroui/react';
import { parseAsString, useQueryStates } from 'nuqs';
import type { PropsWithChildren, ReactElement } from 'react';

type PageTabsProps = PropsWithChildren & {
  defaultTab?: string;
};

const PageTabs = ({ children, defaultTab = '' }: PageTabsProps): ReactElement => {
  const [{ tab }, setQueryStates] = useQueryStates({
    tab: parseAsString.withDefault(defaultTab),
  });

  const handleSelectionChange = (key: React.Key) => {
    setQueryStates({ tab: key.toString() });
  };

  return (
    <Tabs
      selectedKey={tab}
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

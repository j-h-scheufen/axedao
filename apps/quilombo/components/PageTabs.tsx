'use client';

import { Tabs } from '@heroui/react';
import { parseAsString, useQueryStates } from 'nuqs';
import type { PropsWithChildren, ReactElement } from 'react';
import { useSearchParams } from 'next/navigation';

type PageTabsProps = PropsWithChildren & {
  defaultTab?: string;
};

// Define which URL params belong to which tab
const TAB_PARAMS = {
  users: ['uq', 'titles'],
  groups: ['view', 'gq', 'countries', 'styles', 'verified'],
  events: ['view', 'eq', 'countries', 'eventTypes', 'pastEvents'],
} as const;

const PageTabs = ({ children, defaultTab = '' }: PageTabsProps): ReactElement => {
  const searchParams = useSearchParams();
  const [{ tab }, setQueryStates] = useQueryStates({
    tab: parseAsString.withDefault(defaultTab),
  });

  const handleSelectionChange = (key: React.Key) => {
    const newTab = key.toString() as keyof typeof TAB_PARAMS;

    // Get all current params
    const currentParams = Object.fromEntries(searchParams.entries());

    // Build new params object with only 'tab' and params that don't belong to any tab
    const newParams: Record<string, string | null> = { tab: newTab };

    // Clear all tab-specific params by setting them to null
    Object.values(TAB_PARAMS)
      .flat()
      .forEach((param) => {
        if (currentParams[param]) {
          newParams[param] = null;
        }
      });

    setQueryStates(newParams);
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

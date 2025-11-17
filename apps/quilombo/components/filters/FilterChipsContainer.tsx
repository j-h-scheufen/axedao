'use client';

import type { ReactNode } from 'react';

type FilterChipsContainerProps = {
  children: ReactNode;
};

/**
 * Container for filter chips. Only renders if there are children.
 * Displays chips in a horizontal flex row with gap.
 */
const FilterChipsContainer = ({ children }: FilterChipsContainerProps) => {
  // Check if children exist (filter out null/undefined)
  const hasChildren = Boolean(children);

  if (!hasChildren) return null;

  return <div className="flex flex-wrap gap-2">{children}</div>;
};

export default FilterChipsContainer;

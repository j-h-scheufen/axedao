import type { PropsWithChildren } from 'react';

/**
 * Genealogy layout - full-width container for the 3D visualization.
 * Overrides the root layout's max-w-3xl constraint.
 */
export default function GenealogyLayout({ children }: PropsWithChildren) {
  return <div className="fixed inset-0 top-16 z-0">{children}</div>;
}

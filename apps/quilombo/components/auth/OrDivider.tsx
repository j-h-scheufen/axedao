import { Divider } from '@heroui/react';

/**
 * A styled divider with "OR" text centered, commonly used between
 * alternative authentication options (e.g., email/password vs OAuth).
 */
const OrDivider = () => (
  <div className="relative my-4">
    <Divider />
    <span className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 bg-background px-2 text-sm text-default-400">
      OR
    </span>
  </div>
);

export default OrDivider;

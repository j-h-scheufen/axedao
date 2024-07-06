import { cn } from '@/utils/tailwind';
import { ReactNode } from 'react';

type Props = { children: ReactNode; color?: string };
const Tag = ({ children, color = 'primary' }: Props) => {
  return (
    <div
      className={cn(
        `relative max-w-fit min-w-min inline-flex px-2 items-center justify-between box-border whitespace-nowrap h-6 rounded-full bg-${color}/20 text-${color} ml-1 py-1 text-tiny`,
      )}
    >
      {children}
    </div>
  );
};
export default Tag;

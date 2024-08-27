import { Button } from '@nextui-org/react';
import { ReactNode } from 'react';

type Props = { children: ReactNode; color?: 'primary' | 'default' | 'secondary' | 'success' | 'warning' | 'danger' };
const Tag = ({ children, color = 'primary' }: Props) => {
  return (
    <Button size="sm" variant="flat" color={color} className="rounded-full h-7 cursor-default text-sm">
      <span className={`bg-${color} inline-block h-2 w-2 rounded-full`}></span>
      {children}
    </Button>
  );
};
export default Tag;

import { ReactNode } from 'react';
import DashboardBreadcrumb from '@/components/DashboardBreadcrumb';

type Props = { children: ReactNode };
const layout = ({ children }: Props) => {
  return (
    <>
      <DashboardBreadcrumb />
      {children}
    </>
  );
};
export default layout;

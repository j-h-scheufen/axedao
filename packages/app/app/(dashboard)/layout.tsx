import { PropsWithChildren } from 'react';

const DashboardLayout = ({ children }: PropsWithChildren) => {
  return <main className="container flex-grow w-full">{children}</main>;
};
export default DashboardLayout;

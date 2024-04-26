import { ReactNode } from 'react';
import Sidebar from '@/components/Sidebar';

type Props = { children: ReactNode };
const layout = ({ children }: Props) => {
  return (
    <>
      <Sidebar />
      <div className="flex h-full flex-col md:pl-64">
        <main className="container mx-auto max-w-7xl flex-grow px-6">{children}</main>
      </div>
    </>
  );
};
export default layout;

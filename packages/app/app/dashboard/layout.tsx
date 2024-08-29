'use client';

import BottomBar from '@/components/BottomBar';
import Sidebar from '@/components/Sidebar';
import { ReactNode } from 'react';

type Props = { children: ReactNode };
const DashboardLayout = ({ children }: Props) => {
  return (
    <>
      <Sidebar />
      <BottomBar />
      <div className="flex h-full flex-col md:pl-56">
        <main className="container mx-auto max-w-7xl flex-grow px-6">{children}</main>
      </div>
    </>
  );
};
export default DashboardLayout;

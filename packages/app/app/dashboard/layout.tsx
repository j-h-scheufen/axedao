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
      <main className="container mx-auto max-w-5xl flex-grow px-2 sm:px-4">{children}</main>
    </>
  );
};
export default DashboardLayout;

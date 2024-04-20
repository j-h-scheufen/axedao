import { Spinner } from '@nextui-org/react';

import Navbar from '@/components/Navbar';
import { PageLayout } from '@/components/primitives';
import { Suspense } from 'react';

export default function MainLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="relative flex h-screen flex-col">
      <Navbar />
      <main className="container mx-auto max-w-6xl flex-grow px-2 sm:px-3">
        <Suspense fallback={<Spinner size="lg" />}>
          <PageLayout>{children}</PageLayout>
        </Suspense>
      </main>
      <footer className="flex w-full items-center justify-center py-2 sm:py-3">
        <span className="text-default-600">Powered by </span>
        <span className="text-primary">AXÉ DAO</span>
      </footer>
    </div>
  );
}

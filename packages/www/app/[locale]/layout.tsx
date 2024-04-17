import Navbar from '@/components/Navbar';
import { PageLayout } from '@/components/primitives';

export default function MainLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="relative flex h-screen flex-col">
      <Navbar />
      <main className="container mx-auto max-w-6xl flex-grow px-2 sm:px-3">
        <PageLayout>{children}</PageLayout>
      </main>
      <footer className="flex w-full items-center justify-center py-2 sm:py-3">
        <span className="text-default-600">Powered by </span>
        <span className="text-primary">AXÉ DAO</span>
      </footer>
    </div>
  );
}

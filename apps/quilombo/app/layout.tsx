import clsx from 'clsx';
import type { PropsWithChildren } from 'react';

import Navbar from '@/components/Navbar';
import { fontFiraCode, fontInter, fontOpenSans } from '@/config/fonts';
import BreadcrumbTracker from '@/components/BreadcrumbTracker';
import '@/styles/globals.css';
import Providers from './_providers';
import { sharedMetadata, viewport } from '@/config/metadata';
import type { SearchParams } from '@/types/routes';

export const metadata = sharedMetadata;
export { viewport };

// NEXTJS provides these params to pages (layouts do NOT receive searchParams!), but no official interface exists, yet.
// https://github.com/vercel/next.js/discussions/46131
export type NextPageProps<T = Record<string, string>> = {
  params: Promise<T>;
  searchParams?: Promise<SearchParams>;
};

export default async function RootLayout({ children }: PropsWithChildren) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head />
      <body
        className={clsx(
          'min-h-screen bg-background font-sans antialiased',
          fontInter.variable,
          fontFiraCode.variable,
          fontOpenSans.variable
        )}
      >
        <Providers>
          <BreadcrumbTracker />
          <div className="relative flex min-h-screen flex-col">
            <Navbar />
            <main className="container mx-auto max-w-3xl flex-grow mb-[60px]">{children}</main>
          </div>
        </Providers>
      </body>
    </html>
  );
}

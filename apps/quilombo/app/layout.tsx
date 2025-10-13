import clsx from 'clsx';
import type { PropsWithChildren } from 'react';
import type { Metadata } from 'next';

import Navbar from '@/components/Navbar';
import { fontFiraCode, fontInter, fontOpenSans } from '@/config/fonts';
import BreadcrumbTracker from '@/components/BreadcrumbTracker';
import Providers from './_providers';
import { sharedMetadata, viewport } from '@/config/metadata';
import type { SearchParams } from '@/types/routes';

import '@/app/globals.css';

export const metadata: Metadata = sharedMetadata;
export { viewport };

// NEXTJS provides these params to pages (layouts do NOT receive searchParams!), but no official interface exists, yet.
// https://github.com/vercel/next.js/discussions/46131
export type NextPageProps<T = Record<string, string>> = {
  params: Promise<T>;
  searchParams?: Promise<SearchParams>;
};

export default async function RootLayout({ children }: PropsWithChildren) {
  return (
    <html
      lang="en"
      suppressHydrationWarning
      className={clsx(
        'dark', // This sets the initial theme to match HeroUI defaultTheme: 'dark'
        fontInter.variable,
        fontFiraCode.variable,
        fontOpenSans.variable
      )}
    >
      <head />
      <body className="min-h-screen font-sans antialiased">
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

import type { Metadata, Viewport } from 'next';
import { Analytics } from '@vercel/analytics/react';
import { dir } from 'i18next';
import clsx from 'clsx';

import { siteConfig } from '@/config/site';
import { fontInter, fontFiraCode, fontOpenSans } from '@/config/fonts';
import { Providers } from '../providers';
import { ALL_LOCALES, fallbackLng, isSupportedLanguage } from '../i18n/settings';
import Navbar from '@/components/Navbar';

import '@/app/globals.css';

// NEXTJS provides these params to pages (layouts do NOT receive searchParams!), but no official interface exists, yet.
// https://github.com/vercel/next.js/discussions/46131
export type NextPageProps<ParamType = string> = {
  params: Promise<{ locale: ParamType }>;
  searchParams?: Promise<{ [key: string]: string | string[] | undefined }>;
};

export const metadata: Metadata = {
  title: {
    default: siteConfig.name,
    template: `%s - ${siteConfig.name}`,
  },
  description: siteConfig.description,
  icons: {
    icon: '/favicon.ico',
    shortcut: '/favicon-16x16.png',
    apple: '/apple-touch-icon.png',
  },
};

export const viewport: Viewport = {
  themeColor: [
    { media: '(prefers-color-scheme: light)', color: 'white' },
    { media: '(prefers-color-scheme: dark)', color: 'black' },
  ],
};

export async function generateStaticParams() {
  return ALL_LOCALES.map((lng) => ({ lng }));
}

export default async function RootLayout({
  params,
  children,
}: {
  children: React.ReactNode;
  params: Promise<{
    locale: string;
  }>;
}) {
  const { locale } = await params;
  const lang = isSupportedLanguage(locale) ? locale : fallbackLng;
  return (
    <html
      lang={lang}
      dir={dir(lang)}
      suppressHydrationWarning
      className={clsx('light', fontInter.variable, fontFiraCode.variable, fontOpenSans.variable)}
    >
      <head />
      <body className="min-h-screen font-sans antialiased">
        <Providers
          themeProps={{
            attribute: 'class',
            defaultTheme: 'light',
            children: null,
          }}
        >
          <div className="relative flex h-screen flex-col">
            <Navbar />
            <main className="container mx-auto mb-[40px] max-w-6xl flex-grow">
              <div className="flex flex-col items-center justify-center">{children}</div>
            </main>
          </div>
        </Providers>
        <Analytics />
      </body>
    </html>
  );
}

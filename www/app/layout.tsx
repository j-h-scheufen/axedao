import { Metadata, Viewport } from 'next';
import { Analytics } from '@vercel/analytics/react';
import clsx from 'clsx';

import '@/styles/globals.css';
import { siteConfig } from '@/config/site';
import { fontSans } from '@/config/fonts';
import { Providers } from './providers';

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

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head />
      <body
        className={clsx(
          'min-h-screen bg-background font-sans antialiased',
          fontSans.variable
        )}
      >
        <Providers
          themeProps={{
            attribute: 'class',
            defaultTheme: 'dark',
          }}
        >
          <div className="relative flex h-screen flex-col">
            <main className="container mx-auto max-w-7xl flex-grow light">
              {children}
            </main>
            <footer className="flex w-full items-center justify-center py-3">
              <span className="text-default-600">Powered by </span>
              <p className="text-primary">Axé DAO</p>
            </footer>
          </div>
        </Providers>
        <Analytics />
      </body>
    </html>
  );
}

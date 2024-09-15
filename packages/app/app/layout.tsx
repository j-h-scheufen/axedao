import clsx from 'clsx';
import { Metadata, Viewport } from 'next';
import { getServerSession } from 'next-auth';

import Navbar from '@/components/Navbar';
import SessionProvider from '@/components/SessionProvider';
import { fontFiraCode, fontInter, fontOpenSans } from '@/config/fonts';
import { nextAuthOptions } from '@/config/next-auth-options';
import { siteConfig } from '@/config/site';
import ThemeProvider from './_providers/nextUI.provider';
import Web3Provider from './_providers/silk.provider';
import SnackbarProvider from './_providers/snackbar.provider';

import ClientInitializer from '@/components/ClientInitializer';
import '@/styles/globals.css';

export const metadata: Metadata = {
  title: {
    default: siteConfig.name,
    template: `%s - ${siteConfig.name}`,
  },
  description: siteConfig.description,
  icons: {
    icon: '/favicon.ico',
    shortcut: '/favicon.ico',
    apple: '/apple-touch-icon.png',
  },
};

export const viewport: Viewport = {
  themeColor: [
    { media: '(prefers-color-scheme: light)', color: 'white' },
    { media: '(prefers-color-scheme: dark)', color: 'black' },
  ],
};

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const session = await getServerSession(nextAuthOptions);
  return (
    <html lang="en" suppressHydrationWarning>
      <head />
      <body
        className={clsx(
          'min-h-screen bg-background font-sans antialiased',
          fontInter.variable,
          fontFiraCode.variable,
          fontOpenSans.variable,
        )}
      >
        <SessionProvider session={session}>
          <ThemeProvider themeProps={{ attribute: 'class', defaultTheme: 'dark', children: null }}>
            <SnackbarProvider>
              <Web3Provider>
                <ClientInitializer />
                <div className="relative flex min-h-screen flex-col">
                  <Navbar />
                  <main className="container mx-auto max-w-3xl flex-grow">{children}</main>
                </div>
              </Web3Provider>
            </SnackbarProvider>
          </ThemeProvider>
        </SessionProvider>
      </body>
    </html>
  );
}

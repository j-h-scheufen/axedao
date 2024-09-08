import clsx from 'clsx';
import { Metadata, Viewport } from 'next';
import { getServerSession } from 'next-auth';

import ClientInitializer from '@/components/ClientInitializer';
import Navbar from '@/components/Navbar';
import SessionProvider from '@/components/SessionProvider';
import { fontFiraCode, fontInter, fontOpenSans } from '@/config/fonts';
import { nextAuthOptions } from '@/config/next-auth-options';
import { siteConfig } from '@/config/site';
import ThemeProvider from './_providers/nextUI.provider';
import Web3Provider from './_providers/silk.provider';
import SnackbarProvider from './_providers/snackbar.provider';

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
                  {children}
                  <footer className="mt-auto flex w-full items-center justify-center gap-1 pb-20 md:pb-10 py-10">
                    <span className="text-default-600">Powered by </span>
                    <span className="text-primary">AXÉ DAO</span>
                  </footer>
                </div>
              </Web3Provider>
            </SnackbarProvider>
          </ThemeProvider>
        </SessionProvider>
      </body>
    </html>
  );
}

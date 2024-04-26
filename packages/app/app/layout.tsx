import { Metadata, Viewport } from 'next';
import clsx from 'clsx';

import '@/styles/globals.css';
import { siteConfig } from '@/config/site';
import { fontSans } from '@/config/fonts';
import { Provider as ThemeProvider } from './_providers/nextUI.provider';
import { Provider as Web3Provider } from './_providers/web3.provider';
import { Provider as SnackbarProvider } from './_providers/snackbar.provider';
import Navbar from '@/components/Navbar';

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

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head />
      <body className={clsx('min-h-screen bg-background font-sans antialiased', fontSans.variable)}>
        <ThemeProvider themeProps={{ attribute: 'class', defaultTheme: 'dark' }}>
          <SnackbarProvider>
            <Web3Provider>
              <div className="relative flex min-h-screen flex-col">
                <Navbar />
                {children}
                <footer className="mt-auto flex w-full items-center justify-center gap-1 py-10">
                  <span className="text-default-600">Powered by </span>
                  <span className="text-primary">AXÉ DAO</span>
                </footer>
              </div>
            </Web3Provider>
          </SnackbarProvider>
        </ThemeProvider>
      </body>
    </html>
  );
}

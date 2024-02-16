import { Metadata, Viewport } from 'next';
import clsx from 'clsx';

import '@/styles/globals.css';
import { siteConfig } from '@/config/site';
import { fontSans } from '@/config/fonts';
import { Provider as ThemeProvider } from './_providers/nextUI.provider';
import { Provider as Web3Provider } from './_providers/web3.provider';
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
          <Web3Provider>
            <div className="relative flex h-screen flex-col">
              <Navbar />
              <main className="container mx-auto max-w-7xl flex-grow px-6 pt-16">{children}</main>
              <footer className="flex w-full items-center justify-center py-3">
                <span className="text-default-600">Powered by</span>
                <p className="text-primary">AXÉ DAO</p>
              </footer>
            </div>
          </Web3Provider>
        </ThemeProvider>
      </body>
    </html>
  );
}

import { Metadata, Viewport } from 'next';
import { PropsWithChildren } from 'react';
import { Analytics } from '@vercel/analytics/react';
import { dir } from 'i18next';
import clsx from 'clsx';

import '@/styles/globals.css';
import { siteConfig } from '@/config/site';
import { fontSans } from '@/config/fonts';
import { Providers } from './providers';
import { fallbackLng, isSupportedLanguage } from './i18n/settings';

// NEXTJS provides these params as page props to server components, but no official interface exists, yet.
// https://github.com/vercel/next.js/discussions/46131
export interface NextPageProps<ParamType = string> {
  params: { locale: ParamType };
  searchParams?: { [key: string]: string | string[] | undefined };
}

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

export type I18nProps = PropsWithChildren & {
  lang: string;
};

export default function RootLayout({ children, lang }: I18nProps) {
  const locale = isSupportedLanguage(lang) ? lang : fallbackLng;
  return (
    <html lang={locale} dir={dir(locale)} suppressHydrationWarning>
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
            defaultTheme: 'light',
          }}
        >
          {children}
        </Providers>
        <Analytics />
      </body>
    </html>
  );
}

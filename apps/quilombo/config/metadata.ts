import type { Metadata, Viewport } from 'next';

import { siteConfig } from '@/config/site';

export const sharedMetadata: Metadata = {
  title: {
    default: siteConfig.name,
    template: `%s - ${siteConfig.name}`,
  },
  description: siteConfig.description,
  applicationName: siteConfig.name,
  authors: [{ name: 'Axé DAO Team' }],
  keywords: ['capoeira', 'dao'],
  creator: 'Axé DAO Team',
  publisher: 'Axé DAO',
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },

  icons: {
    icon: '/quilombo-icon-192x192.png',
    shortcut: '/favicon.ico',
    apple: '/quilombo-icon-apple-touch.png',
    other: [
      {
        rel: 'icon',
        type: 'image/png',
        sizes: '32x32',
        url: '/quilombo-icon-32x32.png',
      },
      {
        rel: 'icon',
        type: 'image/png',
        sizes: '16x16',
        url: '/quilombo-icon-16x16.png',
      },
    ],
  },
};

export const viewport: Viewport = {
  themeColor: [
    { media: '(prefers-color-scheme: light)', color: 'white' },
    { media: '(prefers-color-scheme: dark)', color: 'black' },
  ],
  width: 'device-width',
  initialScale: 1,
  maximumScale: 1,
};

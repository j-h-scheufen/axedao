/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**',
        port: '',
        pathname: '/**',
      },
    ],
  },
  i18n: {
    locales: ['en', 'pt', 'de'],
    defaultLocale: 'en',
  },
};

module.exports = nextConfig;

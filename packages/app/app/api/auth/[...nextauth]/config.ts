import { AuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { SiweMessage } from 'siwe';

import ENV from '@/config/environment';
import { fetchSessionData } from '@/db';

const providers = [
  CredentialsProvider({
    name: 'Ethereum',
    credentials: {
      message: {
        label: 'Message',
        type: 'text',
        placeholder: '0x0',
      },
      signature: {
        label: 'Signature',
        type: 'text',
        placeholder: '0x0',
      },
      nonce: {
        label: 'Nonce',
        type: 'text',
        placeholder: '',
      },
    },
    async authorize(credentials) {
      try {
        const siwe = new SiweMessage(JSON.parse(credentials?.message || '{}'));

        const nonce = credentials?.nonce;
        const result = await siwe.verify({
          signature: credentials?.signature || '',
          domain: getNextAuthHost(),
          // nonce: await getCsrfToken({ req: { headers: req as NextRequest & NextApiRequest } }),
          nonce,
        });
        const address = siwe.address;

        if (result.success) {
          const user = await fetchSessionData(address);
          if (user) return user;
        }
        return null;
      } catch (e) {
        console.error(e);
        return null;
      }
    },
  }),
];

export const nextAuthOptions: AuthOptions = {
  // https://next-auth.js.org/configuration/providers/oauth
  providers,
  session: {
    strategy: 'jwt',
  },
  secret: ENV.nextAuthSecret,
  callbacks: {
    async jwt({ token, user }) {
      // Initial sign in persists the user in the token
      if (user) return { ...token, user };
      return token;
    },
  },
};

const getNextAuthHost = (): string => {
  if (process.env.NEXTAUTH_URL) {
    console.log('Using NEXTAUTH_URL:', process.env.NEXTAUTH_URL);
    return new URL(process.env.NEXTAUTH_URL).host;
  } else if (process.env.VERCEL_URL) {
    console.log('Using VERCEL_URL:', process.env.VERCEL_URL);
    return process.env.VERCEL_URL;
  } else {
    console.log('No AuthHost found, using localhost');
    return 'localhost';
  }
};

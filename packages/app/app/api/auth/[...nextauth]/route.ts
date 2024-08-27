import NextAuth from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { NextRequest } from 'next/server';
import { SiweMessage } from 'siwe';

import ENV from '@/config/environment';
import { fetchSessionData } from '@/db';

interface RouteHandlerContext {
  params: { nextauth: string[] };
}

// For more information on each option (and a full list of options) go to
// https://next-auth.js.org/configuration/options
const handler = async (req: NextRequest, context: RouteHandlerContext) => {
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

  // const isDefaultSigninPage = req.method === 'GET' && req.url?.includes('auth');

  // // Hide Sign-In with Ethereum from default sign page
  // if (isDefaultSigninPage) {
  //   providers.pop();
  // }

  return await NextAuth(req, context, {
    // https://next-auth.js.org/configuration/providers/oauth
    providers,
    session: {
      strategy: 'jwt',
    },
    secret: ENV.nextAuthSecret,
    callbacks: {
      async jwt(args) {
        const { token, user } = args;
        return { ...token, user };
      },
      // async session({ session, token }: { session: Session; token: JWT }) {
      //   const address = token.sub;
      //   return session;
      // },
    },
  });
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

export { handler as GET, handler as POST };

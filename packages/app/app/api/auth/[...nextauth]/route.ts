import { fetchSessionData } from '@/db';
import { NextApiRequest } from 'next';
import NextAuth from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { getCsrfToken } from 'next-auth/react';
import { NextRequest } from 'next/server';
import { SiweMessage } from 'siwe';

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
      },
      async authorize(credentials) {
        try {
          const siwe = new SiweMessage(JSON.parse(credentials?.message || '{}'));
          const nextAuthUrl = new URL(process.env.NEXTAUTH_URL!);

          const result = await siwe.verify({
            signature: credentials?.signature || '',
            domain: nextAuthUrl.host,
            nonce: await getCsrfToken({ req: req as NextRequest & NextApiRequest }),
          });
          const address = siwe.address;

          if (result.success) {
            const user = await fetchSessionData(address);
            if (user) return user;
          }
          return null;
        } catch (e) {
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
    secret: process.env.NEXTAUTH_SECRET,
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

export { handler as GET, handler as POST };

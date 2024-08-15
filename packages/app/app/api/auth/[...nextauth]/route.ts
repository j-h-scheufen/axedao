import { fetchSessionData } from '@/db';
import { NextApiRequest, NextApiResponse } from 'next';
import NextAuth from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { getCsrfToken } from 'next-auth/react';
import { SiweMessage } from 'siwe';

// For more information on each option (and a full list of options) go to
// https://next-auth.js.org/configuration/options
const handler = async (req: NextApiRequest, res: NextApiResponse) => {
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
            nonce: await getCsrfToken({ req }),
          });
          const address = siwe.address;

          if (result.success) {
            const user = await fetchSessionData(address);
            if (user) {
              const { name, email, avatar } = user;
              return {
                id: siwe.address,
                name,
                email,
                image: avatar,
              };
            }
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

  return await NextAuth(req, res, {
    // https://next-auth.js.org/configuration/providers/oauth
    providers,
    session: {
      strategy: 'jwt',
    },
    secret: process.env.NEXTAUTH_SECRET,
    // callbacks: {
    // async jwt(args) {
    //   console.log('jwt args: ', args);
    //   const { token, account, profile } = args;
    //   return token;
    // },
    // async session({ session, token }: { session: Session; token: JWT }) {
    //   const address = token.sub;
    //   return session;
    // },
    // },
  });
};

export { handler as GET, handler as POST };

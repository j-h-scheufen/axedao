import { AuthOptions, RequestInternal } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { cookies } from 'next/headers';
import { SiweMessage } from 'siwe';

import ENV from '@/config/environment';
import { PATHS } from '@/constants';
import { fetchSessionData } from '@/db';

const nextAuthUrl = process.env.NEXTAUTH_URL || (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : null);

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

    // Note: 'req' is not used atm, but that's where the nonce should come from
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    async authorize(credentials, req: RequestInternal['headers']) {
      try {
        const siwe = new SiweMessage(JSON.parse(credentials?.message || '{}'));

        if (!nextAuthUrl) {
          return null;
        }

        const nextAuthHost = new URL(nextAuthUrl).host;
        // nonce: await getCsrfToken({ req: { headers: req as NextRequest & NextApiRequest } }),
        // NOTE: This is a workaround to get the nonce directly from the cookie
        // See: https://stackoverflow.com/questions/77074980/next-js-13-nextauth-sign-in-with-ethereum-csrf-token-mismatch-between-clien
        const nonce = cookies().get('next-auth.csrf-token')?.value.split('|')[0];
        const verificationParams = { signature: credentials?.signature || '', domain: nextAuthHost, nonce };
        const result = await siwe.verify(verificationParams);

        console.log('REQ: ', req);
        console.log('NONCE: ', nonce);

        if (result.success) {
          const user = await fetchSessionData(siwe.address);
          if (user)
            return {
              id: user.id,
              walletAddress: siwe.address,
              email: user.email,
            };
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
  providers,
  pages: { signIn: PATHS.login },
  session: {
    strategy: 'jwt',
  },
  secret: ENV.nextAuthSecret,
  callbacks: {
    async jwt({ token, user }) {
      console.log('JWT: ', token, user);
      // Initial sign in persists the user object in the token
      if (user) return { ...token, user };
      return token;
    },
    async session({ session, token }) {
      // Send properties to the client
      if (token.user) {
        session.user = { ...session.user, ...token.user };
      }
      return session;
    },
  },
};

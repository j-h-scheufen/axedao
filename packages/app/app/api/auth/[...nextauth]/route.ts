import NextAuth, { AuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { /* fetchUserProfileByEmail, */ fetchUsers } from '@/db';
// import { compare } from 'bcrypt';

export const authOptions: AuthOptions = {
  // Configure one or more authentication providers
  providers: [
    CredentialsProvider({
      name: 'Credentials',
      credentials: {
        email: { label: 'Email', type: 'text' },
        walletAddress: { label: 'Wallet address', type: 'walletAddress' },
      },
      async authorize(/* credentials, req */) {
        // console.log('Credentials: ', credentials);
        // const { email, walletAddress } = credentials || {};
        // if (!email || !walletAddress) return null
        // // TODO validate credentials

        // const user = await fetchUserProfileByEmail(email);
        // if (!user) return null

        // const walletAddressMatches = user.walletAddress === walletAddress;
        // if (walletAddressMatches) return user;

        // mock
        const users = await fetchUsers();
        const user = users[0];
        return user;
        // return null;
      },
    }),
  ],
  // callbacks: {
  //   async signIn() {
  //     return true;
  //   },
  // },
  pages: {
    signIn: '/auth?tab=sign-in',
  },
};

export const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };

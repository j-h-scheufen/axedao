import { fetchUserProfileByEmail } from '@/db';
import { AuthOptions } from 'next-auth';
import CredentialsProvider from 'next-auth/providers/credentials';
import { string } from 'yup';

const emailSchema = string().email().required();

export const authOptions: AuthOptions = {
  // Configure one or more authentication providers
  providers: [
    CredentialsProvider({
      name: 'Credentials',
      credentials: {
        email: { label: 'Email', type: 'email' },
        walletAddress: { label: 'Wallet address', type: 'walletAddress' },
      },
      async authorize(credentials) {
        const { email, walletAddress } = credentials || {};

        if (email && emailSchema.validateSync(email) && walletAddress) {
          const user = await fetchUserProfileByEmail(email);
          if (user) {
            // const walletAddressMatches = await compare(walletAddress, user.wallet_address);
            // if (walletAddressMatches) return user;
            return user;
          }
        }

        return null;
      },
    }),
  ],
};

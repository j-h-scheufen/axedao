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
      },
      async authorize(credentials) {
        const { email } = credentials || {};
        if (email && emailSchema.validateSync(email)) {
          const user = await fetchUserProfileByEmail(email);
          if (user) {
            return user;
          }
        }

        return null;
      },
    }),
  ],
};

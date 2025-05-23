import { getServerSession } from 'next-auth';
import { SessionProvider as NextAuthSessionProvider } from 'next-auth/react';

import { nextAuthOptions } from '@/config/next-auth-options';

const SessionProvider = async ({ children }: { children: React.ReactNode }) => {
  const session = await getServerSession(nextAuthOptions);

  return <NextAuthSessionProvider session={session}>{children}</NextAuthSessionProvider>;
};

export default SessionProvider;

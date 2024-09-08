import { DefaultSession } from 'next-auth';

import { UserSession } from './model';

declare module 'next-auth' {
  /**
   * Returned by `useSession`, `getSession` and received as a prop on the `SessionProvider` React Context
   */
  interface Session {
    user: UserSession & DefaultSession['user'];
  }

  /**
   * Returned by the `jwt` callback and `getToken`, when using JWT sessions
   * */
  //   interface JWT {
  //     user: UserSession;
  //   }
}

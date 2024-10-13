import { DefaultSession } from 'next-auth';

import { UserSession } from './model';

/**
 * Extends core next-auth types with custom attributes.
 * See: https://next-auth.js.org/getting-started/typescript#module-augmentation
 */
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

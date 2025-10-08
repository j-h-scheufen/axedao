import { getToken, type JWT } from 'next-auth/jwt';
import { withAuth } from 'next-auth/middleware';

import { type NextRequest, NextResponse } from 'next/server';
import { PATHS } from './config/constants';
import type { UserSession } from './types/model';

const adminPathRegex = /^\/admin(\/|$)/;

export default withAuth(
  async function middleware(request: NextRequest) {
    const token = (await getToken({ req: request })) as (JWT & { user: UserSession }) | null;
    const pathname = request.nextUrl.pathname;

    // Protect admin pages and API (directories named /admin/)
    if (adminPathRegex.test(pathname)) {
      // TODO: this should strictly be a DB fetch to avoid stale session data.
      // However, accessing the DB directly from here causes build problems (webpack) due to the middleware being
      // deployed on Edge infrastructure and some DB dependencies don't support that, yet.
      // See: https://github.com/vercel/next.js/discussions/50177
      if (!token?.user.isGlobalAdmin) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 403 });
      }
    }

    return NextResponse.next();
  },
  {
    callbacks: {
      authorized({ token }) {
        return !!token;
      },
    },
    pages: {
      signIn: PATHS.login,
    },
  }
);

export const config = {
  // Do not run the middleware on static assets and auth pages, but everything else
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos|auth).+)',
};

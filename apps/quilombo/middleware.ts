import { getToken, JWT } from 'next-auth/jwt';
import { withAuth } from 'next-auth/middleware';

import { NextRequest, NextResponse } from 'next/server';
import { PATHS } from './config/constants';
import { UserSession } from './types/model';

export default withAuth(
  async function middleware(request: NextRequest) {
    const token = (await getToken({ req: request })) as (JWT & { user: UserSession }) | null;

    // The 'authorized' callback should prevent this, but just in case
    if (!token) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const pathname = request.nextUrl.pathname;

    // Protect admin pages and API (directories named /admin/)
    const adminPathRegex = /\/admin\//;
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
        return token ? true : false;
      },
    },
    pages: {
      signIn: PATHS.login,
    },
  },
);

export const config = {
  // Do not run the middleware on static assets and auth pages, but everything else
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos|auth).*)',
};

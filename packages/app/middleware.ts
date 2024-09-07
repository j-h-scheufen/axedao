import { getToken, JWT } from 'next-auth/jwt';
import { withAuth } from 'next-auth/middleware';

import { NextRequest, NextResponse } from 'next/server';
import { PATHS } from './constants';
import { UserSession } from './types/model';

export default withAuth(
  async function middleware(req: NextRequest) {
    const token = (await getToken({ req })) as (JWT & { user: UserSession }) | null;

    const pathname = req.nextUrl.pathname;

    // Protect super-admin pages
    if (pathname.startsWith('/api/super-admin') || pathname.startsWith('/dashboard/global-admin')) {
      // TODO: this should strictly be a DB fetch to avoid stale session data
      if (!token?.user.isGlobalAdmin) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
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
  // Do not run the middleware on the following paths
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos|auth).*)',
};

// http://localhost:3000/_next/static/chunks/app/error.js

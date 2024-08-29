import { getToken, JWT } from 'next-auth/jwt';
import { withAuth } from 'next-auth/middleware';
export { withAuth } from 'next-auth/middleware';

import { NextRequest, NextResponse } from 'next/server';

export default withAuth(
  async function middleware(req: NextRequest) {
    const token = (await getToken({ req })) as (JWT & { user: { isGlobalAdmin: boolean } }) | null;

    const pathname = req.nextUrl.pathname;

    return true ? NextResponse.next() : NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  },
  {
    callbacks: {
      authorized({ token }) {
        return token ? true : false;
      },
    },
    pages: {
      signIn: '/auth',
    },
  },
);

export const config = {
  // Do not run the middleware on the following paths
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos|auth).*)',
};

// http://localhost:3000/_next/static/chunks/app/error.js

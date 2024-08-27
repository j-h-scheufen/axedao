import { getToken, JWT } from 'next-auth/jwt';
import { NextRequest, NextResponse } from 'next/server';

export async function middleware(request: NextRequest) {
  const token = (await getToken({ req: request })) as (JWT & { user: { isGlobalAdmin: boolean } }) | null;
  const authenticated = !!token;

  const {
    method,
    nextUrl: { pathname },
  } = request;

  const isRead = method === 'GET';
  const isWrite = !isRead;

  let allowAccess = true;

  if (pathname.startsWith('/api') && !pathname.startsWith('/api/auth')) {
    if (pathname.startsWith('/api/profile') && isWrite) {
      // Allow only authenticated users to write to their profile
      allowAccess = authenticated;
    }
  }
  return allowAccess ? NextResponse.next() : NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
}

export const config = {
  // Do not run the middleware on the following paths
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos).*)',
};

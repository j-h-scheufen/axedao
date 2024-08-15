import { getToken } from 'next-auth/jwt';
import { NextRequest, NextResponse } from 'next/server';

export async function middleware(request: NextRequest) {
  const token = await getToken({ req: request });
  const authenticated = !!token;
  const isGlobalAdmin = false; // TODO

  const {
    method,
    nextUrl: { pathname },
  } = request;

  const isRead = method === 'GET';
  const isWrite = !isRead;

  let allowAccess = true;

  if (pathname.startsWith('/api') && !pathname.startsWith('/api/auth')) {
    if (pathname.startsWith('/api/global-admin')) {
      // Allow only global admins access to global-admin routes
      allowAccess = authenticated && isGlobalAdmin;
    } else if (pathname.startsWith('/api/profile') && isWrite) {
      // Allow only authenticated users to write to their profile
      allowAccess = authenticated;
    } else if (pathname.startsWith('/api/group/admin')) {
      // Allow only group admins to access group admin api routes
      const isGroupAdmin = false; // TODO
      allowAccess = authenticated && isGroupAdmin;
    }
  }
  return allowAccess ? NextResponse.next() : NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
}

export const config = {
  // Do not run the middleware on the following paths
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos).*)',
};

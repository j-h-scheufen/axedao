import { NextResponse, NextRequest } from 'next/server';

export function middleware(request: NextRequest) {
  const pathname = request.nextUrl.pathname;
  if (pathname.startsWith('api')) {
    // TODO check authenticated session
    // TODO protect api routes PUT/POST/DELETE to require global admin rights
  }
  return NextResponse.next();
}

export const config = {
  // Do not run the middleware on the following paths
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos).*)',
};

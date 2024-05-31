import { NextResponse, NextRequest } from 'next/server';
import { NextRequestWithAuth, withAuth } from 'next-auth/middleware';

export default withAuth(
  // `withAuth` augments your `Request` with the user's token.
  function middleware(request: NextRequestWithAuth) {
    const pathname = request.nextUrl.pathname || '';
    const token = request.nextauth.token;
    if (pathname.startsWith('/dashboard') && !token) {
      return Response.redirect(new URL('/auth?tab=sign-in', request.url));
    }
    if (pathname.startsWith('api')) {
      // TODO check authenticated session
      // TODO protect api routes PUT/POST/DELETE to require global admin rights
    }
    return NextResponse.next();
  },
  {
    callbacks: {
      authorized: ({ token }) => {
        return true;
      },
    },
  },
);

// export async function middleware(request: NextRequest) {
//   const pathname = request.nextUrl.pathname || '';
//   if (pathname.startsWith('api')) {
//     // TODO check authenticated session
//     // TODO protect api routes PUT/POST/DELETE to require global admin rights
//   }
//   return NextResponse.next();
// }

export const config = {
  // Do not run the middleware on the following paths
  matcher: '/((?!_next/static|_next/image|manifest.json|assets|favicon*|images|logos).*)',
};

import { getToken, type JWT } from 'next-auth/jwt';
import { withAuth } from 'next-auth/middleware';

import { type NextRequest, NextResponse } from 'next/server';
import { PATHS } from './config/constants';
import type { UserSession } from './types/model';

const adminPathRegex = /^\/admin(\/|$)/;

/**
 * Check if the app is in maintenance/shutdown mode.
 * Uses NEXT_PUBLIC_ prefix so it's available in Edge runtime.
 */
const isAppShutdown = () => process.env.NEXT_PUBLIC_APP_SHUTDOWN?.toLowerCase() === 'true';

/**
 * Paths that should still work during maintenance mode.
 */
const maintenanceAllowedPaths = [
  '/maintenance',
  '/_next',
  '/favicon',
  '/quilombo-icon',
  '/images',
  '/logos',
  '/assets',
];

/**
 * Check if a path should bypass maintenance mode.
 */
function isMaintenanceAllowedPath(pathname: string): boolean {
  return maintenanceAllowedPaths.some((path) => pathname.startsWith(path));
}

/**
 * Handle maintenance mode - redirect pages, return 503 for API.
 */
function handleMaintenanceMode(request: NextRequest): NextResponse | null {
  if (!isAppShutdown()) return null;

  const pathname = request.nextUrl.pathname;

  // Allow maintenance page and static assets
  if (isMaintenanceAllowedPath(pathname)) return null;

  // API routes get 503 Service Unavailable
  if (pathname.startsWith('/api/')) {
    return NextResponse.json({ error: 'Service temporarily unavailable for maintenance' }, { status: 503 });
  }

  // All other pages redirect to maintenance
  const maintenanceUrl = new URL('/maintenance', request.url);
  return NextResponse.redirect(maintenanceUrl);
}

export default withAuth(
  async function middleware(request: NextRequest) {
    // Check maintenance mode first - before any auth logic
    const maintenanceResponse = handleMaintenanceMode(request);
    if (maintenanceResponse) return maintenanceResponse;

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
      authorized({ token, req: _req }) {
        // During maintenance mode, allow all requests through to middleware
        // (middleware will handle the redirect)
        if (isAppShutdown()) return true;
        return !!token;
      },
    },
    pages: {
      signIn: PATHS.login,
    },
  }
);

export const config = {
  // Do not run the middleware on static assets, auth pages, and public API routes
  // Excludes: Next.js internals, static files with extensions in root, specific directories, auth pages, and public APIs
  // Note: Public APIs should be placed under /api/public/ to be excluded from authentication
  // Note: /maintenance is excluded so it can be accessed without auth during shutdown
  matcher: [
    // Root path
    '/',
    // All other paths except exclusions (.* instead of .+ to also catch single-segment paths)
    '/((?!_next/static|_next/image|manifest.json|.*\\.(?:ico|png|jpg|jpeg|svg|webp|gif)|assets|favicon*|images|logos|auth|api/stats|api/public|maintenance).+)',
  ],
};

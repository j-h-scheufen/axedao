import { NextResponse, NextRequest } from 'next/server';
import acceptLanguage from 'accept-language';

import { fallbackLng, ALL_LOCALES, cookieName } from './app/i18n/settings';

acceptLanguage.languages([...ALL_LOCALES]);

export function middleware(request: NextRequest) {
  // Determine preferred language in order of (cookie, accept-language, fallbackLng)
  let prefLang;
  if (request.cookies.has(cookieName))
    prefLang = acceptLanguage.get(request.cookies.get(cookieName)!.value);
  if (!prefLang)
    prefLang = acceptLanguage.get(request.headers.get('Accept-Language'));
  if (!prefLang) prefLang = fallbackLng;

  const pathname = request.nextUrl.pathname;

  const pathContainsSupportedLocale = ALL_LOCALES.some((locale) =>
    isLocalePath(pathname, locale)
  );

  // First, strip out fallback (default) language if it was explicit (/en/about becomes /about)
  if (isLocalePath(pathname, fallbackLng)) {
    return NextResponse.redirect(
      new URL(
        pathname.replace(
          `/${fallbackLng}`,
          pathname === `/${fallbackLng}` ? '/' : ''
        ),
        request.url
      )
    );
  }

  // If we can't find a supported locale, we either
  // a) rewrite to serve from the fallback languange or
  // b) redirect to a prefered language other than the fallback
  if (!pathContainsSupportedLocale) {
    if (prefLang === fallbackLng) {
      return NextResponse.rewrite(
        new URL(`/${prefLang}${pathname}`, request.url)
      );
    } else
      return NextResponse.redirect(
        new URL(`/${prefLang}${pathname}`, request.url)
      );
  }

  // TODO Set the cookie (review code! seems weird. why are we looking at the referer?)
  // if (request.headers.has('referer')) {
  //   const refererUrl = new URL(request.headers.get('referer')!);
  //   const lngInReferer = ALL_LOCALES.find((loc) =>
  //     refererUrl.pathname.startsWith(`/${loc}`)
  //   );
  //   const response = NextResponse.next();
  //   if (lngInReferer) response.cookies.set(cookieName, lngInReferer);
  //   return response;
  // }

  return NextResponse.next();
}

export const config = {
  // Do not run the middleware on the following paths
  matcher:
    '/((?!api|_next/static|_next/image|manifest.json|assets|favicon*|images|logos).*)',
};

function isLocalePath(path: string, locale: string): boolean {
  return path.startsWith(`/${locale}/`) || path === `/${locale}`;
}

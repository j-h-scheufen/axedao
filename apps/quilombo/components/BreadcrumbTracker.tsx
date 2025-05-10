'use client';

import { useAtom } from 'jotai';
import { usePathname } from 'next/navigation';
import { useEffect } from 'react';

import { PATHS } from '@/config/constants';
import { breadcrumbsHistoryAtom } from '@/hooks/state/app';

// matches /search, /users, /groups but not /users//edit
const crumbsPattern = /^\/(search|users|groups)(?!.*\/edit$)/;

/**
 * Empty client component that listens to the current pathname and updates the breadcrumbs history
 * to track the user navigating from /search to /users/:id and /groups/:id and back.
 * The current page is always the last entry in the breadcrumbs.
 * If the user navigates to /search, the history is reset.
 * If the user navigates to user or group profile pages, it's added to the history.
 * If the user navigates from the current page to the previous page, the last entry is removed.
 */
const BreadcrumbTracker = () => {
  const pathname = usePathname();
  const [breadcrumbs, setBreadcrumbs] = useAtom(breadcrumbsHistoryAtom);

  useEffect(() => {
    if (crumbsPattern.test(pathname)) {
      // skip, if we already have the current pathname at the end
      if (breadcrumbs.length && breadcrumbs[breadcrumbs.length - 1] === pathname) return;
      // navigating to /search restarts the breadcrumbs
      if (pathname === PATHS.search) {
        setBreadcrumbs([PATHS.search]);
      }
      // /users/:id and groups/:id are only added or removed if prior entries exist, i.e. either
      // "/search" or another user or group profile
      else if (breadcrumbs.length) {
        const newCrumbs = breadcrumbs;
        // navigating backwards
        if (breadcrumbs.length > 2 && breadcrumbs[breadcrumbs.length - 2] === pathname) newCrumbs.pop();
        // navigating forward
        else newCrumbs.push(pathname);
        setBreadcrumbs(newCrumbs);
      }
    }
  }, [pathname, breadcrumbs, setBreadcrumbs]);

  return <></>;
};

export default BreadcrumbTracker;

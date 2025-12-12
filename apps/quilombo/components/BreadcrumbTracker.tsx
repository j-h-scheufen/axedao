'use client';

import { useAtom } from 'jotai';
import { usePathname, useSearchParams } from 'next/navigation';
import { useEffect } from 'react';

import { PATHS } from '@/config/constants';
import { breadcrumbsHistoryAtom } from '@/hooks/state/app';

// Cover all paths that should be processed by the breadcrumb tracker
const crumbsPattern = /^\/(search|users|groups|dao|events)(?!.*\/edit$)/;

// Add paths that should reset the breadcrumbs tracking
const resetPaths = [PATHS.search, PATHS.dao];

/**
 * Empty client component that listens to the current pathname and updates the breadcrumbs history
 * to track the user navigating from /search to /users/:id and /groups/:id and back.
 * The current page is always the last entry in the breadcrumbs.
 * If the user navigates to /search or any of the "reset" paths, the tracking is reset.
 * If the user navigates to user/ or group/ profile pages, it's added to the history.
 * If the user navigates from the current page to the previous page, i.e. uses the back button, the last entry is removed.
 */
const BreadcrumbTracker = () => {
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const [breadcrumbs, setBreadcrumbs] = useAtom(breadcrumbsHistoryAtom);
  const lastBreadcrumb = breadcrumbs.length > 0 ? breadcrumbs[breadcrumbs.length - 1] : null;

  useEffect(() => {
    if (!crumbsPattern.test(pathname)) return;

    const queryString = searchParams.toString();
    const newBreadcrumb = { pathname, queryParams: queryString };

    // The order of checks is important to avoid runaway effect updates!

    // Check if the last breadcrumb is already correctly updated
    if (lastBreadcrumb?.pathname === pathname) {
      if (lastBreadcrumb.queryParams === queryString) {
        return;
      }
      // Keep queryParams of the last breadcrumb up-to-date
      setBreadcrumbs([...breadcrumbs.slice(0, -1), newBreadcrumb]);
      return;
    }

    // Then handle reset paths
    if (resetPaths.includes(pathname)) {
      setBreadcrumbs([newBreadcrumb]);
      return;
    }

    // Handle backwards navigation
    if (breadcrumbs.length > 2 && breadcrumbs[breadcrumbs.length - 2].pathname === pathname) {
      setBreadcrumbs(breadcrumbs.slice(0, -1));
      return;
    }

    // Forward navigation
    if (lastBreadcrumb) {
      setBreadcrumbs([...breadcrumbs, newBreadcrumb]);
      return;
    }

    // Initial breadcrumb
    setBreadcrumbs([newBreadcrumb]);
  }, [pathname, searchParams, breadcrumbs, setBreadcrumbs, lastBreadcrumb]);

  return null;
};

export default BreadcrumbTracker;

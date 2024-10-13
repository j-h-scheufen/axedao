'use client';

import { useAtomValue } from 'jotai';

import { PATHS } from '@/config/constants';
import { breadcrumbsHistoryAtom } from '@/hooks/state/app';
import { BreadcrumbItem, Breadcrumbs } from '@nextui-org/breadcrumbs';

const getRouteLabel = (route: string) => {
  const routeParts = route.split('/');
  switch (routeParts[1]) {
    case PATHS.search:
      return 'Search';
    case PATHS.users:
      return 'User XYZ';
    case PATHS.groups:
      return 'Group XYZ';
    default:
      return '?';
  }
};

const DashboardBreadcrumb = () => {
  const breadcrumbs = useAtomValue(breadcrumbsHistoryAtom);
  if (!!breadcrumbs.length) return null;
  return (
    <Breadcrumbs className="sticky left-0 top-16 z-10 mb-1 bg-background/70 pb-1 backdrop-blur-lg backdrop-saturate-150 data-[menu-open=true]:backdrop-blur-xl">
      {breadcrumbs.map((route, i) => {
        return (
          <BreadcrumbItem key={i} href={route} className="capitalize">
            {getRouteLabel(route)}
          </BreadcrumbItem>
        );
      })}
    </Breadcrumbs>
  );
};
export default DashboardBreadcrumb;

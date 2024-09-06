'use client';

import { usePathname } from 'next/navigation';
import { Breadcrumbs, BreadcrumbItem } from '@nextui-org/breadcrumbs';
import { useMemo } from 'react';

const DashboardBreadcrumb = () => {
  const pathname = usePathname();
  const routes = useMemo(() => pathname.replace('/dashboard/', '').split('/'), [pathname]);
  if (routes?.length || routes.length === 1) return null;
  return (
    <Breadcrumbs className="sticky left-0 top-16 z-10 mb-1 bg-background/70 pb-1 backdrop-blur-lg backdrop-saturate-150 data-[menu-open=true]:backdrop-blur-xl">
      {routes.map((route, i) => {
        return (
          <BreadcrumbItem key={i} href={'/dashboard/' + routes.slice(0, i + 1).join('/')} className="capitalize">
            {route}
          </BreadcrumbItem>
        );
      })}
    </Breadcrumbs>
  );
};
export default DashboardBreadcrumb;

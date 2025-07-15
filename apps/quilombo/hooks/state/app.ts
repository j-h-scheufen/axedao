import { atom } from 'jotai';

import type { Breadcrumb } from '@/types/model';

export const breadcrumbsHistoryAtom = atom<Breadcrumb[]>([]);

// Derived atom that always points to the second to last breadcrumb's full URL
export const backUrlFromBreadcrumbsAtom = atom<string | undefined>((get) => {
  const crumbs = get(breadcrumbsHistoryAtom);
  if (crumbs.length < 2) return undefined;

  const backCrumb = crumbs[crumbs.length - 2];
  return backCrumb.pathname + (backCrumb.queryParams ? `?${backCrumb.queryParams}` : '');
});

export const searchTabAtom = atom<'users' | 'groups' | 'rodas'>('users');

export const lastSyncedBlockAtom = atom<bigint | null>(null);

export const latestBlockNumberAtom = atom<bigint | null>(null);

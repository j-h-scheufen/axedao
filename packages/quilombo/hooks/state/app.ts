import { atom } from 'jotai';

export const breadcrumbsHistoryAtom = atom<string[]>([]);

export const searchTabAtom = atom<'users' | 'groups'>('users');

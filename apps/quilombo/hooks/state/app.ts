import { atom } from 'jotai';

export const breadcrumbsHistoryAtom = atom<string[]>([]);

export const searchTabAtom = atom<'users' | 'groups'>('users');

export const lastSyncedBlockAtom = atom<bigint | null>(null);

export const latestBlockNumberAtom = atom<bigint | null>(null);

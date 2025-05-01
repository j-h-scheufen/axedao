import { atom } from 'jotai';
import { atomWithInfiniteQuery } from 'jotai-tanstack-query';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { searchGroupsOptions } from '@/query/group';
import { searchUsersOptions } from '@/query/user';
import type { GroupSearchResult, UserSearchResult } from '@/types/model';

export const pageSizeAtom = atom<number>(QUERY_DEFAULT_PAGE_SIZE);

export const userSearchTermAtom = atom<string>('');

export const userSearchResultsAtom = atomWithInfiniteQuery<UserSearchResult>((get) =>
  searchUsersOptions({ searchTerm: get(userSearchTermAtom), pageSize: get(pageSizeAtom) }),
);

export const groupSearchTermAtom = atom<string>('');

export const groupSearchResultsAtom = atomWithInfiniteQuery<GroupSearchResult>((get) =>
  searchGroupsOptions({ searchTerm: get(groupSearchTermAtom), pageSize: get(pageSizeAtom) }),
);

import { atom } from 'jotai';
import { atomWithQuery } from 'jotai-tanstack-query';

import { fetchEventOptions } from '@/query/event';
import type { Event } from '@/types/model';

// This atom is used to trigger the loading of an event
export const triggerEventIdAtom = atom<string | undefined>();

export const eventAtom = atomWithQuery<Event | undefined>((get) => fetchEventOptions(get(triggerEventIdAtom)));

export const eventIdAtom = atom<string | undefined>((get) => get(eventAtom).data?.id ?? undefined);

export const eventNameAtom = atom<string | undefined>((get) => get(eventAtom).data?.name ?? undefined);

export const eventDescriptionAtom = atom<string | null | undefined>((get) => get(eventAtom).data?.description);

export const eventTypeAtom = atom<string | undefined>((get) => get(eventAtom).data?.type ?? undefined);

export const eventUrlAtom = atom<string | null | undefined>((get) => get(eventAtom).data?.url);

export const eventStartDateAtom = atom<Date | undefined>((get) => get(eventAtom).data?.start ?? undefined);

export const eventEndDateAtom = atom<Date | null | undefined>((get) => get(eventAtom).data?.end);

export const eventCountryCodeAtom = atom<string | null | undefined>((get) => get(eventAtom).data?.countryCode);

export const eventCreatorIdAtom = atom<string | undefined>((get) => get(eventAtom).data?.creatorId ?? undefined);

export const eventAssociatedGroupsAtom = atom<string[] | undefined>(
  (get) => get(eventAtom).data?.associatedGroups ?? undefined
);

export const eventAssociatedUsersAtom = atom<string[] | undefined>(
  (get) => get(eventAtom).data?.associatedUsers ?? undefined
);

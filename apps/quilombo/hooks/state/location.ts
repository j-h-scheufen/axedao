import { atomWithQuery } from 'jotai-tanstack-query';

import { fetchLocationsOptions } from '@/query/location';
import type { GroupLocationFeatureCollection } from '@/types/model';

// Global locations for map view
export const locationsAtom = atomWithQuery<GroupLocationFeatureCollection>(() => fetchLocationsOptions());

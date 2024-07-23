import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';

type City = { name: string };

type CitiesState = {
  cities: City[];
  isLoading: boolean;
  loadingCitiesError?: Error | string;
};

export type SearchCitiesQuery = { countryCode: string; searchTerm?: string };

type CitiesActions = {
  search: (query: SearchCitiesQuery) => Promise<void>;
};

type CitiesStore = CitiesState & { actions: CitiesActions };

const DEFAULT_PROPS: CitiesState = {
  cities: [],
  isLoading: false,
};

const useCitiesStore = create<CitiesStore>((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    search: async (query: SearchCitiesQuery) => {
      const { isLoading } = get();
      if (isLoading || !query.countryCode) return;
      set({ isLoading: true });
      try {
        const queryParams = new URLSearchParams(query);
        const { data: cities } = await axios.get(`/api/location/cities?${queryParams}`);
        set({ cities });
      } catch (error) {
        const errorMessage = generateErrorMessage(error, 'An error occurred while fetching cities');
        set({ loadingCitiesError: errorMessage });
      }
      set({ isLoading: false });
    },
  },
}));

export const useCitiesActions = (): CitiesActions => useCitiesStore((state) => state.actions);

export const useCities = (): City[] => useCitiesStore((state) => state.cities);

export const useIsLoadingCities = (): boolean => useCitiesStore((state) => state.isLoading);

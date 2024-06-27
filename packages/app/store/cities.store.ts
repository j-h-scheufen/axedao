import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';

type City = { name: string };

type CitiesState = {
  cities: City[];
  isLoading: boolean;
  loadingCitiesError?: Error | string;
};

type CitiesActions = {
  load: (countryCode: string) => Promise<void>;
};

type CitiesStore = CitiesState & { actions: CitiesActions };

const DEFAULT_PROPS: CitiesState = {
  cities: [],
  isLoading: false,
};

const useCitiesStore = create<CitiesStore>((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    load: async (countryCode: string) => {
      const { isLoading } = get();
      if (isLoading || !countryCode) return;
      set({ isLoading: true });
      try {
        const { data: cities } = await axios.post('/api/location/cities', { countryCode });
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

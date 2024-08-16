import { generateErrorMessage } from '@/utils';
import axios from 'axios';
import { create } from 'zustand';

export type Country = { name: string; isoCode: string };

type CountriesState = {
  countries: Country[];
  isLoading: boolean;
  loadingCountriesError?: Error | string;
};

type CountriesActions = {
  initialize: () => Promise<void>;
};

type CountriesStore = CountriesState & { actions: CountriesActions };

const DEFAULT_PROPS: CountriesState = {
  countries: [],
  isLoading: false,
};

const useCountriesStore = create<CountriesStore>((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async () => {
      const { isLoading } = get();
      if (isLoading) return;
      set({ isLoading: true });
      try {
        const { data: countries } = await axios.get('/api/location/countries');
        set({ countries });
      } catch (error) {
        const errorMessage = generateErrorMessage(error, 'An error occurred while fetching countries');
        set({ loadingCountriesError: errorMessage });
      }
      set({ isLoading: false });
    },
  },
}));

export const useCountriesActions = (): CountriesActions => useCountriesStore((state) => state.actions);

export const useCountries = (): Country[] => useCountriesStore((state) => state.countries);

export const useIsLoadingCountries = (): boolean => useCountriesStore((state) => state.isLoading);

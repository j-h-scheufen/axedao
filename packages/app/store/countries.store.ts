import axios from 'axios';
import { create } from 'zustand';

import { Country } from '@/types/model';

type CountriesState = {
  countries: Country[];
  error: string | undefined;
  initialized: boolean;
};

type CountriesActions = {
  initialize: () => Promise<void>;
};

type CountriesStore = CountriesState & { actions: CountriesActions };

const DEFAULT_PROPS: CountriesState = {
  countries: [],
  error: undefined,
  initialized: false,
};

/**
 * A store to manage general, application-wide data. Put anything here that is needed in multiple places and
 * should be initialized when the application starts or the user logs in.
 */
const useCountriesStore = create<CountriesStore>((set, get) => ({
  ...DEFAULT_PROPS,
  actions: {
    initialize: async () => {
      if (get().initialized) return;
      try {
        const response = await axios.get('/api/location/countries');
        const { data: countries, status } = response;
        set({ countries, error: undefined, initialized: true });
      } catch (error) {
        const errorMessage = 'Unable to load countries from server';
        console.error(errorMessage, error);
        set({ error: errorMessage });
      }
    },
  },
}));

export const useCountries = (): Country[] => useCountriesStore((state) => state.countries);

export const useCountriesActions = (): CountriesActions => useCountriesStore((state) => state.actions);

export const useIsCountriesInitialized = (): boolean => useCountriesStore((state) => state.initialized);

export const useCountriesError = (): string | undefined => useCountriesStore((state) => state.error);

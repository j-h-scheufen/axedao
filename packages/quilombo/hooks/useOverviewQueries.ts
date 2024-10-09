import { parseAsString, useQueryStates } from 'nuqs';

const params = {
  searchTerm: parseAsString,
  tab: parseAsString.withDefault('users'),
};

const useOverviewQueries = () => {
  return useQueryStates(params);
};

export default useOverviewQueries;

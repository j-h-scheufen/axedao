import { parseAsString, useQueryStates } from 'nuqs';

const params = {
  searchTerm: parseAsString,
  searchBy: parseAsString,
  tab: parseAsString.withDefault('users'),
};

const useOverviewQueries = () => {
  return useQueryStates(params);
};

export default useOverviewQueries;

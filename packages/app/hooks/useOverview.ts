import { parseAsString, useQueryStates } from 'nuqs';

const params = {
  searchTerm: parseAsString,
  searchBy: parseAsString,
  tab: parseAsString.withDefault('users'),
};

const useOverview = () => {
  return useQueryStates(params);
};

export default useOverview;

import { parseAsString, useQueryStates } from 'nuqs';

const params = {
  searchTerm: parseAsString,
  searchBy: parseAsString,
  tab: parseAsString.withDefault('users'),
};

const useGlobalAdminOverview = () => {
  return useQueryStates(params);
};

export default useGlobalAdminOverview;

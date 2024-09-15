import { PlusIcon } from 'lucide-react';
import { useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';

import useGroupMembersStore from '@/store/groupMembers.store';
import { getUserDisplayName } from '@/utils';
import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';

// TODO: the members of the group are known and can be injected into the store for faster searching.

type Props = { groupId: string };
const AddAdmin = ({ groupId }: Props) => {
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [debouncedSearchTerm] = useDebounce(searchTerm, 500);

  const { actions, isLoadingGroupMembers, searchResults } = useRef(useGroupMembersStore()).current;

  useEffect(() => {
    actions.initialize(groupId);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    actions.search(debouncedSearchTerm);
  }, [actions, debouncedSearchTerm]);

  return (
    <Autocomplete
      label="Add new admin"
      placeholder="Search members by name"
      startContent={<PlusIcon className="h-4 w-4" strokeWidth={1.4} />}
      isLoading={isLoadingGroupMembers}
      inputValue={searchTerm}
      onInputChange={setSearchTerm}
      className="max-w-xs mt-5"
    >
      {searchResults
        .filter((member) => member.role === 'member')
        .map((member) => {
          const name = getUserDisplayName(member);
          return (
            <AutocompleteItem key={member.id} value={member.id} textValue={name}>
              <div className="mb-1">{name}</div>
              <div className="text-small text-default-500">{member.email}</div>
            </AutocompleteItem>
          );
        })}
    </Autocomplete>
  );
};
export default AddAdmin;

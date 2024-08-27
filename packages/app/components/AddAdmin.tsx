import useGroupMembersStore from '@/app/dashboard/overview/groups/[groupId]/store/groupMembers.store';
import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { PlusIcon } from 'lucide-react';
import { useEffect, useRef, useState } from 'react';
import { useDebounce } from 'use-debounce';

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
        .map(({ name, id, email }) => (
          <AutocompleteItem key={id} value={id} textValue={name || ''}>
            <div className="mb-1">{name}</div>
            <div className="text-small text-default-500">{email}</div>
          </AutocompleteItem>
        ))}
    </Autocomplete>
  );
};
export default AddAdmin;

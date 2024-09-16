import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { FieldProps, useField } from 'formik';
import { SearchIcon } from 'lucide-react';

import { useFilteredGroups, useGroupsActions, useGroupsInitStatus } from '@/store/groups.store';
import { Group } from '@/types/model';
import { Avatar } from '@nextui-org/avatar';

type Props = FieldProps['field'];

/**
 * AutomCompolete component for selecting a user by their wallet address.
 * @param props
 * @returns
 */
const UserSelect = (props: Props) => {
  const [field, , form] = useField(props);
  const { setFilter } = useGroupsActions();
  const filteredGroups = useFilteredGroups();
  const { isGroupsInitializing } = useGroupsInitStatus();

  return (
    <Autocomplete
      {...field}
      items={filteredGroups}
      className="mb-3"
      isLoading={isGroupsInitializing}
      inputProps={{ classNames: { inputWrapper: '!min-h-12' } }}
      listboxProps={{ emptyContent: 'No users found' }}
      startContent={<SearchIcon className="h-4 w-4" strokeWidth={1.4} />}
      selectedKey={field.value}
      onInputChange={(value) => {
        if (!field.value) setFilter(value);
      }}
      onSelectionChange={(key) => {
        form.setValue(key?.toString() || '');
        setFilter('');
      }}
      {...props}
    >
      {(group: Group) => {
        return (
          <AutocompleteItem
            key={group.id}
            aria-label={`Group ${group.name}`}
            textValue={group.name}
            startContent={
              group.logo ? (
                <Avatar alt={`Logo of group ${group.name}`} className="w-6 h-6" src={group.logo} />
              ) : undefined
            }
          >
            {group.name}
          </AutocompleteItem>
        );
      }}
    </Autocomplete>
  );
};
export default UserSelect;

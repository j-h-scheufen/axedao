import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { FieldProps, useField } from 'formik';
import { SearchIcon } from 'lucide-react';

import useGroupSearch from '@/hooks/useGroupSearch';
import { Group } from '@/types/model';
import { Avatar } from '@nextui-org/avatar';

type Props = FieldProps['field'] & {
  onSelect?: (user: Group | null) => void;
};

/**
 * AutoComplete component for selecting groups
 * @param props
 * @returns
 */
const GroupSelect = ({ onSelect, ...props }: Props) => {
  const [field, , form] = useField(props);
  const { groups, isLoading, setSearchTerm } = useGroupSearch();

  return (
    <Autocomplete
      {...field}
      items={groups}
      className="mb-3"
      isLoading={isLoading}
      inputProps={{ classNames: { inputWrapper: '!min-h-12' } }}
      listboxProps={{ emptyContent: 'No groups found' }}
      startContent={<SearchIcon className="h-4 w-4" strokeWidth={1.4} />}
      selectedKey={field.value}
      onInputChange={(value) => {
        if (!field.value) setSearchTerm(value);
      }}
      onSelectionChange={(key) => {
        form.setValue(key?.toString() || '');
        setSearchTerm(undefined);
        onSelect?.(!key ? null : groups.find((g) => g.id === key) || null);
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
export default GroupSelect;

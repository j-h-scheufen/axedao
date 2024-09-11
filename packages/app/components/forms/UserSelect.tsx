import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { FieldProps, useField } from 'formik';
import { SearchIcon } from 'lucide-react';

import { useFilteredUsers, useUsersActions, useUsersInitStatus } from '@/store/users.store';
import { User } from '@/types/model';
import { getUserDisplayName } from '@/utils';

/**
 * AutomCompolete component for selecting a user by their wallet address.
 * @param props
 * @returns
 */
const UserSelect = (props: FieldProps['field']) => {
  const [field, , form] = useField(props);
  const { setFilter } = useUsersActions();
  const filteredUsers = useFilteredUsers();
  const { isUsersInitializing } = useUsersInitStatus();

  return (
    <Autocomplete
      {...field}
      items={filteredUsers}
      className="mb-3"
      isLoading={isUsersInitializing}
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
      {(user: User) => {
        const displayName = getUserDisplayName(user);
        return (
          <AutocompleteItem key={user.walletAddress} aria-label={`User ${displayName}`} textValue={displayName}>
            {displayName}
          </AutocompleteItem>
        );
      }}
    </Autocomplete>
  );
};
export default UserSelect;

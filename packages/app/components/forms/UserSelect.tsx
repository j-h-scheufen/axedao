import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { FieldProps, useField } from 'formik';
import { SearchIcon } from 'lucide-react';

import { useFilteredUsers, useUsersActions, useUsersInitStatus } from '@/store/users.store';
import { User } from '@/types/model';
import { getUserDisplayName } from '@/utils';
import { useSession } from 'next-auth/react';

type Props = FieldProps['field'] & {
  disableCurrentUser?: boolean;
  keyMode?: 'walletAddress' | 'id';
};

/**
 * AutomCompolete component for selecting a user and storing either the user's ID or walletAddress
 * in the form.
 * @param props
 * @returns
 */
const UserSelect = ({ disableCurrentUser = true, keyMode = 'id', ...props }: Props) => {
  const { data: session } = useSession();
  const [field, , form] = useField(props);
  const { setFilter } = useUsersActions();
  const filteredUsers = useFilteredUsers();
  const { isUsersInitializing } = useUsersInitStatus();

  function getUserDisabledKeys(): string[] {
    switch (keyMode) {
      case 'walletAddress':
        return session?.user?.walletAddress ? [session.user.walletAddress] : [];
      case 'id':
        return session?.user?.id ? [session.user.id] : [];
    }
    return [];
  }

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
      disabledKeys={disableCurrentUser ? getUserDisabledKeys() : []}
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
          <AutocompleteItem key={user[keyMode]} aria-label={`User ${displayName}`} textValue={displayName}>
            {displayName}
          </AutocompleteItem>
        );
      }}
    </Autocomplete>
  );
};
export default UserSelect;

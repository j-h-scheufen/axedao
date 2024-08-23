import ErrorText from '@/components/ErrorText';
import { useHasMoreUsers, useIsLoadingUsers, useLoadUsersError, useUsers, useUsersActions } from '@/store/users.store';
import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { Input } from '@nextui-org/react';
import { Tab, Tabs } from '@nextui-org/tabs';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { SearchIcon } from 'lucide-react';
import { useEffect, useState } from 'react';
import { Controller, useFormContext } from 'react-hook-form';
import { useDebounce } from 'use-debounce';

const FounderField = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [debouncedSearchTerm] = useDebounce(searchTerm, 500);

  const users = useUsers();
  const loadUsersError = useLoadUsersError();
  const isLoadingUsers = useIsLoadingUsers();
  const usersActions = useUsersActions();
  const hasMoreUsers = useHasMoreUsers();

  useEffect(() => {
    usersActions.search({ searchTerm: debouncedSearchTerm });
  }, [debouncedSearchTerm, usersActions]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreUsers,
    isEnabled: isOpen,
    shouldUseLoader: true,
    onLoadMore: usersActions.loadNextPage,
  });

  const form = useFormContext();
  const { control } = form || {};

  return (
    <div>
      <Tabs variant="bordered" aria-label="Options">
        <Tab key="input" title="Input founder name">
          <Controller
            control={control}
            name="founder"
            render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
              const errorMessage = error?.message;
              return (
                <Input
                  ref={ref}
                  value={value || ''}
                  onBlur={onBlur}
                  onChange={onChange}
                  label="Founder"
                  placeholder="Enter the group founder's name"
                  className="mb-3"
                  classNames={{ inputWrapper: '!min-h-12' }}
                  errorMessage={errorMessage}
                  isInvalid={!!errorMessage}
                  color={!!errorMessage ? 'danger' : undefined}
                />
              );
            }}
          />
        </Tab>
        <Tab key="create-group" title="Select a user">
          <Controller
            control={control}
            name="founder"
            render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
              const isInvalid = !!error;
              return (
                <Autocomplete
                  ref={ref}
                  label="Join a group"
                  placeholder="Search users by name"
                  className="mb-3"
                  inputProps={{ classNames: { inputWrapper: '!min-h-12' } }}
                  listboxProps={{ emptyContent: isLoadingUsers ? 'Loading...' : 'No users found' }}
                  startContent={<SearchIcon className="h-4 w-4" strokeWidth={1.4} />}
                  isLoading={isLoadingUsers}
                  inputValue={searchTerm}
                  onInputChange={setSearchTerm}
                  value={value}
                  onSelectionChange={onChange}
                  onBlur={onBlur}
                  errorMessage={error?.message}
                  isInvalid={isInvalid}
                  color={isInvalid ? 'danger' : undefined}
                  scrollRef={scrollerRef}
                  onOpenChange={setIsOpen}
                >
                  {users.map(({ name, id }) => (
                    <AutocompleteItem key={id} value={id} textValue={name || ''}>
                      <div className="mb-1">{name}</div>
                    </AutocompleteItem>
                  ))}
                </Autocomplete>
              );
            }}
          />
        </Tab>
      </Tabs>
      <ErrorText message={loadUsersError} />
    </div>
  );
};
export default FounderField;

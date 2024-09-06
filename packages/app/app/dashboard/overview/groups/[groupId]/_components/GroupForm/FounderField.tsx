import ErrorText from '@/components/ErrorText';
import { useHasMoreUsers, useIsLoadingUsers, useLoadUsersError, useUsers, useUsersActions } from '@/store/users.store';
import { isUUID } from '@/utils';
import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { Input } from '@nextui-org/react';
import { Tab, Tabs } from '@nextui-org/tabs';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { FieldProps, useField } from 'formik';
import { SearchIcon } from 'lucide-react';
import { useEffect, useState } from 'react';
import { useDebounce } from 'use-debounce';

const FounderField = (props: FieldProps['field']) => {
  const [field, , form] = useField(props);
  const [isOpen, setIsOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [debouncedSearchTerm] = useDebounce(searchTerm, 500);

  const users = useUsers();
  const loadUsersError = useLoadUsersError();
  const isLoadingUsers = useIsLoadingUsers();
  const { search, loadNextPage } = useUsersActions();
  const hasMoreUsers = useHasMoreUsers();

  const isFounderUUID = field.value && isUUID(field.value);

  useEffect(() => {
    search({ searchTerm: debouncedSearchTerm });
  }, [debouncedSearchTerm, search]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreUsers,
    isEnabled: isOpen,
    shouldUseLoader: true,
    onLoadMore: loadNextPage,
  });

  return (
    <div>
      <Tabs variant="bordered" aria-label="Options" selectedKey={isFounderUUID ? 'select' : 'input'}>
        <Tab key="input" title="Input founder name">
          <Input
            {...field}
            className="mb-3"
            classNames={{ inputWrapper: '!min-h-12' }}
            value={isFounderUUID ? '' : field.value}
          />
        </Tab>
        <Tab key="select" title="Select a user">
          <Autocomplete
            className="mb-3"
            inputProps={{ classNames: { inputWrapper: '!min-h-12' } }}
            listboxProps={{ emptyContent: isLoadingUsers ? 'Loading...' : 'No users found' }}
            startContent={<SearchIcon className="h-4 w-4" strokeWidth={1.4} />}
            selectedKey={field.value}
            isLoading={isLoadingUsers}
            inputValue={searchTerm}
            onInputChange={setSearchTerm}
            onSelectionChange={(key) => {
              form.setValue(key?.toString() || undefined);
            }}
            scrollRef={scrollerRef}
            onOpenChange={setIsOpen}
          >
            {users.map(({ name, id }) => (
              <AutocompleteItem key={id} value={id} textValue={name || ''}>
                <div className="mb-1">{name}</div>
              </AutocompleteItem>
            ))}
          </Autocomplete>
        </Tab>
      </Tabs>
      <ErrorText message={loadUsersError} />
    </div>
  );
};
export default FounderField;

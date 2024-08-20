'use client';

import { useIsJoiningGroup, useProfileActions } from '@/app/dashboard/profile/store';
import ErrorText from '@/components/ErrorText';
import {
  useGroups,
  useGroupsActions,
  useGroupsHasMoreResults,
  useIsLoadingGroups,
  useLoadGroupsError,
} from '@/store/groups.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { Button } from '@nextui-org/button';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { Search } from 'lucide-react';
import { useEffect, useState } from 'react';
import { Controller, useForm } from 'react-hook-form';
import { useDebounce } from 'use-debounce';
import { joinGroupFormSchema } from '../schema';

const JoinGroupForm = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [debouncedSearchTerm] = useDebounce(searchTerm, 500);

  const groups = useGroups();
  const loadGroupsError = useLoadGroupsError();
  const isLoadingGroups = useIsLoadingGroups();
  const hasMoreGroups = useGroupsHasMoreResults();
  const groupsActions = useGroupsActions();

  const isJoiningGroup = useIsJoiningGroup();
  const profileActions = useProfileActions();

  useEffect(() => {
    groupsActions.initialize({ searchTerm: debouncedSearchTerm });
  }, [debouncedSearchTerm, groupsActions]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreGroups,
    isEnabled: isOpen,
    shouldUseLoader: true,
    onLoadMore: groupsActions.loadNextPage,
  });

  const { control, handleSubmit } = useForm({
    resolver: yupResolver(joinGroupFormSchema),
  });

  return (
    <form
      onSubmit={handleSubmit(({ id }) => {
        profileActions.joinGroup(id);
      })}
    >
      <Controller
        control={control}
        name="id"
        render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
          const isInvalid = !!error;
          return (
            <Autocomplete
              ref={ref}
              label="Join a group"
              placeholder="Search groups by name"
              inputProps={{ classNames: { inputWrapper: '!min-h-12' } }}
              listboxProps={{ emptyContent: isLoadingGroups ? 'Loading...' : 'No groups found' }}
              startContent={<Search className="h-4 w-4" strokeWidth={1.4} />}
              isLoading={isLoadingGroups}
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
              {groups.map(({ name, id }) => (
                <AutocompleteItem key={id} value={id} textValue={name}>
                  <div className="mb-1">{name}</div>
                </AutocompleteItem>
              ))}
            </Autocomplete>
          );
        }}
      />
      <ErrorText message={loadGroupsError} />
      <div className="mt-5 flex justify-between gap-3">
        <Button type="submit" className="w-full flex-1" isLoading={isJoiningGroup}>
          Join group
        </Button>
      </div>
    </form>
  );
};

export default JoinGroupForm;

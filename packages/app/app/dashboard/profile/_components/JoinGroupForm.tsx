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
import { Spinner } from '@nextui-org/react';
import { useInfiniteScroll } from '@nextui-org/use-infinite-scroll';
import { Search } from 'lucide-react';
import { useEffect, useState } from 'react';
import { Controller, useForm } from 'react-hook-form';
import { useDebounce } from 'use-debounce';
import { JoinGroupFormType, joinGroupFormSchema } from '../schema';

type Props = { onSubmit?: (values: JoinGroupFormType) => void | null };
const JoinGroupForm = ({ onSubmit }: Props) => {
  const [isOpen, setIsOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState<string>('');
  const [debouncedSearchTerm] = useDebounce(searchTerm, 500);

  const groups = useGroups();
  const loadGroupsError = useLoadGroupsError();
  const isLoadingGroups = useIsLoadingGroups();
  const hasMoreGroups = useGroupsHasMoreResults();
  const groupActions = useGroupsActions();

  const isJoiningGroup = useIsJoiningGroup();
  const profileActions = useProfileActions();

  useEffect(() => {
    groupActions.initialize();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    groupActions.search(debouncedSearchTerm);
  }, [debouncedSearchTerm, groupActions]);

  const [, scrollerRef] = useInfiniteScroll({
    hasMore: hasMoreGroups,
    isEnabled: isOpen,
    shouldUseLoader: true,
    onLoadMore: groupActions.loadNextPage,
  });

  const { control, handleSubmit } = useForm({
    resolver: yupResolver(joinGroupFormSchema),
  });

  return (
    <form
      onSubmit={handleSubmit(({ id }) => {
        profileActions.joinGroup(id);
        onSubmit && onSubmit({ id });
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
              inputProps={{ classNames: { inputWrapper: 'min-h-12' } }}
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
        <Button type="submit" className="w-full flex-1" isLoading={isJoiningGroup} spinner={<Spinner size="sm" />}>
          Join group
        </Button>
      </div>
    </form>
  );
};

export default JoinGroupForm;

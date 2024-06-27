'use client';

import { useIsInitializingProfile } from '@/store/profile.store';
import { useIsInitializingUser, useUserActions, useUserProfile } from '@/store/user.store';
import { User as UserType } from '@/types/model';
import { cn } from '@/utils/tailwind';
import { Button } from '@nextui-org/button';
import { Autocomplete, AutocompleteItem, User } from '@nextui-org/react';
import { SearchIcon } from 'lucide-react';
import { FocusEvent, ForwardedRef, forwardRef, useEffect, useRef, useState } from 'react';
import UserCard from './UserCard';

type Props = {
  placeholder?: string;
  label?: string;
  onChange?: (value: string | undefined) => void;
  onBlur?: (event: FocusEvent<Element, Element>) => void;
  userId?: string;
  users?: UserType[];
  errorMessage?: string;
  className?: string;
  isLoading?: boolean;
};
const SelectUser = (
  {
    placeholder = 'Search users',
    label,
    onChange,
    onBlur,
    userId,
    users = [],
    errorMessage,
    className = '',
    isLoading = false,
  }: Props,
  ref: ForwardedRef<HTMLDivElement>,
) => {
  const [isChangingUser, setIsChangingUser] = useState<boolean>(false);
  // console.log(users);

  const userActions = useUserActions();
  const user = useUserProfile();
  const isInitializingProfile = useIsInitializingProfile();

  const isLoadingSelectedUser = useIsInitializingUser();

  const inputRef = useRef<HTMLInputElement | null>(null);

  useEffect(() => {
    if (!userId) return;
    userActions.initialize(userId);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [userId]);

  const changeHandler = (selectedValue: string | undefined) => {
    onChange && onChange(selectedValue);
  };

  if ((userId && !isChangingUser) || isLoading) {
    return (
      <div className={cn('max-w-xs', className)}>
        {label && <label className="mb-2 block text-sm">{label}</label>}
        <UserCard user={user} isLoading={isLoadingSelectedUser || isInitializingProfile} />
        <Button size="sm" className="ml-auto mt-3 block w-fit" onPress={() => setIsChangingUser(true)}>
          Change leader
        </Button>
      </div>
    );
  }

  return (
    <div ref={ref} className={className}>
      {label && <label className="mb-2 block text-sm">{label}</label>}
      <Autocomplete
        ref={inputRef}
        label={label || 'Search users'}
        aria-label={label || 'Search users'}
        placeholder={placeholder}
        startContent={<SearchIcon className="text-default-400" strokeWidth={2.5} size={20} />}
        className="max-w-xs"
        defaultItems={users}
        listboxProps={{ hideSelectedIcon: true }}
        onChange={(e) => {
          changeHandler(e.target.value);
        }}
        onBlur={onBlur}
        errorMessage={errorMessage}
        isInvalid={!!errorMessage}
        color={!!errorMessage ? 'danger' : undefined}
      >
        {(item) => {
          const { id, name, nickname } = item;
          return (
            <AutocompleteItem key={id} textValue={name || ''}>
              <User
                name={name}
                description={nickname}
                avatarProps={{
                  src: 'https://avatars.githubusercontent.com/u/30373425?v=4',
                  size: 'sm',
                }}
              />
            </AutocompleteItem>
          );
        }}
      </Autocomplete>
    </div>
  );
};
export default forwardRef(SelectUser);

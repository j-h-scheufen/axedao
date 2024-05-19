'use client';

import { ForwardedRef, Key, forwardRef, useRef } from 'react';
import { Autocomplete, AutocompleteItem, User } from '@nextui-org/react';
import { SearchIcon } from 'lucide-react';
import UserCard from './UserCard';
import { Button } from '@nextui-org/button';

const users = [...Array(10)].map((_, i) => ({ id: i, name: `John Doe ${i}`, nickname: `J_Doe ${i}` }));

type Props = {
  placeholder?: string;
  label?: string;
  onChange?: (...event: any[]) => void;
  onBlur?: (...event: any[]) => void;
  userId?: string;
  errorMessage?: string;
};
const SelectUser = (
  { placeholder = 'Search users', label, onChange, onBlur, userId, errorMessage }: Props,
  ref: ForwardedRef<any>,
) => {
  const inputRef = useRef<any>(null);

  const onSelectionChange = (selectedValue: string) => {
    onChange && onChange(selectedValue);
  };

  if (userId) {
    return (
      <div>
        <UserCard />
        <Button size="sm" className="ml-auto mt-3 block w-fit">
          Change
        </Button>
      </div>
    );
  }

  return (
    <div ref={ref}>
      <Autocomplete
        ref={inputRef}
        aria-label={label || 'Search users'}
        label={label}
        placeholder={placeholder}
        startContent={<SearchIcon className="text-default-400" strokeWidth={2.5} size={20} />}
        className="max-w-xs"
        defaultItems={users}
        listboxProps={{ hideSelectedIcon: true }}
        onSelectionChange={(selectedValue: Key) => onSelectionChange(selectedValue as string)}
        onBlur={onBlur}
        errorMessage={errorMessage}
        isInvalid={!!errorMessage}
        color={!!errorMessage ? 'danger' : undefined}
      >
        {(item) => {
          const { id, name, nickname } = item;
          return (
            <AutocompleteItem key={id} textValue={name}>
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

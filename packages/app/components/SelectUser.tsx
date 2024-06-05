'use client';

import { Autocomplete, AutocompleteItem, User } from '@nextui-org/react';
import { SearchIcon } from 'lucide-react';
import { FocusEvent, ForwardedRef, forwardRef, useRef } from 'react';
// import UserCard from './UserCard';
import { cn } from '@/utils/tailwind';
import { Button } from '@nextui-org/button';

const users = [...Array(10)].map((_, i) => ({ id: i, name: `John Doe ${i}`, nickname: `J_Doe ${i}` }));

type Props = {
  placeholder?: string;
  label?: string;
  onChange?: (value: string | undefined) => void;
  onBlur?: (event: FocusEvent<Element, Element>) => void;
  userId?: string;
  errorMessage?: string;
  className?: string;
};
const SelectUser = (
  { placeholder = 'Search users', label, onChange, onBlur, userId, errorMessage, className = '' }: Props,
  ref: ForwardedRef<HTMLDivElement>,
) => {
  const inputRef = useRef<HTMLInputElement | null>(null);

  const changeHandler = (selectedValue: string | undefined) => {
    onChange && onChange(selectedValue);
  };

  if (userId) {
    return (
      <div className={cn('max-w-xs', className)}>
        {label && <label className="mb-2 block text-sm">{label}</label>}
        {/* <UserCard /> */}
        <Button size="sm" className="ml-auto mt-3 block w-fit" onPress={() => changeHandler(undefined)}>
          Change
        </Button>
      </div>
    );
  }

  return (
    <div ref={ref} className={className}>
      {label && <label className="mb-2 block text-sm">{label}</label>}
      <Autocomplete
        ref={inputRef}
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

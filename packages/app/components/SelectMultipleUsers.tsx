'use client';

import { ForwardedRef, Key, forwardRef, useRef } from 'react';
import { Autocomplete, AutocompleteItem, User } from '@nextui-org/react';
import { PlusIcon, SearchIcon, XIcon } from 'lucide-react';
import UserCard from './UserCard';
import { Button } from '@nextui-org/button';
import { cn } from '@/utils/tailwind';
import { Control, Controller } from 'react-hook-form';

const users = [...Array(10)].map((_, i) => ({ id: i, name: `John Doe ${i}`, nickname: `J_Doe ${i}` }));

type Props = {
  control: Control<any>;
  name: string;
  placeholder?: string;
  label?: string;
  onChange?: (...event: any[]) => void;
  onRemove?: (...event: any[]) => void;
  onBlur?: (...event: any[]) => void;
  selectedUsers?: { id: string }[];
  fields?: { id: string; [key: string]: any }[];
  errorMessage?: string;
  className?: string;
};
const SelectMultipleUsers = (
  {
    control,
    name,
    placeholder = 'Search users',
    label,
    onChange,
    onRemove,
    onBlur,
    selectedUsers,
    fields = [],
    errorMessage,
    className = '',
  }: Props,
  ref: ForwardedRef<any>,
) => {
  const inputRef = useRef<any>(null);

  const onSelectionChange = (selectedValue: string) => {
    onChange && onChange(selectedValue);
    inputRef.current?.clear && inputRef.current.clear();
    inputRef.current?.blur && inputRef.current.blur();
  };

  return (
    <div ref={ref} className={cn('w-full', className)}>
      {label && <label className="mb-2 block text-sm">{label}</label>}
      <div className={cn('mb-3 grid w-full grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4', className)}>
        {fields?.length ? (
          fields.map((field, index) => (
            <Controller
              key={index}
              control={control}
              name={`${name}.${index}`}
              render={({ field: { ref } }) => {
                return (
                  <UserCard
                    ref={ref}
                    key={index}
                    endContent={
                      <Button
                        variant="light"
                        size="sm"
                        isIconOnly
                        className="pointer-events-auto my-auto ml-auto"
                        onClick={(e) => {
                          e.stopPropagation();
                        }}
                        onPress={() => {
                          onRemove && onRemove(field.id);
                        }}
                      >
                        <XIcon className="h-4 w-4 text-default-900" />
                      </Button>
                    }
                  />
                );
              }}
            />
          ))
        ) : (
          <div className="mb-3 text-small text-default-400">No admin added</div>
        )}
      </div>
      <Autocomplete
        ref={inputRef}
        aria-label={label || 'Search users'}
        placeholder={placeholder}
        startContent={<SearchIcon className="text-default-400" strokeWidth={2.5} size={20} />}
        className="max-w-xs"
        defaultItems={users}
        listboxProps={{ hideSelectedIcon: true }}
        selectedKey=""
        onSelectionChange={(selectedValue: Key) => onSelectionChange(selectedValue as string)}
        onBlur={onBlur}
        errorMessage={errorMessage}
        isInvalid={!!errorMessage}
        color={!!errorMessage ? 'danger' : undefined}
        shouldCloseOnBlur
      >
        {(item) => {
          const { id, name, nickname } = item;
          const selected = !!(selectedUsers?.length && selectedUsers.find((user) => user.id === id.toString()));
          console.log(selectedUsers, id, selected);
          return (
            <AutocompleteItem key={id} textValue={name}>
              <div className="flex items-center justify-between">
                <User
                  name={name}
                  description={nickname}
                  avatarProps={{
                    src: 'https://avatars.githubusercontent.com/u/30373425?v=4',
                    size: 'sm',
                  }}
                />
                <Button size="sm" variant="light" isIconOnly>
                  {selected ? <XIcon className="h-4 w-4" /> : <PlusIcon className="h-4 w-4" />}
                </Button>
              </div>
            </AutocompleteItem>
          );
        }}
      </Autocomplete>
    </div>
  );
};
export default forwardRef(SelectMultipleUsers);

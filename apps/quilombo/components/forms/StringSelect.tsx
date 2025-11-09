import { Select, SelectItem } from '@heroui/react';
import { type FieldProps, useField } from 'formik';
import { useMemo } from 'react';

// TODO Known problem with Select. This got fixed: https://github.com/nextui-org/nextui/pull/3698. But it's not tested in the app yet.

type Props = Omit<FieldProps['field'], 'items'> & {
  options: string[];
  label?: string;
  size?: 'sm' | 'md' | 'lg';
};

/**
 * @param props The props that were passed to the Field component.
 */
const StringSelect = ({ options = [], label, size, ...props }: Props) => {
  const [field, , form] = useField(props);
  const selectedKeys = useMemo(() => (field.value ? [field.value] : []), [field.value]);
  const selectItems = useMemo(
    () =>
      options.map((option) => (
        <SelectItem key={option} className="capitalize" aria-label={`select-option-${option}`}>
          {option}
        </SelectItem>
      )),
    [options]
  );

  const placeholder = `Select ${field.name}`;

  return (
    <Select
      {...field}
      size={size}
      label={label}
      placeholder={placeholder}
      classNames={{ value: 'capitalize' }}
      aria-label={placeholder}
      selectedKeys={selectedKeys}
      isClearable
      onSelectionChange={(keys) => {
        const value = keys === 'all' ? '' : Array.from(keys)[0]?.toString() || '';
        form.setValue(value);
      }}
    >
      {selectItems}
    </Select>
  );
};

export default StringSelect;

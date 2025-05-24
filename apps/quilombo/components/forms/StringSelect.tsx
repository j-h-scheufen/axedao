import { Button, Link, Select, SelectItem } from '@heroui/react';
import { type FieldProps, useField } from 'formik';
import { XIcon } from 'lucide-react';
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
    <div className="w-full flex items-center gap-1 sm:gap-2">
      <Select
        {...field}
        size={size}
        label={label}
        placeholder={placeholder}
        classNames={{ value: 'capitalize' }}
        aria-label={placeholder}
        selectedKeys={selectedKeys}
      >
        {selectItems}
      </Select>
      {field.value ? (
        <Button as={Link} href="#" variant="light" onPress={() => form.setValue(null)} isIconOnly>
          <XIcon className="h-6 w-6 sm:h-7 sm:w-7" strokeWidth={1} />
        </Button>
      ) : null}
    </div>
  );
};

export default StringSelect;

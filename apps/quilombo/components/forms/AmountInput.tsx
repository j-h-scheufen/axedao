import { Input } from "@heroui/input";
import { FieldProps, useField } from 'formik';
import { ChangeEvent } from 'react';

/**
 * A NextUI Input element that binds itself to a Formik Field component.
 * E.g. <Field name="name" label="Name" as={TextInput} />.
 * Props like 'classname' and 'classnames' will override the default styling.
 * @param props The that were passed to the Field component.
 */
const AmountInput = (props: FieldProps['field']) => {
  const [field, meta] = useField(props);
  return (
    <Input
      {...field}
      type="text"
      className="w-full"
      classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
      color={meta.touched && meta.error ? 'danger' : undefined}
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? meta.error : undefined}
      // prevent non-numeric characters from being entered or pasted
      onInput={(event: ChangeEvent<HTMLInputElement>) => {
        event.target.value = event.target.value.replace(/[^0-9+]/g, '');
      }}
      {...props}
    />
  );
};

export default AmountInput;

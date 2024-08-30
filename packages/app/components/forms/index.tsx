import { Input } from '@nextui-org/input';
import { FieldProps, useField } from 'formik';

/**
 * A NextUI Input element that binds itself to a Formik Field component.
 * E.g. <Field name="name" label="Name" as={TextInput} />.
 * Props like 'classname' and 'classnames' will override the default styling.
 * @param props The that were passed to the Field component.
 */
export const FieldInput = (props: FieldProps['field']) => {
  const [field, meta] = useField(props);
  return (
    <Input
      {...field}
      className="w-full"
      classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
      color={meta.touched && meta.error ? 'danger' : undefined}
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? meta.error : undefined}
      {...props}
    />
  );
};

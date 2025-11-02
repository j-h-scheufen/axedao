'use client';

import { Input, type InputProps } from '@heroui/react';
import { type FieldProps, useField } from 'formik';

/**
 * A NextUI Input component that binds itself to a Formik field.
 * Automatically handles validation state, error messages, and field binding.
 *
 * Usage:
 * ```tsx
 * <Field name="email" label="Email" type="email" as={FormikInput} />
 * ```
 *
 * @param props The props passed to the Field component, including custom InputProps
 */
const FormikInput = (props: FieldProps['field'] & InputProps) => {
  const [field, meta] = useField(props);

  return (
    <Input
      {...field}
      {...props}
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? meta.error : undefined}
      color={meta.touched && meta.error ? 'danger' : props.color}
    />
  );
};

export default FormikInput;

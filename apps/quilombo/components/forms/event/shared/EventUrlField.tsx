'use client';

import { Input } from '@heroui/react';
import { type FieldProps, useField } from 'formik';

/**
 * A Formik Field component for handling event URL input.
 * Usage: <Field name="url" as={EventUrlField} />
 */
const EventUrlField = (props: FieldProps['field']) => {
  const [field, meta] = useField(props);

  return (
    <Input
      {...field}
      label="Event URL (Optional)"
      placeholder="https://example.com"
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? String(meta.error) : undefined}
      {...props}
    />
  );
};

export default EventUrlField;

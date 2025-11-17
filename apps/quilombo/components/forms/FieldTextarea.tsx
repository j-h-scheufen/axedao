'use client';

import { Textarea } from '@heroui/react';
import { type FieldProps, useField } from 'formik';

/**
 * A NextUI Textarea element that binds itself to a Formik Field component.
 * E.g. <Field name="description" label="Description" as={FieldTextarea} />.
 * Props like 'classname' and 'classnames' will override the default styling.
 * @param props The props that were passed to the Field component.
 */
const FieldTextarea = (props: FieldProps['field']) => {
  const [field, meta] = useField(props);
  return (
    <Textarea
      {...field}
      className="w-full"
      classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left', input: 'base-text' }}
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? meta.error : undefined}
      {...props}
    />
  );
};

export default FieldTextarea;

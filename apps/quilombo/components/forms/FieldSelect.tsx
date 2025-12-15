'use client';

import { Select, type SelectProps } from '@heroui/react';
import { type FieldProps, useField } from 'formik';
import type React from 'react';

/**
 * A NextUI Select element that binds itself to a Formik Field component.
 * E.g. <Field name="type" label="Type" as={FieldSelect}><SelectItem key="a">Option A</SelectItem></Field>.
 * Props like 'classname' and 'classnames' will override the default styling.
 * @param props The props that were passed to the Field component.
 */
const FieldSelect = <T extends object>(
  props: FieldProps['field'] & Omit<SelectProps<T>, 'children'> & { children: React.ReactNode }
) => {
  const [field, meta] = useField(props.name);
  // biome-ignore lint/correctness/noUnusedVariables: name is extracted to avoid passing it to Select
  const { children, name, ...restProps } = props;

  return (
    <Select
      {...field}
      className="w-full"
      classNames={{ errorMessage: 'text-left' }}
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? meta.error : undefined}
      {...(restProps as SelectProps<T>)}
    >
      {children as SelectProps<T>['children']}
    </Select>
  );
};

export default FieldSelect;

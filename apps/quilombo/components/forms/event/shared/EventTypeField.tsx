'use client';

import { Select, SelectItem } from '@heroui/react';
import { type FieldProps, useField } from 'formik';

import { eventTypes } from '@/config/constants';
import { getEventTypeLabel } from '@/utils';

/**
 * A Formik Field component for handling event type selection.
 * Usage: <Field name="type" as={EventTypeField} />
 */
const EventTypeField = (props: FieldProps['field']) => {
  const [field, meta] = useField(props);

  return (
    <Select
      {...field}
      label="Event Type"
      placeholder="Select event type"
      selectedKeys={field.value ? [field.value] : []}
      isRequired
      isInvalid={meta.touched && !!meta.error}
      errorMessage={meta.touched && meta.error ? String(meta.error) : undefined}
      {...props}
    >
      {eventTypes.map((type) => (
        <SelectItem key={type}>{getEventTypeLabel(type)}</SelectItem>
      ))}
    </Select>
  );
};

export default EventTypeField;

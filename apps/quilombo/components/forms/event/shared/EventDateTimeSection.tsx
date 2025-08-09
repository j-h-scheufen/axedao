'use client';

import { DateRangePicker, DatePicker, Switch } from '@heroui/react';
import { parseAbsoluteToLocal } from '@internationalized/date';
import type { FormikProps } from 'formik';

import type { CreateEventForm, UpdateEventForm } from '@/config/validation-schema';

interface EventDateTimeSectionProps {
  values: CreateEventForm | UpdateEventForm;
  touched: FormikProps<CreateEventForm | UpdateEventForm>['touched'];
  errors: FormikProps<CreateEventForm | UpdateEventForm>['errors'];
  isMultiDay: boolean;
  setIsMultiDay: (value: boolean) => void;
  setFieldValue: (field: string, value: unknown) => void;
  setFieldTouched: (field: string, touched: boolean) => void;
}

const EventDateTimeSection = ({
  values,
  touched,
  errors,
  isMultiDay,
  setIsMultiDay,
  setFieldValue,
  setFieldTouched,
}: EventDateTimeSectionProps) => {
  return (
    <div className="flex flex-col gap-4">
      {/* Multi-day Toggle */}
      <div className="flex items-center gap-4">
        <div className="flex items-center gap-2">
          <Switch isSelected={isMultiDay} onValueChange={setIsMultiDay} aria-label="Toggle multi-day event" />
          <span className="text-sm font-medium">Multi-day event</span>
        </div>

        {/* All Day Toggle - only show when multi-day is enabled */}
        {isMultiDay && (
          <div className="flex items-center gap-2">
            <Switch
              isSelected={values.isAllDay}
              onValueChange={(checked) => {
                setFieldValue('isAllDay', checked);
                setFieldTouched('isAllDay', true);
              }}
              aria-label="Toggle all day event"
            />
            <span className="text-sm font-medium">All day event</span>
          </div>
        )}
      </div>

      {/* Date Picker - Single Date */}
      {!isMultiDay && (
        <DatePicker
          label="Event Date & Time"
          aria-label="Select event date and time"
          value={values.start ? parseAbsoluteToLocal(values.start) : null}
          onChange={(date) => {
            if (date) {
              const startISO = date.toDate().toISOString();
              setFieldValue('start', startISO);
              setFieldValue('end', undefined); // Clear end date for single-day events
              setFieldTouched('start', true);
            }
          }}
          granularity="minute"
          hideTimeZone
          isInvalid={touched.start && !!errors.start}
          errorMessage={touched.start && errors.start ? String(errors.start) : undefined}
        />
      )}

      {/* Date Range Picker - Multi-day */}
      {isMultiDay && (
        <DateRangePicker
          label="Event Date Range"
          aria-label="Select event date range"
          value={
            values.start
              ? {
                  start: parseAbsoluteToLocal(values.start),
                  end: values.end ? parseAbsoluteToLocal(values.end) : parseAbsoluteToLocal(values.start),
                }
              : null
          }
          onChange={(range) => {
            if (range) {
              // Convert ZonedDateTime back to ISO strings for form submission
              const startISO = range.start.toDate().toISOString();
              const endISO = range.end ? range.end.toDate().toISOString() : undefined;

              setFieldValue('start', startISO);
              setFieldValue('end', endISO);
              setFieldTouched('start', true);
              setFieldTouched('end', true);
            }
          }}
          granularity={values.isAllDay ? 'day' : 'minute'}
          hideTimeZone
          isInvalid={(touched.start && !!errors.start) || (touched.end && !!errors.end)}
          errorMessage={
            (touched.start && errors.start) || (touched.end && errors.end)
              ? String((touched.start && errors.start) || (touched.end && errors.end))
              : undefined
          }
        />
      )}
    </div>
  );
};

export default EventDateTimeSection;

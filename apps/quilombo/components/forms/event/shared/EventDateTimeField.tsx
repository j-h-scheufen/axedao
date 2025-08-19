'use client';

import { DateRangePicker, DatePicker, Switch } from '@heroui/react';
import { parseAbsoluteToLocal, type ZonedDateTime } from '@internationalized/date';
import { type FieldProps, useField } from 'formik';
import { useState, useEffect } from 'react';

type EventDateTimeFieldProps = FieldProps['field'] & {
  startFieldName: string;
  endFieldName: string;
  isAllDayFieldName: string;
};

/**
 * A Formik Field component for handling event date/time selection.
 * Manages multi-day toggle and all-day toggle internally.
 * Usage: <Field name="dateTime" as={EventDateTimeField} startFieldName="start" endFieldName="end" isAllDayFieldName="isAllDay" />
 */
const EventDateTimeField = ({ startFieldName, endFieldName, isAllDayFieldName }: EventDateTimeFieldProps) => {
  const [startField, startMeta, startHelpers] = useField(startFieldName);
  const [endField, endMeta, endHelpers] = useField(endFieldName);
  const [isAllDayField, , isAllDayHelpers] = useField(isAllDayFieldName);

  // Derive multi-day state from whether end date exists
  const [isMultiDay, setIsMultiDay] = useState(!!endField.value);

  // Update multi-day state when form values change (for edit mode)
  useEffect(() => {
    setIsMultiDay(!!endField.value);
  }, [endField.value]);

  const handleMultiDayToggle = (value: boolean) => {
    setIsMultiDay(value);
    if (!value) {
      // Clear end date when switching to single day
      endHelpers.setValue(undefined);
      endHelpers.setTouched(false);
    }
  };

  const handleAllDayToggle = (checked: boolean) => {
    isAllDayHelpers.setValue(checked);
    isAllDayHelpers.setTouched(true);
  };

  const handleSingleDateChange = (date: ZonedDateTime | null) => {
    if (date) {
      const startISO = date.toDate().toISOString();
      startHelpers.setValue(startISO);
      endHelpers.setValue(undefined); // Clear end date for single-day events
      startHelpers.setTouched(true);
    }
  };

  const handleDateRangeChange = (range: { start: ZonedDateTime; end?: ZonedDateTime } | null) => {
    if (range) {
      const startISO = range.start.toDate().toISOString();
      const endISO = range.end ? range.end.toDate().toISOString() : undefined;

      startHelpers.setValue(startISO);
      endHelpers.setValue(endISO);
      startHelpers.setTouched(true);
      endHelpers.setTouched(true);
    }
  };

  const hasError = (startMeta.touched && !!startMeta.error) || (endMeta.touched && !!endMeta.error);
  const errorMessage = (startMeta.touched && startMeta.error) || (endMeta.touched && endMeta.error) || undefined;

  return (
    <div className="flex flex-col gap-4">
      {/* Multi-day Toggle */}
      <div className="flex items-center gap-4">
        <div className="flex items-center gap-2">
          <Switch
            isSelected={isAllDayField.value}
            onValueChange={handleAllDayToggle}
            aria-label="Toggle all day event"
          />
          <span className="text-sm font-medium">All day</span>
        </div>
        <div className="flex items-center gap-2">
          <Switch isSelected={isMultiDay} onValueChange={handleMultiDayToggle} aria-label="Toggle multi-day event" />
          <span className="text-sm font-medium">Multi-day</span>
        </div>
      </div>

      {/* Date Picker - Single Date */}
      {!isMultiDay && (
        <DatePicker
          label="Event Date & Time"
          aria-label="Select event date and time"
          value={startField.value ? parseAbsoluteToLocal(startField.value) : null}
          onChange={handleSingleDateChange}
          granularity={isAllDayField.value ? 'day' : 'minute'}
          hideTimeZone
          isInvalid={startMeta.touched && !!startMeta.error}
          errorMessage={startMeta.touched && startMeta.error ? String(startMeta.error) : undefined}
        />
      )}

      {/* Date Range Picker - Multi-day */}
      {isMultiDay && (
        <DateRangePicker
          label="Event Date Range"
          aria-label="Select event date range"
          value={
            startField.value
              ? {
                  start: parseAbsoluteToLocal(startField.value),
                  end: endField.value ? parseAbsoluteToLocal(endField.value) : parseAbsoluteToLocal(startField.value),
                }
              : null
          }
          onChange={handleDateRangeChange}
          granularity={isAllDayField.value ? 'day' : 'minute'}
          hideTimeZone
          isInvalid={hasError}
          errorMessage={errorMessage ? String(errorMessage) : undefined}
        />
      )}
    </div>
  );
};

export default EventDateTimeField;

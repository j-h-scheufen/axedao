'use client';

import { Input, Select, SelectItem } from '@heroui/react';

import { eventTypes } from '@/config/constants';
import type { CreateEventForm, UpdateEventForm } from '@/config/validation-schema';

interface EventTypeAndUrlSectionProps {
  values: CreateEventForm | UpdateEventForm;
  setFieldValue: (field: string, value: unknown) => void;
  setFieldTouched: (field: string, touched: boolean) => void;
}

const EventTypeAndUrlSection = ({ values, setFieldValue, setFieldTouched }: EventTypeAndUrlSectionProps) => {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
      <Select
        label="Event Type"
        placeholder="Select event type"
        selectedKeys={values.type ? [values.type] : []}
        onSelectionChange={(keys) => {
          const selectedKey = Array.from(keys)[0] as string;
          setFieldValue('type', selectedKey);
          setFieldTouched('type', true);
        }}
        isRequired
      >
        {eventTypes.map((type) => (
          <SelectItem key={type}>
            {type === 'general'
              ? 'General'
              : type === 'workshop'
                ? 'Workshop'
                : type === 'batizado'
                  ? 'Batizado'
                  : type === 'public_roda'
                    ? 'Public Roda'
                    : type}
          </SelectItem>
        ))}
      </Select>

      <Input
        label="Event URL (Optional)"
        placeholder="https://example.com"
        value={values.url}
        onChange={(e) => setFieldValue('url', e.target.value)}
        onBlur={() => setFieldTouched('url', true)}
      />
    </div>
  );
};

export default EventTypeAndUrlSection;

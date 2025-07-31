'use client';

import {
  Button,
  Input,
  Modal,
  ModalBody,
  ModalContent,
  ModalFooter,
  ModalHeader,
  Select,
  SelectItem,
  DateRangePicker,
} from '@heroui/react';
import { parseAbsoluteToLocal } from '@internationalized/date';
import type { Feature as MaptilerFeature } from '@maptiler/geocoding-control/types';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useCallback, useRef } from 'react';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import { LocationMap } from '@/components/geocode';
import { FieldInput, FieldTextarea } from '@/components/forms';
import { eventTypes } from '@/config/constants';
import { createEventFormSchema, type CreateEventForm } from '@/config/validation-schema';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';

interface EventModalProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  onSubmit: (data: CreateEventForm) => Promise<void>;
  isSubmitting: boolean;
}

const CreateEventModal = ({ isOpen, onOpenChange, onSubmit, isSubmitting }: EventModalProps) => {
  const setFieldValueRef = useRef<((field: string, value: unknown) => void) | null>(null);

  const initialValues: CreateEventForm = {
    name: '',
    description: '',
    start: new Date().toISOString(), // Use ISO string for form
    end: undefined,
    type: eventTypes[0],
    url: '',
    feature: undefined,
    associatedGroups: [],
    associatedUsers: [],
  };

  const handleSubmit = useCallback(
    async (values: CreateEventForm) => {
      if (!values.feature || !values.start) {
        console.warn('Event submission requires both feature and start date');
        return;
      }

      const data = {
        name: values.name,
        description: values.description || undefined,
        start: values.start,
        end: values.end || undefined,
        type: values.type,
        url: values.url || undefined,
        feature: values.feature,
        associatedGroups: values.associatedGroups || [],
        associatedUsers: values.associatedUsers || [],
      };

      await onSubmit(data);
    },
    [onSubmit]
  );

  const handleClose = useCallback(() => {
    onOpenChange(false);
  }, [onOpenChange]);

  const handleLocationMapSelection = useCallback(
    (feature: Feature<Geometry, GeoJsonProperties>, _coordinates: [number, number]) => {
      if (setFieldValueRef.current) {
        setFieldValueRef.current('feature', feature as MaptilerFeature);
      }
    },
    []
  );

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="4xl">
      <ModalContent>
        <ModalHeader>Create New Event</ModalHeader>
        <Formik<CreateEventForm>
          initialValues={initialValues}
          validationSchema={createEventFormSchema}
          onSubmit={handleSubmit}
          enableReinitialize
        >
          {({
            values,
            dirty,
            isValid,
            isSubmitting: formikIsSubmitting,
            setFieldValue,
            setFieldTouched,
            errors,
            touched,
          }: FormikProps<typeof initialValues>) => {
            const address = values.feature ? getGeoJsonFeatureLabel(values.feature) : '';

            setFieldValueRef.current = setFieldValue;

            return (
              <Form className="flex flex-col gap-2 sm:gap-4">
                <ModalBody>
                  <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    {/* Form Fields */}
                    <div className="flex flex-col h-full gap-4">
                      <div className="flex flex-col gap-2">
                        <Input
                          label="Event Location"
                          value={address}
                          isReadOnly
                          placeholder="Select location using the map"
                        />
                        {!values.feature && (
                          <p className="text-sm text-gray-500">Please select a location using the map</p>
                        )}
                      </div>

                      <Field
                        name="name"
                        label="Event Name"
                        placeholder="Enter event name"
                        isRequired
                        as={FieldInput}
                        onBlur={() => setFieldTouched('name', true)}
                      />

                      <Field
                        name="description"
                        label="Description"
                        placeholder="Enter event description (optional)"
                        as={FieldTextarea}
                        className="lg:flex-1 lg:resize-none"
                      />

                      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                        <DateRangePicker
                          label="Event Date & Time"
                          value={
                            values.start
                              ? {
                                  start: parseAbsoluteToLocal(values.start),
                                  end: values.end
                                    ? parseAbsoluteToLocal(values.end)
                                    : parseAbsoluteToLocal(values.start),
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
                          granularity="day"
                          isInvalid={(touched.start && !!errors.start) || (touched.end && !!errors.end)}
                          errorMessage={
                            (touched.start && errors.start) || (touched.end && errors.end)
                              ? String((touched.start && errors.start) || (touched.end && errors.end))
                              : undefined
                          }
                        />
                      </div>

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
                    </div>

                    {/* Map */}
                    <div className="flex flex-col gap-2">
                      <h3>Select event location using the map</h3>
                      <div className="h-80 rounded-lg overflow-hidden border">
                        <LocationMap initialFeature={null} onSelectionChange={handleLocationMapSelection} />
                      </div>
                    </div>
                  </div>
                </ModalBody>
                <ModalFooter>
                  <Button variant="light" onPress={handleClose}>
                    Cancel
                  </Button>
                  <Button
                    color="primary"
                    type="submit"
                    isLoading={isSubmitting || formikIsSubmitting}
                    isDisabled={!isValid || !dirty}
                  >
                    Create Event
                  </Button>
                </ModalFooter>
              </Form>
            );
          }}
        </Formik>
      </ModalContent>
    </Modal>
  );
};

export default CreateEventModal;

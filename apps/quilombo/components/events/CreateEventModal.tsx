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
  DatePicker,
  Image,
  Switch,
} from '@heroui/react';
import { parseAbsoluteToLocal } from '@internationalized/date';
import type { Feature as MaptilerFeature } from '@maptiler/geocoding-control/types';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useCallback, useRef, useId, useState, useMemo } from 'react';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import { LocationMap } from '@/components/geocode';
import { FieldInput, FieldTextarea } from '@/components/forms';
import { eventTypes } from '@/config/constants';
import { createEventFormSchema, type CreateEventForm } from '@/config/validation-schema';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';

interface EventModalProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  onSubmit: (data: CreateEventForm | FormData) => Promise<void>;
  isSubmitting: boolean;
}

const CreateEventModal = ({ isOpen, onOpenChange, onSubmit, isSubmitting }: EventModalProps) => {
  const setFieldValueRef = useRef<((field: string, value: unknown) => void) | null>(null);
  const setFieldTouchedRef = useRef<((field: string, touched: boolean) => void) | null>(null);
  const imageUploadId = useId();

  const initialValues: CreateEventForm = useMemo(
    () => ({
      name: '',
      description: '',
      start: new Date().toISOString(), // Use ISO string for form
      end: undefined,
      isAllDay: false,
      type: eventTypes[0],
      url: '',
      feature: undefined,
      associatedGroups: [],
      associatedUsers: [],
    }),
    []
  );

  const [selectedImage, setSelectedImage] = useState<File | null>(null);
  const [imagePreview, setImagePreview] = useState<string | null>(null);
  const [isMultiDay, setIsMultiDay] = useState(false);

  const handleSubmit = useCallback(
    async (values: CreateEventForm) => {
      if (!values.start) {
        console.warn('Event submission requires start date');
        return;
      }

      const formData = new FormData();

      // Add form fields
      formData.append('name', values.name);
      formData.append('description', values.description || '');
      formData.append('start', values.start);
      // Only include end date if it's a multi-day event
      if (isMultiDay && values.end) {
        formData.append('end', values.end);
      }
      formData.append('isAllDay', values.isAllDay.toString());
      formData.append('type', values.type);
      if (values.url) formData.append('url', values.url);
      formData.append('feature', JSON.stringify(values.feature));
      formData.append('associatedGroups', JSON.stringify(values.associatedGroups || []));
      formData.append('associatedUsers', JSON.stringify(values.associatedUsers || []));

      // Add image if selected
      if (selectedImage) {
        formData.append('image', selectedImage);
      }

      await onSubmit(formData);
    },
    [onSubmit, selectedImage, isMultiDay]
  );

  const handleClose = useCallback(() => {
    onOpenChange(false);
  }, [onOpenChange]);

  const handleLocationMapSelection = useCallback(
    (feature: Feature<Geometry, GeoJsonProperties>, _coordinates: [number, number]) => {
      if (setFieldValueRef.current) {
        setFieldValueRef.current('feature', feature as MaptilerFeature);
        // Mark the field as touched when user selects a location
        if (setFieldTouchedRef.current) {
          setFieldTouchedRef.current('feature', true);
        }
      }
    },
    []
  );

  const handleImageChange = useCallback((event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file) {
      setSelectedImage(file);
      const reader = new FileReader();
      reader.onload = (e) => {
        setImagePreview(e.target?.result as string);
      };
      reader.readAsDataURL(file);
    }
  }, []);

  const handleRemoveImage = useCallback(() => {
    setSelectedImage(null);
    setImagePreview(null);
  }, []);

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="4xl">
      <ModalContent>
        <ModalHeader>Create New Event</ModalHeader>
        <Formik<CreateEventForm>
          initialValues={initialValues}
          validationSchema={createEventFormSchema}
          onSubmit={handleSubmit}
          enableReinitialize={false}
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
            setFieldTouchedRef.current = setFieldTouched;

            return (
              <Form className="flex flex-col gap-2 sm:gap-4">
                <ModalBody className="lg:max-h-none lg:overflow-visible max-h-[80vh] overflow-y-auto">
                  <div className="flex flex-col lg:flex-row gap-6">
                    {/* Form Fields */}
                    <div className="flex flex-col gap-4 lg:w-1/2">
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

                      <div className="flex flex-col gap-4">
                        {/* Multi-day Toggle */}
                        <div className="flex items-center gap-4">
                          <div className="flex items-center gap-2">
                            <Switch
                              isSelected={isMultiDay}
                              onValueChange={setIsMultiDay}
                              aria-label="Toggle multi-day event"
                            />
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

                      {/* Image Upload */}
                      <div className="flex flex-col gap-2">
                        <div className="flex items-center gap-4">
                          <input
                            type="file"
                            accept="image/*"
                            onChange={handleImageChange}
                            className="hidden"
                            id={imageUploadId}
                          />
                          <label
                            htmlFor={imageUploadId}
                            className="cursor-pointer px-4 py-2 bg-default-100 hover:bg-default-200 rounded-lg text-sm font-medium transition-colors"
                          >
                            Choose Event Image (Optional)
                          </label>
                          {selectedImage && (
                            <Button size="sm" variant="light" color="danger" onPress={handleRemoveImage}>
                              Remove
                            </Button>
                          )}
                        </div>
                        {imagePreview && (
                          <div className="mt-2">
                            <Image
                              src={imagePreview}
                              alt="Event preview"
                              className="w-32 h-32 object-cover rounded-lg"
                            />
                          </div>
                        )}
                      </div>
                    </div>

                    {/* Location Section */}
                    <div className="flex flex-col gap-4 lg:w-1/2">
                      {/* Location Display */}
                      <Input
                        label="Event Location"
                        value={address}
                        isReadOnly
                        isRequired
                        isInvalid={!values.feature && touched.feature}
                        errorMessage={
                          !values.feature && touched.feature ? 'Please select a location using the map' : undefined
                        }
                        placeholder="Select location using the map"
                        onBlur={() => setFieldTouched('feature', true)}
                      />

                      {/* Map */}
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

'use client';

import { Button, Card, CardBody, CardFooter } from '@heroui/react';
import type { Feature as MaptilerFeature } from '@maptiler/geocoding-control/types';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useCallback, useRef, useId, useState, useMemo } from 'react';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import { FieldInput, FieldTextarea } from '@/components/forms';
import { eventTypes } from '@/config/constants';
import { updateEventFormSchema, type UpdateEventForm } from '@/config/validation-schema';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';
import type { ZonedEvent } from '@/types/model';
import { EventDateTimeSection, EventTypeAndUrlSection, EventImageUploadSection, EventLocationSection } from './shared';
import { getImageUrl } from '@/utils';

interface EditEventFormProps {
  initialEvent: ZonedEvent;
  onSubmit: (data: UpdateEventForm | FormData) => Promise<void>;
  isSubmitting: boolean;
  onDelete: () => Promise<void>;
  isDeleting: boolean;
}

const EditEventForm = ({ initialEvent, onSubmit, isSubmitting, onDelete, isDeleting }: EditEventFormProps) => {
  const setFieldValueRef = useRef<((field: string, value: unknown) => void) | null>(null);
  const setFieldTouchedRef = useRef<((field: string, touched: boolean) => void) | null>(null);
  const imageUploadId = useId();

  const initialValues: UpdateEventForm = useMemo(
    () => ({
      name: initialEvent.name || '',
      description: initialEvent.description || '',
      start: initialEvent.start ? initialEvent.start.toDate().toISOString() : new Date().toISOString(),
      end: initialEvent.end ? initialEvent.end.toDate().toISOString() : undefined,
      isAllDay: initialEvent.isAllDay || false,
      type: initialEvent.type || eventTypes[0],
      url: initialEvent.url || '',
      feature: initialEvent.feature,
      associatedGroups: initialEvent.associatedGroups || [],
      associatedUsers: initialEvent.associatedUsers || [],
      imageChanged: false, // Track if image was changed
    }),
    [initialEvent]
  );

  const [selectedImage, setSelectedImage] = useState<File | null>(null);
  const [imagePreview, setImagePreview] = useState<string | null>(
    initialEvent.image ? getImageUrl(initialEvent.image) || null : null
  );
  const [isMultiDay, setIsMultiDay] = useState(!!initialEvent.end);

  const handleSubmit = useCallback(
    async (values: UpdateEventForm) => {
      if (!values.start) {
        console.warn('Event submission requires start date');
        return;
      }

      const formData = new FormData();

      // Add form fields
      formData.append('name', values.name || '');
      formData.append('description', values.description || '');
      formData.append('start', values.start || '');
      // Only include end date if it's a multi-day event
      if (isMultiDay && !!values.end) {
        formData.append('end', values.end);
      }
      formData.append('isAllDay', (values.isAllDay || false).toString());
      formData.append('type', values.type || '');
      if (values.url?.trim()) formData.append('url', values.url.trim());
      if (values.feature) formData.append('feature', JSON.stringify(values.feature));
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

  const handleLocationMapSelection = useCallback(
    (feature: Feature<Geometry, GeoJsonProperties>, _coordinates: [number, number]) => {
      if (setFieldValueRef.current) {
        setFieldValueRef.current('feature', feature as MaptilerFeature);
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
      // Mark image as changed in Formik
      if (setFieldValueRef.current) {
        setFieldValueRef.current('imageChanged', true);
      }
    }
  }, []);

  const handleRemoveImage = useCallback(() => {
    setSelectedImage(null);
    setImagePreview(null);
    // Mark image as changed in Formik
    if (setFieldValueRef.current) {
      setFieldValueRef.current('imageChanged', true);
    }
  }, []);

  return (
    <Formik<UpdateEventForm>
      initialValues={initialValues}
      validationSchema={updateEventFormSchema}
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
          <Card>
            <Form className="flex flex-col gap-2 sm:gap-4">
              <CardBody>
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

                    <EventDateTimeSection
                      values={values}
                      touched={touched}
                      errors={errors}
                      isMultiDay={isMultiDay}
                      setIsMultiDay={setIsMultiDay}
                      setFieldValue={setFieldValue}
                      setFieldTouched={setFieldTouched}
                    />

                    <EventTypeAndUrlSection
                      values={values}
                      setFieldValue={setFieldValue}
                      setFieldTouched={setFieldTouched}
                    />

                    <EventImageUploadSection
                      selectedImage={selectedImage}
                      imagePreview={imagePreview}
                      imageUploadId={imageUploadId}
                      handleImageChange={handleImageChange}
                      handleRemoveImage={handleRemoveImage}
                    />
                  </div>

                  {/* Location Section */}
                  <div className="flex flex-col gap-4 lg:w-1/2">
                    <EventLocationSection
                      address={address}
                      values={values}
                      touched={touched}
                      errors={errors}
                      setFieldTouched={setFieldTouched}
                      handleLocationMapSelection={handleLocationMapSelection}
                    />
                  </div>
                </div>
              </CardBody>
              <CardFooter className="flex justify-between">
                <Button color="danger" variant="light" onPress={onDelete} isLoading={isDeleting}>
                  Delete Event
                </Button>
                <div className="flex gap-2 ml-auto">
                  <Button
                    color="primary"
                    type="submit"
                    isLoading={isSubmitting || formikIsSubmitting}
                    isDisabled={!isValid || !dirty}
                  >
                    Update Event
                  </Button>
                </div>
              </CardFooter>
            </Form>
          </Card>
        );
      }}
    </Formik>
  );
};

export default EditEventForm;

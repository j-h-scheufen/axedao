'use client';

import { Button, Card, CardBody, CardFooter } from '@heroui/react';
import type { Feature as MaptilerFeature } from '@maptiler/geocoding-control/types';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useCallback, useId, useState, useMemo } from 'react';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import { FieldInput, FieldTextarea } from '@/components/forms';
import { createEventFormSchema, type CreateEventForm } from '@/config/validation-schema';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';
import { EventDateTimeSection, EventTypeAndUrlSection, EventImageUploadSection, EventLocationSection } from './shared';
import { eventTypes } from '@/config/constants';

interface CreateEventFormProps {
  onSubmit: (data: CreateEventForm | FormData) => Promise<void>;
  isSubmitting: boolean;
}

const CreateEventFormComponent = ({ onSubmit, isSubmitting }: CreateEventFormProps) => {
  const imageUploadId = useId();

  const initialValues: CreateEventForm = useMemo(
    () => ({
      name: '',
      description: '',
      start: new Date().toISOString(),
      end: undefined,
      isAllDay: false,
      type: eventTypes[0],
      url: '',
      feature: undefined,
      associatedGroups: [],
      associatedUsers: [],
      imageChanged: false, // Track if image was changed
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
      if (isMultiDay && !!values.end) {
        formData.append('end', values.end);
      }
      formData.append('isAllDay', (values.isAllDay || false).toString());
      formData.append('type', values.type);
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

  return (
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

        const handleLocationMapSelection = (
          feature: Feature<Geometry, GeoJsonProperties>,
          _coordinates: [number, number]
        ) => {
          setFieldValue('feature', feature as MaptilerFeature);
          setFieldTouched('feature', true);
        };

        const handleImageChangeLocal = (event: React.ChangeEvent<HTMLInputElement>) => {
          const file = event.target.files?.[0];
          if (file) {
            setSelectedImage(file);
            const reader = new FileReader();
            reader.onload = (e) => {
              setImagePreview(e.target?.result as string);
            };
            reader.readAsDataURL(file);
            // Mark image as changed in Formik
            setFieldValue('imageChanged', true);
          }
        };

        const handleRemoveImageLocal = () => {
          setSelectedImage(null);
          setImagePreview(null);
          // Mark image as changed in Formik
          setFieldValue('imageChanged', true);
        };

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
                      handleImageChange={handleImageChangeLocal}
                      handleRemoveImage={handleRemoveImageLocal}
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
              <CardFooter className="flex justify-end">
                <Button
                  color="primary"
                  type="submit"
                  isLoading={isSubmitting || formikIsSubmitting}
                  isDisabled={!isValid || !dirty}
                >
                  Create Event
                </Button>
              </CardFooter>
            </Form>
          </Card>
        );
      }}
    </Formik>
  );
};

export default CreateEventFormComponent;

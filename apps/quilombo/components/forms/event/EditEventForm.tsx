'use client';

import { Button, Card, CardBody, CardFooter } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useCallback, useId, useState, useMemo } from 'react';

import {
  FieldInput,
  FieldTextarea,
  EventDateTimeField,
  EventLocationField,
  EventTypeField,
  EventUrlField,
} from '@/components/forms';
import { eventTypes } from '@/config/constants';
import { updateEventFormSchema, type UpdateEventForm } from '@/config/validation-schema';

import type { ZonedEvent } from '@/types/model';
import { EventImageUploadSection } from './shared';
import { getImageUrl } from '@/utils';

interface EditEventFormProps {
  initialEvent: ZonedEvent;
  onSubmit: (data: UpdateEventForm | FormData) => Promise<void>;
  isSubmitting: boolean;
  onDelete: () => Promise<void>;
  isDeleting: boolean;
}

const EditEventForm = ({ initialEvent, onSubmit, isSubmitting, onDelete, isDeleting }: EditEventFormProps) => {
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
      // Only include end date if it exists
      if (values.end) {
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
    [onSubmit, selectedImage]
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

                    <Field
                      name="dateTime"
                      as={EventDateTimeField}
                      startFieldName="start"
                      endFieldName="end"
                      isAllDayFieldName="isAllDay"
                    />

                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                      <Field name="type" as={EventTypeField} />
                      <Field name="url" as={EventUrlField} />
                    </div>

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
                    <Field name="feature" as={EventLocationField} />
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

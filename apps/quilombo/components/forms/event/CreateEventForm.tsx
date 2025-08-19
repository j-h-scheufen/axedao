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
import { createEventFormSchema, type CreateEventForm as CreateEventFormType } from '@/config/validation-schema';
import { EventImageUploadSection } from './shared';
import { eventTypes } from '@/config/constants';

interface CreateEventFormProps {
  onSubmit: (data: CreateEventFormType | FormData) => Promise<void>;
  isSubmitting: boolean;
}

const CreateEventForm = ({ onSubmit, isSubmitting }: CreateEventFormProps) => {
  const imageUploadId = useId();

  const initialValues: CreateEventFormType = useMemo(
    () => ({
      name: '',
      description: '',
      start: new Date().toISOString(),
      end: undefined,
      isAllDay: true,
      type: eventTypes[0],
      url: '',
      feature: undefined,
      associatedGroups: [],
      associatedUsers: [],
      imageChanged: false,
    }),
    []
  );

  const [selectedImage, setSelectedImage] = useState<File | null>(null);
  const [imagePreview, setImagePreview] = useState<string | null>(null);

  const handleSubmit = useCallback(
    async (values: CreateEventFormType) => {
      if (!values.start) {
        console.warn('Event submission requires start date');
        return;
      }

      const formData = new FormData();

      // Add form fields
      formData.append('name', values.name);
      formData.append('description', values.description || '');
      formData.append('start', values.start);
      if (values.end) {
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
    [onSubmit, selectedImage]
  );

  const handleImageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file) {
      setSelectedImage(file);
      const reader = new FileReader();
      reader.onload = (e) => {
        setImagePreview(e.target?.result as string);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleRemoveImage = () => {
    setSelectedImage(null);
    setImagePreview(null);
  };

  return (
    <Formik<CreateEventFormType>
      initialValues={initialValues}
      validationSchema={createEventFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize={false}
    >
      {({ dirty, isValid, isSubmitting: formikIsSubmitting }: FormikProps<typeof initialValues>) => {
        return (
          <Card>
            <Form className="flex flex-col gap-2 sm:gap-4">
              <CardBody>
                <div className="flex flex-col lg:flex-row gap-6">
                  {/* Form Fields */}
                  <div className="flex flex-col gap-4 lg:w-1/2">
                    <Field name="name" label="Event Name" placeholder="Enter event name" isRequired as={FieldInput} />

                    <Field
                      name="description"
                      label="Description"
                      placeholder="Enter event description (optional)"
                      as={FieldTextarea}
                      className="lg:flex-1 lg:resize-none"
                    />

                    {/* Using the new Formik-integrated field components */}
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

export default CreateEventForm;

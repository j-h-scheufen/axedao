'use client';

import { Button, Input, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import type { Feature as MaptilerFeature } from '@maptiler/geocoding-control/types';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { useCallback, useRef } from 'react';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import { LocationMap } from '@/components/geocode';
import { FieldInput, FieldTextarea } from '@/components/forms';
import {
  createLocationFormSchema,
  updateLocationFormSchema,
  type CreateLocationForm,
  type UpdateLocationForm,
} from '@/config/validation-schema';
import type { GroupLocation } from '@/types/model';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';

interface LocationModalProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  savedLocation: GroupLocation | null;
  onSubmit: (data: CreateLocationForm | UpdateLocationForm) => Promise<void>;
  isSubmitting: boolean;
}

const LocationModal = ({ isOpen, onOpenChange, savedLocation, onSubmit, isSubmitting }: LocationModalProps) => {
  const isEditing = !!location;
  const setFieldValueRef = useRef<((field: string, value: unknown) => void) | null>(null);

  const initialValues: UpdateLocationForm = {
    name: savedLocation?.name || '',
    description: savedLocation?.description || '',
    feature: savedLocation?.feature || undefined,
  };

  const handleSubmit = useCallback(
    async (values: UpdateLocationForm) => {
      if (!values.feature) {
        return; // Form validation will prevent submission
      }

      const data = {
        name: values.name,
        description: values.description || undefined,
        feature: values.feature,
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
        // Cast back to MaptilerFeature since that's what we store
        setFieldValueRef.current('feature', feature as MaptilerFeature);
      }
    },
    []
  );

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="3xl">
      <ModalContent>
        <ModalHeader>{isEditing ? 'Edit Location' : 'Add Location'}</ModalHeader>
        <Formik<UpdateLocationForm>
          initialValues={initialValues}
          validationSchema={isEditing ? updateLocationFormSchema : createLocationFormSchema}
          onSubmit={handleSubmit}
          enableReinitialize
        >
          {({
            values,
            dirty,
            isValid,
            isSubmitting: formikIsSubmitting,
            setFieldValue,
          }: FormikProps<typeof initialValues>) => {
            const address = getGeoJsonFeatureLabel(values.feature);

            // Update the ref with the current setFieldValue
            setFieldValueRef.current = setFieldValue;

            return (
              <Form className="flex flex-col gap-2 sm:gap-4">
                <ModalBody>
                  <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    {/* Form Fields */}
                    <div className="flex flex-col h-full gap-4">
                      <div className="flex flex-col gap-2">
                        <Input
                          label="Saved Address"
                          value={address}
                          isReadOnly
                          placeholder="Select address using the map"
                        />
                        {!values.feature && (
                          <p className="text-sm text-gray-500">Please select an address using the map</p>
                        )}
                      </div>

                      <Field
                        name="name"
                        label="Location Name"
                        placeholder="Enter location name"
                        isRequired
                        as={FieldInput}
                      />

                      <Field
                        name="description"
                        label="Description"
                        placeholder="Enter location description (optional)"
                        as={FieldTextarea}
                        className="lg:flex-1 lg:resize-none"
                      />
                    </div>

                    {/* Map */}
                    <div className="flex flex-col gap-2">
                      <h3>Select a new location using the map</h3>
                      <div className="h-80 rounded-lg overflow-hidden border">
                        <LocationMap
                          initialFeature={savedLocation?.feature as Feature<Geometry, GeoJsonProperties> | null}
                          onSelectionChange={handleLocationMapSelection}
                        />
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
                    isDisabled={!isValid || !values.feature || !dirty}
                  >
                    {isEditing ? 'Save' : 'Submit'}
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

export default LocationModal;

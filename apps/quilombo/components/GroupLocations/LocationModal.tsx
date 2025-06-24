'use client';

import { Button, Input, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, Textarea } from '@heroui/react';
import type { Feature as MaptilerFeature } from '@maptiler/geocoding-control/types';
import { useFormik } from 'formik';
import { useCallback, useEffect, useState } from 'react';
import * as yup from 'yup';

import { LocationMap } from '@/components/geocode';
import type { CreateLocationForm, UpdateLocationForm } from '@/config/validation-schema';
import type { GroupLocation } from '@/types/model';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';

interface LocationModalProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  location: GroupLocation | null;
  onSubmit: (data: CreateLocationForm | UpdateLocationForm) => Promise<void>;
  isSubmitting: boolean;
}

const locationSchema = yup.object({
  name: yup.string().required('Location name is required'),
  description: yup.string().optional(),
});

const LocationModal = ({ isOpen, onOpenChange, location, onSubmit, isSubmitting }: LocationModalProps) => {
  const isEditing = !!location;
  const [selectedFeature, setSelectedFeature] = useState<MaptilerFeature | null>(
    location?.feature ? (location.feature as MaptilerFeature) : null
  );

  const formik = useFormik({
    initialValues: {
      name: location?.name || '',
      description: location?.description || '',
    },
    validationSchema: locationSchema,
    onSubmit: async (values) => {
      if (!selectedFeature) {
        return; // Form validation will prevent submission
      }

      // Preserve the original MaptilerFeature structure - it's already a valid GeoJSON Feature
      const data = {
        name: values.name,
        description: values.description || undefined,
        feature: selectedFeature,
      };

      await onSubmit(data);
    },
    enableReinitialize: true,
  });

  const handleMapSelection = useCallback((feature: MaptilerFeature, coordinates: [number, number]) => {
    setSelectedFeature(feature);
  }, []);

  const handleClose = useCallback(() => {
    formik.resetForm();
    setSelectedFeature(null);
    onOpenChange(false);
  }, [formik, onOpenChange]);

  useEffect(() => {
    if (!isOpen) {
      formik.resetForm();
      setSelectedFeature(null);
    }
  }, [isOpen]);

  const address = getGeoJsonFeatureLabel(selectedFeature);

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="3xl">
      <ModalContent>
        <ModalHeader>{isEditing ? 'Edit Location' : 'Add Location'}</ModalHeader>
        <form onSubmit={formik.handleSubmit}>
          <ModalBody>
            <div className="space-y-6">
              <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                {/* Form Fields */}
                <div className="space-y-4">
                  <Input
                    label="Location Name"
                    placeholder="Enter location name"
                    value={formik.values.name}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    name="name"
                    isInvalid={formik.touched.name && !!formik.errors.name}
                    errorMessage={formik.touched.name && formik.errors.name}
                    isRequired
                  />

                  <Textarea
                    label="Description"
                    placeholder="Enter location description (optional)"
                    value={formik.values.description}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    name="description"
                    isInvalid={formik.touched.description && !!formik.errors.description}
                    errorMessage={formik.touched.description && formik.errors.description}
                  />

                  <div className="space-y-2">
                    <Input label="Address" value={address} isReadOnly placeholder="Select address from map" />
                    {!selectedFeature && (
                      <p className="text-sm text-gray-500">Please select an address using the map</p>
                    )}
                  </div>
                </div>

                {/* Map */}
                <div className="space-y-2">
                  <h3 className="text-sm font-medium">Select Location on Map</h3>
                  <div className="h-80 rounded-lg overflow-hidden border">
                    <LocationMap initialFeature={selectedFeature} onSelectionChange={handleMapSelection} />
                  </div>
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
              isLoading={isSubmitting}
              isDisabled={!formik.isValid || !selectedFeature}
            >
              {isEditing ? 'Save' : 'Submit'}
            </Button>
          </ModalFooter>
        </form>
      </ModalContent>
    </Modal>
  );
};

export default LocationModal;

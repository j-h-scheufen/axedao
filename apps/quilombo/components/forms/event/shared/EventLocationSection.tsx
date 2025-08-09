'use client';

import { Input } from '@heroui/react';
import type { FormikProps } from 'formik';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import { LocationMap } from '@/components/geocode';
import type { CreateEventForm, UpdateEventForm } from '@/config/validation-schema';

interface EventLocationSectionProps {
  address: string;
  values: CreateEventForm | UpdateEventForm;
  touched: FormikProps<CreateEventForm | UpdateEventForm>['touched'];
  errors: FormikProps<CreateEventForm | UpdateEventForm>['errors'];
  setFieldTouched: (field: string, touched: boolean) => void;
  handleLocationMapSelection: (feature: Feature<Geometry, GeoJsonProperties>, coordinates: [number, number]) => void;
}

const EventLocationSection = ({
  address,
  values,
  touched,
  errors,
  setFieldTouched,
  handleLocationMapSelection,
}: EventLocationSectionProps) => {
  return (
    <>
      {/* Location Display */}
      <Input
        label="Event Location"
        value={address}
        isReadOnly
        isRequired
        isInvalid={!values.feature && touched.feature}
        errorMessage={!values.feature && touched.feature ? 'Please select a location using the map' : undefined}
        placeholder="Select location using the map"
        onBlur={() => setFieldTouched('feature', true)}
      />

      {/* Map */}
      <div className="h-80 rounded-lg overflow-hidden border">
        <LocationMap initialFeature={values.feature || null} onSelectionChange={handleLocationMapSelection} />
      </div>
    </>
  );
};

export default EventLocationSection;

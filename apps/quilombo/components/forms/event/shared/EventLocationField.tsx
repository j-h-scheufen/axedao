'use client';

import { Input } from '@heroui/react';
import { type FieldProps, useField } from 'formik';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import { LocationMap } from '@/components/geocode';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';

/**
 * A Formik Field component for handling event location selection.
 * Integrates with Formik's validation system and automatically handles feature updates.
 * Usage: <Field name="feature" as={EventLocationField} />
 */
const EventLocationField = (props: FieldProps['field']) => {
  const [field, meta, helpers] = useField(props);

  const address = field.value ? getGeoJsonFeatureLabel(field.value) : '';

  const handleLocationMapSelection = (
    feature: Feature<Geometry, GeoJsonProperties>,
    _coordinates: [number, number]
  ) => {
    helpers.setValue(feature);
    // Don't manually set touched - let Formik handle it
  };

  return (
    <>
      {/* Location Display */}
      <Input
        label="Event Location"
        value={address}
        isReadOnly
        isRequired
        isInvalid={meta.touched && !!meta.error}
        errorMessage={meta.touched && meta.error ? String(meta.error) : undefined}
        placeholder="Select location using the map"
      />

      {/* Map */}
      <div className="h-80 rounded-lg overflow-hidden border">
        <LocationMap initialFeature={field.value || null} onSelectionChange={handleLocationMapSelection} />
      </div>
    </>
  );
};

export default EventLocationField;

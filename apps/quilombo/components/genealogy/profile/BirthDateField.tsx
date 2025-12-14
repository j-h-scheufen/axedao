'use client';

import { Select, SelectItem } from '@heroui/react';
import { Field, type FieldProps } from 'formik';

import type { GenealogyProfileForm } from '@/config/validation-schema';

// UI precision options
const precisionOptions = [
  { key: 'decade', label: 'Decade' },
  { key: 'year', label: 'Year' },
] as const;

/**
 * Birth year fields with precision selector (Decade or Year).
 * Maps to DB fields: birthYear (integer) + birthYearPrecision (enum)
 */
const BirthDateFields = () => {
  // Generate decades from 1930 to current decade (dynamically)
  const currentDecade = Math.floor(new Date().getFullYear() / 10) * 10;
  const decades = Array.from({ length: (currentDecade - 1930) / 10 + 1 }, (_, i) => 1930 + i * 10);

  // Generate years dynamically from 1930 to current year (descending)
  const thisYear = new Date().getFullYear();
  const years = Array.from({ length: thisYear - 1930 + 1 }, (_, i) => thisYear - i);

  return (
    <div className="flex flex-col sm:flex-row gap-3">
      {/* Precision selector */}
      <Field name="birthYearPrecision">
        {({ field, form, meta }: FieldProps<string, GenealogyProfileForm>) => {
          const selectedKeys = field.value ? [field.value] : [];

          return (
            <Select
              {...field}
              label="Birth Precision"
              placeholder="Select"
              selectedKeys={selectedKeys}
              onSelectionChange={(keys) => {
                const value = Array.from(keys)[0]?.toString() || '';
                form.setFieldValue('birthYearPrecision', value);
                form.setFieldValue('birthYear', '');
              }}
              className="sm:flex-1"
              isInvalid={meta.touched && !!meta.error}
              errorMessage={meta.touched && meta.error ? meta.error : undefined}
            >
              {precisionOptions.map((p) => (
                <SelectItem key={p.key}>{p.label}</SelectItem>
              ))}
            </Select>
          );
        }}
      </Field>

      {/* Year/Decade value selector */}
      <Field name="birthYear">
        {({ field, form, meta }: FieldProps<string, GenealogyProfileForm>) => {
          const precision = form.values.birthYearPrecision;
          const selectedKeys = field.value ? [field.value] : [];

          if (!precision) return null;

          const items = precision === 'decade' ? decades : years;
          const label = precision === 'decade' ? 'Decade' : 'Year';

          return (
            <Select
              {...field}
              label={label}
              placeholder="Select"
              selectedKeys={selectedKeys}
              onSelectionChange={(keys) => {
                const value = Array.from(keys)[0]?.toString() || '';
                form.setFieldValue('birthYear', value);
              }}
              className="sm:flex-1"
              isInvalid={meta.touched && !!meta.error}
              errorMessage={meta.touched && meta.error ? meta.error : undefined}
            >
              {items.map((item) => (
                <SelectItem key={String(item)}>{precision === 'decade' ? `${item}s` : String(item)}</SelectItem>
              ))}
            </Select>
          );
        }}
      </Field>
    </div>
  );
};

export default BirthDateFields;

'use client';

import { Card, CardBody, CardHeader, Divider, Select, SelectItem, Textarea } from '@heroui/react';
import { FieldArray, useField, useFormikContext } from 'formik';

import { LinksArray } from '@/components/forms';
import { styles } from '@/config/constants';
import type { GenealogyProfileForm } from '@/config/validation-schema';

/**
 * Section for genealogy-only fields (not synced from user profile).
 * Includes style, bio (EN/PT), and public links.
 */
const GenealogyFieldsSection = () => {
  const { values, setFieldValue } = useFormikContext<GenealogyProfileForm>();
  const [styleField, styleMeta] = useField('style');
  const [bioEnField, bioEnMeta] = useField('bioEn');
  const [bioPtField, bioPtMeta] = useField('bioPt');

  return (
    <Card>
      <CardHeader>
        <div className="flex flex-col">
          <p className="text-md font-semibold">Genealogy Details</p>
          <p className="text-small text-default-500">Additional information for the public genealogy record</p>
        </div>
      </CardHeader>
      <Divider />
      <CardBody className="gap-4">
        {/* Style */}
        <Select
          {...styleField}
          label="Capoeira Style"
          placeholder="Select your style"
          selectedKeys={styleField.value ? [styleField.value] : []}
          onSelectionChange={(keys) => {
            const value = Array.from(keys)[0] as string;
            setFieldValue('style', value || null);
          }}
          classNames={{ trigger: 'capitalize' }}
          isInvalid={styleMeta.touched && !!styleMeta.error}
          errorMessage={styleMeta.touched && styleMeta.error ? styleMeta.error : undefined}
        >
          {styles.map((style) => (
            <SelectItem key={style} className="capitalize">
              {style}
            </SelectItem>
          ))}
        </Select>

        {/* Bio (English) */}
        <Textarea
          {...bioEnField}
          label="Biography (English)"
          placeholder="Share your capoeira journey..."
          minRows={3}
          maxRows={8}
          description="Tell your story for the international community"
          isInvalid={bioEnMeta.touched && !!bioEnMeta.error}
          errorMessage={bioEnMeta.touched && bioEnMeta.error ? bioEnMeta.error : undefined}
        />

        {/* Bio (Portuguese) */}
        <Textarea
          {...bioPtField}
          label="Biografia (Português)"
          placeholder="Compartilhe sua jornada na capoeira..."
          minRows={3}
          maxRows={8}
          description="Conte sua história para a comunidade brasileira"
          isInvalid={bioPtMeta.touched && !!bioPtMeta.error}
          errorMessage={bioPtMeta.touched && bioPtMeta.error ? bioPtMeta.error : undefined}
        />

        {/* Public Links */}
        <div className="space-y-2">
          <p className="text-sm font-medium">Public Links</p>
          <p className="text-xs text-default-500">
            Add links to Wikipedia articles, interviews, documentaries, or other public references
          </p>
          <FieldArray name="publicLinks">
            {(helpers) => (
              <LinksArray links={values.publicLinks} actions={{ remove: helpers.remove, add: helpers.push }} />
            )}
          </FieldArray>
        </div>
      </CardBody>
    </Card>
  );
};

export default GenealogyFieldsSection;

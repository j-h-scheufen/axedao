'use client';

import { Button, Switch, Textarea } from '@heroui/react';
import { Field, FieldArray, type FieldProps, Form, Formik, type FormikProps } from 'formik';
import { useAtomValue } from 'jotai';
import { useRouter } from 'next/navigation';
import { useCallback, useState } from 'react';

import { FieldInput, LinksArray, StringSelect, UrlArray } from '@/components/forms';
import GroupFormSkeleton from '@/components/skeletons/GroupSkeletons';
import SubsectionHeading from '@/components/SubsectionHeading';
import { PATHS, styles } from '@/config/constants';
import { type GroupEditForm, groupEditFormSchema } from '@/config/validation-schema';
import { groupAtom, isCurrentUserGroupAdminAtom } from '@/hooks/state/group';
import { currentUserIsGlobalAdminAtom } from '@/hooks/state/currentUser';
import { useDeleteGroup, useUpdateGroup } from '@/hooks/useGroup';
import { useGenealogyGroupProfile } from '@/query/genealogyProfile';
import { DeleteGroup } from '.';

/**
 * Combined form for editing both genealogy profile and operational group data.
 * Group admins use this single form to manage all group settings.
 */
const GroupForm = () => {
  const { data: group, isFetching: isFetchingGroup } = useAtomValue(groupAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const isGlobalAdmin = useAtomValue(currentUserIsGlobalAdminAtom);
  const router = useRouter();
  const { deleteGroup, isPending: isPendingDelete } = useDeleteGroup();
  const { updateGroup, isPending: isPendingUpdate } = useUpdateGroup();
  const [errorMessage, setErrorMessage] = useState<string | null>(null);

  // Fetch the full genealogy profile for extended fields
  const { data: genealogyProfile, isFetching: isFetchingProfile } = useGenealogyGroupProfile(group?.profileId);

  const handleDeleteGroup = useCallback(async () => {
    if (!group) return;
    return deleteGroup(group.id).then(() => router.push(PATHS.profile));
  }, [group, deleteGroup, router]);

  const handleSubmit = useCallback(
    async (values: GroupEditForm) => {
      if (!group || !group.profileId) return;

      setErrorMessage(null);

      try {
        // Single API call that updates both genealogy.group_profiles and public.groups
        await updateGroup({
          groupId: group.id,
          data: values,
        });

        router.push(`${PATHS.groups}/${group.id}`);
      } catch (error) {
        console.error('Error updating group:', error);
        setErrorMessage(error instanceof Error ? error.message : 'Failed to update group');
      }
    },
    [router, updateGroup, group]
  );

  const isFetching = isFetchingGroup || isFetchingProfile;
  if (!group || isFetching) return <GroupFormSkeleton />;

  // Groups without profileId shouldn't reach this page (handled by page component)
  if (!group.profileId) {
    return (
      <div className="text-danger-500">This group doesn&apos;t have a genealogy profile. Please contact support.</div>
    );
  }

  const isUnmanaged = group.adminCount === 0;
  const canDeleteAsGlobalAdmin = isGlobalAdmin && isUnmanaged;
  const canDelete = isGroupAdmin || canDeleteAsGlobalAdmin;

  // Combine data from both sources for initial values
  const initialValues: GroupEditForm = {
    // Identity fields from genealogy profile
    name: genealogyProfile?.name || group.name || '',
    style: genealogyProfile?.style || group.style || '',
    descriptionEn: genealogyProfile?.descriptionEn || '',
    descriptionPt: genealogyProfile?.descriptionPt || '',
    philosophyEn: genealogyProfile?.philosophyEn || '',
    philosophyPt: genealogyProfile?.philosophyPt || '',
    historyEn: genealogyProfile?.historyEn || '',
    historyPt: genealogyProfile?.historyPt || '',
    publicLinks: genealogyProfile?.publicLinks || [],
    isActive: genealogyProfile?.isActive ?? true,
    // Operational fields from public.groups
    email: group.email || '',
    links: group.links || [],
  };

  const isPending = isPendingUpdate;

  return (
    <Formik<GroupEditForm>
      initialValues={initialValues}
      validationSchema={groupEditFormSchema}
      onSubmit={handleSubmit}
      enableReinitialize
    >
      {({ values, dirty, isValid, isSubmitting, setFieldValue }: FormikProps<GroupEditForm>) => (
        <Form className="flex flex-col gap-6">
          {/* Error Message */}
          {errorMessage && (
            <div className="bg-danger-50 border border-danger-200 rounded-lg p-4">
              <p className="text-danger-700 text-sm">{errorMessage}</p>
            </div>
          )}

          {/* Basic Info Section */}
          <section className="space-y-4">
            <SubsectionHeading>Basic Information</SubsectionHeading>
            <Field name="name" label="Group Name" placeholder="Enter group name" as={FieldInput} />
            <Field name="style" label="Style" as={StringSelect} options={styles} />
            <Field name="email" label="Contact Email" type="email" placeholder="group@example.com" as={FieldInput} />
            <div className="flex items-center gap-4">
              <Switch isSelected={values.isActive} onValueChange={(v) => setFieldValue('isActive', v)}>
                Group is Active
              </Switch>
              <span className="text-default-500 text-sm">
                {values.isActive ? 'The group is currently active' : 'The group is no longer active'}
              </span>
            </div>
          </section>

          {/* Descriptions Section */}
          <section className="space-y-4">
            <SubsectionHeading>Descriptions</SubsectionHeading>
            <p className="text-default-500 text-sm">Short descriptions shown in search results and group cards.</p>
            <Field name="descriptionEn">
              {({ field, meta }: FieldProps) => (
                <Textarea
                  {...field}
                  label="Description (English)"
                  placeholder="Brief description in English..."
                  description={`${2000 - (field.value?.length || 0)} characters remaining`}
                  errorMessage={meta.touched && meta.error ? meta.error : undefined}
                  isInvalid={meta.touched && !!meta.error}
                  minRows={3}
                  maxRows={5}
                />
              )}
            </Field>
            <Field name="descriptionPt">
              {({ field, meta }: FieldProps) => (
                <Textarea
                  {...field}
                  label="Descrição (Português)"
                  placeholder="Breve descrição em Português..."
                  description={`${2000 - (field.value?.length || 0)} characters remaining`}
                  errorMessage={meta.touched && meta.error ? meta.error : undefined}
                  isInvalid={meta.touched && !!meta.error}
                  minRows={3}
                  maxRows={5}
                />
              )}
            </Field>
          </section>

          {/* Philosophy Section */}
          <section className="space-y-4">
            <SubsectionHeading>Philosophy & Mission</SubsectionHeading>
            <p className="text-default-500 text-sm">The group&apos;s philosophy, mission, and core values.</p>
            <Field name="philosophyEn">
              {({ field, meta }: FieldProps) => (
                <Textarea
                  {...field}
                  label="Philosophy (English)"
                  placeholder="Group's philosophy and mission..."
                  description={`${5000 - (field.value?.length || 0)} characters remaining`}
                  errorMessage={meta.touched && meta.error ? meta.error : undefined}
                  isInvalid={meta.touched && !!meta.error}
                  minRows={4}
                  maxRows={8}
                />
              )}
            </Field>
            <Field name="philosophyPt">
              {({ field, meta }: FieldProps) => (
                <Textarea
                  {...field}
                  label="Filosofia (Português)"
                  placeholder="Filosofia e missão do grupo..."
                  description={`${5000 - (field.value?.length || 0)} characters remaining`}
                  errorMessage={meta.touched && meta.error ? meta.error : undefined}
                  isInvalid={meta.touched && !!meta.error}
                  minRows={4}
                  maxRows={8}
                />
              )}
            </Field>
          </section>

          {/* History Section */}
          <section className="space-y-4">
            <SubsectionHeading>History</SubsectionHeading>
            <p className="text-default-500 text-sm">Long-form history of the group&apos;s founding and evolution.</p>
            <Field name="historyEn">
              {({ field, meta }: FieldProps) => (
                <Textarea
                  {...field}
                  label="History (English)"
                  placeholder="The group was founded in..."
                  description={`${10000 - (field.value?.length || 0)} characters remaining`}
                  errorMessage={meta.touched && meta.error ? meta.error : undefined}
                  isInvalid={meta.touched && !!meta.error}
                  minRows={6}
                  maxRows={15}
                />
              )}
            </Field>
            <Field name="historyPt">
              {({ field, meta }: FieldProps) => (
                <Textarea
                  {...field}
                  label="História (Português)"
                  placeholder="O grupo foi fundado em..."
                  description={`${10000 - (field.value?.length || 0)} characters remaining`}
                  errorMessage={meta.touched && meta.error ? meta.error : undefined}
                  isInvalid={meta.touched && !!meta.error}
                  minRows={6}
                  maxRows={15}
                />
              )}
            </Field>
          </section>

          {/* Links Sections */}
          <section className="space-y-4">
            <SubsectionHeading>Social & Contact Links</SubsectionHeading>
            <p className="text-default-500 text-sm">Social media profiles and contact links for the group.</p>
            <FieldArray name="links">
              {(helpers) => <LinksArray links={values.links} actions={{ remove: helpers.remove, add: helpers.push }} />}
            </FieldArray>
          </section>

          <section className="space-y-4">
            <SubsectionHeading>Public References</SubsectionHeading>
            <p className="text-default-500 text-sm">
              Public references like Wikipedia, news articles, or other sources about the group.
            </p>
            <FieldArray name="publicLinks">
              {(helpers) => (
                <UrlArray urls={values.publicLinks || []} actions={{ remove: helpers.remove, add: helpers.push }} />
              )}
            </FieldArray>
          </section>

          {/* Actions */}
          <div className="flex flex-col mt-8 md:flex-row items-center gap-5 pt-4 border-t">
            {canDelete ? <DeleteGroup deleteGroup={handleDeleteGroup} isDeleting={isPendingDelete} /> : null}
            <Button
              type="submit"
              className="flex w-full items-center"
              color="primary"
              isLoading={isSubmitting || isPending}
              isDisabled={!dirty || !isValid}
            >
              Save Changes
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default GroupForm;

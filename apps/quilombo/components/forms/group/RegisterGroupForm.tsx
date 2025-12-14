'use client';

import { Button, Card, CardBody, CardHeader } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { enqueueSnackbar } from 'notistack';
import { useRouter } from 'next/navigation';

import { FieldInput, FieldTextarea, StringSelect } from '@/components/forms';
import { styles } from '@/config/constants';
import { type RegisterGroupForm as RegisterGroupFormType, registerGroupFormSchema } from '@/config/validation-schema';
import { group } from '@/query';

type Props = {
  /** Optional callback after successful submission */
  onSuccess?: () => void;
};

/**
 * Form for registering a new group that doesn't exist in the genealogy database.
 * Submits a claim request that requires admin approval.
 * On approval, creates both a genealogy.group_profiles entry AND a public.groups entry.
 */
const RegisterGroupForm = ({ onSuccess }: Props) => {
  const router = useRouter();
  const registerGroupMutation = group.useRegisterNewGroupMutation();

  const handleSubmit = async (values: RegisterGroupFormType) => {
    try {
      await registerGroupMutation.mutateAsync(values);
      enqueueSnackbar("Registration submitted! We'll review your request and email you.", { variant: 'success' });
      onSuccess?.();
      router.push('/groups');
    } catch (error) {
      console.error('Error registering group:', error);
      enqueueSnackbar((error as Error).message || 'An error occurred while submitting your registration', {
        variant: 'error',
      });
    }
  };

  const initialValues: RegisterGroupFormType = {
    proposedName: '',
    proposedStyle: null,
    website: '',
    userMessage: '',
  };

  return (
    <Card className="max-w-2xl">
      <CardHeader className="flex flex-col items-start gap-1 px-6 pt-6">
        <h2 className="text-xl font-semibold">Register a New Group</h2>
        <p className="text-default-500 text-sm">
          Can&apos;t find your group in our database? Submit a registration request and we&apos;ll review it.
        </p>
      </CardHeader>
      <CardBody className="px-6 pb-6">
        <Formik<RegisterGroupFormType>
          initialValues={initialValues}
          validationSchema={registerGroupFormSchema}
          onSubmit={handleSubmit}
        >
          {({ isSubmitting, isValid, dirty }: FormikProps<RegisterGroupFormType>) => (
            <Form className="flex flex-col gap-4">
              <Field
                name="proposedName"
                label="Group Name"
                placeholder="e.g., Grupo Capoeira Angola"
                as={FieldInput}
                isRequired
              />

              <Field name="proposedStyle" label="Style" options={[...styles]} as={StringSelect} />

              <Field
                name="website"
                label="Website"
                placeholder="https://example.com"
                description="Optional - helps us verify your group"
                as={FieldInput}
              />

              <div className="mt-2">
                <p className="text-default-600 mb-3 text-sm">To help us verify your registration, please provide:</p>
                <ul className="list-disc list-inside text-default-500 text-sm space-y-1 ml-2 mb-3">
                  <li>Your relationship to the group (founder, leader, instructor, etc.)</li>
                  <li>Where the group is based</li>
                  <li>When it was founded (if known)</li>
                  <li>Any other information that helps verify the group exists</li>
                </ul>
              </div>

              <Field
                name="userMessage"
                label="Tell us about this group"
                placeholder="I am the instructor at this group which was founded in 2010..."
                description="Minimum 20 characters required"
                as={FieldTextarea}
                minRows={4}
                isRequired
              />

              <div className="flex justify-end gap-2 mt-4">
                <Button color="default" variant="light" onPress={() => router.back()}>
                  Cancel
                </Button>
                <Button color="primary" type="submit" isLoading={isSubmitting} isDisabled={!isValid || !dirty}>
                  Submit Registration
                </Button>
              </div>
            </Form>
          )}
        </Formik>
      </CardBody>
    </Card>
  );
};

export default RegisterGroupForm;

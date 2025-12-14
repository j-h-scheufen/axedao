'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { enqueueSnackbar } from 'notistack';

import { FieldTextarea } from '@/components/forms';
import { type ClaimGroupForm, claimGroupFormSchema } from '@/config/validation-schema';
import { group } from '@/query';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  /** ID of the genealogy group profile to claim */
  profileId: string | undefined;
};

/**
 * Modal for claiming an existing genealogy group profile.
 * Used when a user wants to become admin of a group that exists in genealogy
 * but has not yet been claimed (no corresponding public.groups entry).
 */
const ClaimGroupModal = ({ isOpen, onOpenChange, profileId }: Props) => {
  const claimGroupMutation = group.useClaimGenealogyGroupMutation();

  const handleSubmit = async (values: ClaimGroupForm) => {
    if (!profileId) return;

    try {
      await claimGroupMutation.mutateAsync({ profileId, data: values });
      enqueueSnackbar("Claim submitted! We'll review and email you.", { variant: 'success' });
      onOpenChange();
    } catch (error) {
      console.error('Error submitting claim:', error);
      enqueueSnackbar((error as Error).message || 'An error occurred while submitting your claim', {
        variant: 'error',
      });
    }
  };

  const initialValues: ClaimGroupForm = {
    userMessage: '',
  };

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="lg">
      <ModalContent>
        {(onClose) => (
          <Formik<ClaimGroupForm>
            initialValues={initialValues}
            validationSchema={claimGroupFormSchema}
            onSubmit={handleSubmit}
          >
            {({ isSubmitting, isValid }: FormikProps<ClaimGroupForm>) => (
              <Form>
                <ModalHeader className="flex flex-col gap-1">Claim Group</ModalHeader>
                <ModalBody>
                  <div className="text-default-600 mb-4">
                    <p className="mb-3">To help us verify your claim, please provide:</p>
                    <ul className="list-disc list-inside space-y-2 ml-2">
                      <li>Your relationship to the group</li>
                      <li>Who leads the group</li>
                      <li>Other organizers or key members</li>
                      <li>How to contact you (email or phone, if comfortable sharing)</li>
                    </ul>
                  </div>
                  <Field
                    name="userMessage"
                    label="Why should you be the admin of this group?"
                    description="Minimum 20 characters required"
                    placeholder="Please explain your relationship to the group and why you should be granted admin access..."
                    as={FieldTextarea}
                    minRows={5}
                    isRequired
                  />
                </ModalBody>
                <ModalFooter>
                  <Button color="default" variant="light" onPress={onClose}>
                    Cancel
                  </Button>
                  <Button color="primary" type="submit" isLoading={isSubmitting} isDisabled={!isValid}>
                    Submit Claim
                  </Button>
                </ModalFooter>
              </Form>
            )}
          </Formik>
        )}
      </ModalContent>
    </Modal>
  );
};

export default ClaimGroupModal;

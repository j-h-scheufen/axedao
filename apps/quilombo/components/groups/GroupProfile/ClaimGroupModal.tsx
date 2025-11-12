'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { enqueueSnackbar } from 'notistack';
import { useState } from 'react';

import { FieldTextarea } from '@/components/forms';
import { type ClaimGroupForm, claimGroupFormSchema } from '@/config/validation-schema';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  groupId: string | undefined;
};

const ClaimGroupModal = ({ isOpen, onOpenChange, groupId }: Props) => {
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (values: ClaimGroupForm) => {
    if (!groupId) return;

    setError(null);
    try {
      const response = await fetch(`/api/groups/${groupId}/claim`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ userMessage: values.userMessage }),
      });

      const data = await response.json();

      if (!response.ok) {
        setError(data.error || 'Failed to submit claim request');
        return;
      }

      enqueueSnackbar("Claim submitted! We'll review and email you.", { variant: 'success' });
      onOpenChange();
    } catch (error) {
      console.error('Error submitting claim:', error);
      setError('An error occurred while submitting your claim');
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
                  {error && <div className="text-danger text-small">{error}</div>}
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

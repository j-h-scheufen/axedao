'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, Textarea } from '@heroui/react';
import { useFormik } from 'formik';
import { useState } from 'react';

import { claimGroupFormSchema } from '@/config/validation-schema';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  groupId: string | undefined;
};

const ClaimGroupModal = ({ isOpen, onOpenChange, groupId }: Props) => {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  const formik = useFormik({
    initialValues: {
      userMessage: '',
    },
    validationSchema: claimGroupFormSchema,
    onSubmit: async (values) => {
      if (!groupId) return;

      setIsSubmitting(true);
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

        setSuccess(true);
        formik.resetForm();
        setTimeout(() => {
          setSuccess(false);
          onOpenChange();
        }, 2000);
      } catch (error) {
        console.error('Error submitting claim:', error);
        setError('An error occurred while submitting your claim');
      } finally {
        setIsSubmitting(false);
      }
    },
  });

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="lg">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">Claim Group</ModalHeader>
            <ModalBody>
              {success ? (
                <div className="text-success p-4 bg-success-50 rounded-lg">
                  Claim submitted! We'll review and email you.
                </div>
              ) : (
                <>
                  <div className="text-default-600 mb-4">
                    <p className="mb-3">To help us verify your claim, please provide:</p>
                    <ul className="list-disc list-inside space-y-2 ml-2">
                      <li>Your relationship to the group</li>
                      <li>Who leads the group</li>
                      <li>Other organizers or key members</li>
                      <li>How to contact you (email or phone, if comfortable sharing)</li>
                    </ul>
                  </div>
                  <Textarea
                    label="Why should you be the admin of this group?"
                    placeholder="Please explain your relationship to the group and why you should be granted admin access..."
                    value={formik.values.userMessage}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    name="userMessage"
                    minRows={5}
                    isRequired
                    errorMessage={
                      formik.touched.userMessage && formik.errors.userMessage ? formik.errors.userMessage : ''
                    }
                    isInvalid={!!(formik.touched.userMessage && formik.errors.userMessage)}
                  />
                  {error && <div className="text-danger text-small">{error}</div>}
                </>
              )}
            </ModalBody>
            <ModalFooter>
              <Button color="default" variant="light" onPress={onClose}>
                Cancel
              </Button>
              <Button color="primary" onPress={() => formik.handleSubmit()} isLoading={isSubmitting}>
                Submit Claim
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default ClaimGroupModal;

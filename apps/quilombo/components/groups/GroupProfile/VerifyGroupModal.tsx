'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { enqueueSnackbar } from 'notistack';
import { useState, useEffect } from 'react';

import { FieldTextarea } from '@/components/forms';
import { type VerifyGroupForm, verifyGroupFormSchema } from '@/config/validation-schema';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  groupId: string | undefined;
};

const VerifyGroupModal = ({ isOpen, onOpenChange, groupId }: Props) => {
  const [error, setError] = useState<string | null>(null);
  const [cooldownInfo, setCooldownInfo] = useState<{ canVerify: boolean; message?: string } | null>(null);

  const handleSubmit = async (values: VerifyGroupForm) => {
    if (!groupId) return;

    setError(null);
    try {
      const response = await fetch(`/api/groups/${groupId}/verify`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ notes: values.notes }),
      });

      const data = await response.json();

      if (!response.ok) {
        setError(data.error || 'Failed to verify group');
        return;
      }

      enqueueSnackbar('Thanks for verifying! This group can be verified again in 30 days.', { variant: 'success' });
      onOpenChange();
    } catch (error) {
      console.error('Error verifying group:', error);
      setError('An error occurred while verifying the group');
    }
  };

  const initialValues: VerifyGroupForm = {
    notes: '',
  };

  // Check cooldown status when modal opens
  useEffect(() => {
    if (!isOpen || !groupId) return;

    const checkCooldown = async () => {
      try {
        const response = await fetch(`/api/groups/${groupId}/verify`);
        if (response.ok) {
          const data = await response.json();
          setCooldownInfo(data);
        }
      } catch (error) {
        console.error('Error checking verification cooldown:', error);
      }
    };

    checkCooldown();
  }, [isOpen, groupId]);

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="lg">
      <ModalContent>
        {(onClose) => (
          <Formik<VerifyGroupForm>
            initialValues={initialValues}
            validationSchema={verifyGroupFormSchema}
            onSubmit={handleSubmit}
          >
            {({ isSubmitting }: FormikProps<VerifyGroupForm>) => (
              <Form>
                <ModalHeader className="flex flex-col gap-1">Verify Group</ModalHeader>
                <ModalBody>
                  {cooldownInfo && !cooldownInfo.canVerify ? (
                    <div className="text-default-600 p-4 bg-default-100 rounded-lg">{cooldownInfo.message}</div>
                  ) : (
                    <>
                      <div className="text-default-600">
                        <p className="mb-3">By verifying, you confirm:</p>
                        <ol className="list-decimal list-inside space-y-2 ml-2">
                          <li>The group website/contact information is valid</li>
                          <li>The group is still active</li>
                          <li>The information displayed is accurate</li>
                        </ol>
                      </div>
                      <Field
                        name="notes"
                        label="Notes (optional)"
                        placeholder="What did you verify?"
                        as={FieldTextarea}
                        minRows={3}
                      />
                      {error && <div className="text-danger text-small">{error}</div>}
                    </>
                  )}
                </ModalBody>
                <ModalFooter>
                  <Button color="default" variant="light" onPress={onClose}>
                    Cancel
                  </Button>
                  {(cooldownInfo === null || cooldownInfo.canVerify) && (
                    <Button color="primary" type="submit" isLoading={isSubmitting}>
                      Verify Group
                    </Button>
                  )}
                </ModalFooter>
              </Form>
            )}
          </Formik>
        )}
      </ModalContent>
    </Modal>
  );
};

export default VerifyGroupModal;

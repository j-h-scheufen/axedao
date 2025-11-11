'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, Textarea } from '@heroui/react';
import { useFormik } from 'formik';
import { useState, useEffect } from 'react';

import { verifyGroupFormSchema } from '@/config/validation-schema';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  groupId: string | undefined;
};

const VerifyGroupModal = ({ isOpen, onOpenChange, groupId }: Props) => {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);
  const [cooldownInfo, setCooldownInfo] = useState<{ canVerify: boolean; message?: string } | null>(null);

  const formik = useFormik({
    initialValues: {
      notes: '',
    },
    validationSchema: verifyGroupFormSchema,
    onSubmit: async (values) => {
      if (!groupId) return;

      setIsSubmitting(true);
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

        setSuccess(true);
        formik.resetForm();
        setTimeout(() => {
          setSuccess(false);
          onOpenChange();
        }, 2000);
      } catch (error) {
        console.error('Error verifying group:', error);
        setError('An error occurred while verifying the group');
      } finally {
        setIsSubmitting(false);
      }
    },
  });

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
          <>
            <ModalHeader className="flex flex-col gap-1">Verify Group</ModalHeader>
            <ModalBody>
              {success ? (
                <div className="text-success p-4 bg-success-50 rounded-lg">
                  Thanks for verifying! This group can be verified again in 30 days.
                </div>
              ) : cooldownInfo && !cooldownInfo.canVerify ? (
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
                  <Textarea
                    label="Notes (optional)"
                    placeholder="What did you verify?"
                    value={formik.values.notes}
                    onChange={formik.handleChange}
                    onBlur={formik.handleBlur}
                    name="notes"
                    minRows={3}
                    errorMessage={formik.touched.notes && formik.errors.notes ? formik.errors.notes : ''}
                    isInvalid={!!(formik.touched.notes && formik.errors.notes)}
                  />
                  {error && <div className="text-danger text-small">{error}</div>}
                </>
              )}
            </ModalBody>
            <ModalFooter>
              <Button color="default" variant="light" onPress={onClose}>
                Cancel
              </Button>
              {cooldownInfo?.canVerify && (
                <Button color="primary" onPress={() => formik.handleSubmit()} isLoading={isSubmitting}>
                  Verify Group
                </Button>
              )}
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default VerifyGroupModal;

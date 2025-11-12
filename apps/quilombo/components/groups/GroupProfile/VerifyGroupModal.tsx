'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { Field, Form, Formik, type FormikProps } from 'formik';
import { enqueueSnackbar } from 'notistack';

import { FieldTextarea } from '@/components/forms';
import { GROUP_VERIFICATION_COOLDOWN_MS } from '@/config/constants';
import { type VerifyGroupForm, verifyGroupFormSchema } from '@/config/validation-schema';
import { group } from '@/query';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  groupId: string | undefined;
};

const VerifyGroupModal = ({ isOpen, onOpenChange, groupId }: Props) => {
  const { data: groupData } = group.useFetchGroup(groupId ?? '');
  const verifyGroupMutation = group.useVerifyGroupMutation();

  // Compute cooldown status from lastVerifiedAt
  const canVerify =
    !groupData?.lastVerifiedAt || Date.now() - groupData.lastVerifiedAt.getTime() > GROUP_VERIFICATION_COOLDOWN_MS;
  const cooldownMessage = !canVerify
    ? 'This group was recently verified. Groups can only be verified once every 30 days.'
    : undefined;

  const handleSubmit = async (values: VerifyGroupForm) => {
    if (!groupId) return;

    try {
      await verifyGroupMutation.mutateAsync({ groupId, data: values });
      enqueueSnackbar('Thanks for verifying! This group can be verified again in 30 days.', { variant: 'success' });
      onOpenChange();
    } catch (error) {
      console.error('Error verifying group:', error);
      enqueueSnackbar((error as Error).message || 'An error occurred while verifying the group', { variant: 'error' });
    }
  };

  const initialValues: VerifyGroupForm = {
    notes: '',
  };

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
                  {!canVerify ? (
                    <div className="text-default-600 p-4 bg-default-100 rounded-lg">{cooldownMessage}</div>
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
                    </>
                  )}
                </ModalBody>
                <ModalFooter>
                  <Button color="default" variant="light" onPress={onClose}>
                    Cancel
                  </Button>
                  {canVerify && (
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

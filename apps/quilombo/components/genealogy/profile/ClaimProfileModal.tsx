'use client';

import { Avatar, Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, addToast } from '@heroui/react';
import { Field, Form, Formik, type FormikHelpers } from 'formik';

import { claimPersonFormSchema } from '@/config/validation-schema';
import { useClaimPersonMutation } from '@/query/genealogyProfile';
import FieldTextarea from '@/components/forms/FieldTextarea';

type PersonProfile = {
  id: string;
  name: string | null;
  apelido: string | null;
  title: string | null;
  portrait: string | null;
};

type ClaimProfileModalProps = {
  isOpen: boolean;
  onClose: () => void;
  profile: PersonProfile;
  onSuccess: () => void;
};

type ClaimFormValues = {
  userMessage: string;
};

/**
 * Modal for claiming an existing genealogy profile.
 * User must provide a message explaining why this is their profile.
 */
const ClaimProfileModal = ({ isOpen, onClose, profile, onSuccess }: ClaimProfileModalProps) => {
  const claimMutation = useClaimPersonMutation();

  const getDisplayName = () => {
    return profile.apelido || profile.name || 'this profile';
  };

  const handleSubmit = async (values: ClaimFormValues, helpers: FormikHelpers<ClaimFormValues>) => {
    try {
      await claimMutation.mutateAsync({
        personProfileId: profile.id,
        userMessage: values.userMessage.trim(),
      });

      addToast({
        title: 'Claim submitted',
        description: 'Your request to claim this profile has been submitted for review.',
        color: 'success',
      });

      helpers.resetForm();
      onSuccess();
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Failed to submit claim';
      addToast({
        title: 'Error',
        description: message,
        color: 'danger',
      });
    }
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} size="lg">
      <ModalContent>
        <Formik<ClaimFormValues>
          initialValues={{ userMessage: '' }}
          validationSchema={claimPersonFormSchema}
          onSubmit={handleSubmit}
        >
          {({ isSubmitting }) => (
            <Form>
              <ModalHeader className="flex flex-col gap-1">
                <h3 className="text-lg font-semibold">Claim This Profile</h3>
                <p className="text-sm text-default-500 font-normal">
                  Request to link this genealogy profile to your account
                </p>
              </ModalHeader>

              <ModalBody className="gap-4">
                {/* Profile preview */}
                <div className="flex items-center gap-4 p-4 bg-default-100 rounded-lg">
                  <Avatar
                    src={profile.portrait || undefined}
                    name={getDisplayName()}
                    size="lg"
                    className="flex-shrink-0"
                  />
                  <div className="flex-grow min-w-0">
                    {profile.title && (
                      <p className="text-xs text-default-500 uppercase tracking-wide">{profile.title}</p>
                    )}
                    <p className="text-lg font-semibold truncate">{getDisplayName()}</p>
                    {profile.name && profile.apelido && (
                      <p className="text-sm text-default-500 truncate">{profile.name}</p>
                    )}
                  </div>
                </div>

                {/* Explanation */}
                <p className="text-sm text-default-600">
                  To claim this profile, please explain how you can verify that this is your profile. An administrator
                  will review your request.
                </p>

                {/* Message field */}
                <Field
                  as={FieldTextarea}
                  name="userMessage"
                  label="Verification message"
                  placeholder="E.g., I was batizado by Mestre X in 2010 at event Y. My group is Z and I can provide..."
                  minRows={4}
                  description="Minimum 20 characters. Provide details that help verify your identity."
                />
              </ModalBody>

              <ModalFooter>
                <Button variant="light" onPress={onClose} isDisabled={isSubmitting}>
                  Cancel
                </Button>
                <Button color="primary" type="submit" isLoading={isSubmitting}>
                  Submit Claim Request
                </Button>
              </ModalFooter>
            </Form>
          )}
        </Formik>
      </ModalContent>
    </Modal>
  );
};

export default ClaimProfileModal;

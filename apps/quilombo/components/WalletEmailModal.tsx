'use client';

import { Button, Input, Modal, ModalContent, ModalHeader, ModalBody, ModalFooter } from '@heroui/react';
import { Formik, Form } from 'formik';
import { walletSignupEmailSchema, type WalletSignupEmailForm } from '@/config/validation-schema';
import ErrorText from './ErrorText';

type WalletEmailModalProps = {
  isOpen: boolean;
  walletAddress: string;
  onEmailSubmit: (email: string) => Promise<void>;
  onClose: () => void;
  error?: string | null;
};

/**
 * Modal for collecting email from first-time Human Wallet users
 * Displayed when a wallet connects that hasn't been registered before
 */
const WalletEmailModal = ({ isOpen, walletAddress, onEmailSubmit, onClose, error }: WalletEmailModalProps) => {
  const handleSubmit = async (values: WalletSignupEmailForm) => {
    await onEmailSubmit(values.email);
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} isDismissable={false} hideCloseButton>
      <ModalContent>
        <ModalHeader>Complete Your Signup</ModalHeader>
        <Formik initialValues={{ email: '' }} validationSchema={walletSignupEmailSchema} onSubmit={handleSubmit}>
          {({ errors, touched, isSubmitting, handleChange, handleBlur, values }) => (
            <Form>
              <ModalBody>
                <p className="text-sm text-default-600 mb-4">
                  To complete signup with your Human Wallet, please provide your email address.
                </p>
                <div className="p-3 bg-default-100 rounded mb-4">
                  <p className="text-xs text-default-500 mb-1">Connected Wallet:</p>
                  <p className="text-sm font-mono text-default-700">
                    {walletAddress.slice(0, 6)}...{walletAddress.slice(-4)}
                  </p>
                </div>
                <Input
                  name="email"
                  type="email"
                  label="Email Address"
                  placeholder="your@email.com"
                  value={values.email}
                  onChange={handleChange}
                  onBlur={handleBlur}
                  isInvalid={touched.email && !!errors.email}
                  errorMessage={touched.email && errors.email}
                  isRequired
                  autoFocus
                  description="We'll use this for notifications and account recovery"
                />
                {error && <ErrorText message={error} />}
              </ModalBody>
              <ModalFooter>
                <Button variant="flat" onPress={onClose} isDisabled={isSubmitting}>
                  Cancel
                </Button>
                <Button color="primary" type="submit" isLoading={isSubmitting}>
                  Complete Signup
                </Button>
              </ModalFooter>
            </Form>
          )}
        </Formik>
      </ModalContent>
    </Modal>
  );
};

export default WalletEmailModal;

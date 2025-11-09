'use client';

import { useState } from 'react';
import { Button, Input, Divider, useDisclosure } from '@heroui/react';
import { Formik, Form } from 'formik';
import { useMutation } from '@tanstack/react-query';
import { enqueueSnackbar } from 'notistack';
import { object, string } from 'yup';
import { useAtom } from 'jotai';

import { activeQRInvitationAtom, validQRInvitationAtom } from '@/hooks/state/invitations';
import InviteQRModal from './InviteQRModal';
import InviteLinkModal from './InviteLinkModal';
import ErrorText from '../ErrorText';

// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public
const emailSchema = object({
  email: string().email('Invalid email address').required('Email is required').lowercase().trim(),
});

type EmailForm = {
  email: string;
};

type InvitationResponse = {
  code: string;
  type: 'email_bound' | 'open';
  invitedEmail?: string;
  expiresAt: string;
  inviteLink: string;
};

const InviteMemberForm = () => {
  const qrModal = useDisclosure();
  const linkModal = useDisclosure();
  const [currentInvitation, setCurrentInvitation] = useState<InvitationResponse | null>(null);
  const [_activeQRInvitation, setActiveQRInvitation] = useAtom(activeQRInvitationAtom);
  const [validQRInvitation] = useAtom(validQRInvitationAtom);

  // Mutation: Create email-bound invitation and send email
  const sendEmailMutation = useMutation({
    mutationFn: async (email: string) => {
      const response = await fetch('/api/invitations', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          type: 'email_bound',
          invitedEmail: email,
          sendEmail: true,
        }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Failed to send invitation');
      }

      return response.json();
    },
    onSuccess: () => {
      enqueueSnackbar('Invitation email sent successfully', { variant: 'success' });
    },
    onError: (error: Error) => {
      enqueueSnackbar(error.message || 'Failed to send invitation', { variant: 'error' });
    },
  });

  // Mutation: Create email-bound invitation and get link
  const copyLinkMutation = useMutation({
    mutationFn: async (email: string) => {
      const response = await fetch('/api/invitations', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          type: 'email_bound',
          invitedEmail: email,
          sendEmail: false,
        }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Failed to create invitation');
      }

      return response.json();
    },
    onSuccess: (data: InvitationResponse) => {
      setCurrentInvitation(data);
      linkModal.onOpen();
    },
    onError: (error: Error) => {
      enqueueSnackbar(error.message || 'Failed to create invitation', { variant: 'error' });
    },
  });

  // Mutation: Generate QR code (open invitation)
  const generateQRMutation = useMutation({
    mutationFn: async () => {
      const response = await fetch('/api/invitations', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          type: 'open',
        }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || 'Failed to generate QR code');
      }

      return response.json();
    },
    onSuccess: (data: InvitationResponse) => {
      // Store in atom for persistence
      setActiveQRInvitation({
        code: data.code,
        type: data.type as 'open',
        expiresAt: data.expiresAt,
        inviteLink: data.inviteLink,
        createdAt: new Date().toISOString(),
      });
      setCurrentInvitation(data);
      qrModal.onOpen();
    },
    onError: (error: Error) => {
      enqueueSnackbar(error.message || 'Failed to generate QR code', { variant: 'error' });
    },
  });

  // Handler for showing/generating QR code
  const handleShowQRCode = () => {
    if (validQRInvitation) {
      // Show existing valid QR code
      setCurrentInvitation(validQRInvitation);
      qrModal.onOpen();
    } else {
      // Generate new QR code
      generateQRMutation.mutate();
    }
  };

  // Handler for regenerating QR code (called from modal)
  const handleRegenerateQR = () => {
    generateQRMutation.mutate();
  };

  const handleSendEmail = async (values: EmailForm, { resetForm }: { resetForm: () => void }) => {
    await sendEmailMutation.mutateAsync(values.email);
    resetForm();
  };

  const handleCopyLink = async (values: EmailForm, { resetForm }: { resetForm: () => void }) => {
    await copyLinkMutation.mutateAsync(values.email);
    resetForm();
  };

  return (
    <div className="space-y-6">
      {/* Section 1: Invite by Email */}
      <div>
        <h3 className="text-lg font-semibold text-default-900 mb-2">Invite by Email</h3>
        <p className="text-sm text-default-500 mb-4">
          Send an invitation to a specific email address. The invitation is valid for 30 days and can only be used once.
        </p>

        <Formik initialValues={{ email: '' }} validationSchema={emailSchema} onSubmit={handleSendEmail}>
          {({ values, errors, touched, handleChange, handleBlur, isSubmitting, resetForm }) => (
            <Form>
              <div className="flex flex-col gap-3">
                <Input
                  name="email"
                  type="email"
                  label="Email Address"
                  placeholder="friend@example.com"
                  value={values.email}
                  onChange={handleChange}
                  onBlur={handleBlur}
                  isInvalid={touched.email && !!errors.email}
                  errorMessage={touched.email && errors.email}
                  isDisabled={isSubmitting || copyLinkMutation.isPending}
                />

                <div className="flex gap-2 justify-center sm:justify-start">
                  <Button
                    type="submit"
                    color="primary"
                    isLoading={sendEmailMutation.isPending}
                    isDisabled={!values.email || copyLinkMutation.isPending}
                  >
                    Send Email Invite
                  </Button>
                  <Button
                    type="button"
                    variant="bordered"
                    isLoading={copyLinkMutation.isPending}
                    isDisabled={!values.email || sendEmailMutation.isPending}
                    onPress={() => handleCopyLink(values, { resetForm })}
                  >
                    Copy Link
                  </Button>
                </div>

                {(sendEmailMutation.isError || copyLinkMutation.isError) && (
                  <ErrorText
                    message={sendEmailMutation.error?.message || copyLinkMutation.error?.message || 'An error occurred'}
                  />
                )}
              </div>
            </Form>
          )}
        </Formik>
      </div>

      <Divider />

      {/* Section 2: Generate QR Code for Events */}
      <div>
        <h3 className="text-lg font-semibold text-default-900 mb-2">Invite with QR Code</h3>
        <p className="text-sm text-default-500 mb-4">
          Generate a QR code for in-person meetings (events, workshops, rodas). Valid for 72 hours. Multiple people can
          scan the same code. Your QR code is saved and can be reopened anytime before it expires.
        </p>

        {validQRInvitation && (
          <div className="mb-3 p-3 bg-success-50 rounded-lg border border-success-200">
            <p className="text-sm text-success-700">
              ✓ Active QR code (expires{' '}
              {new Date(validQRInvitation.expiresAt).toLocaleString('en-US', {
                month: 'short',
                day: 'numeric',
                hour: 'numeric',
                minute: '2-digit',
              })}
              )
            </p>
          </div>
        )}

        <div className="flex justify-center sm:justify-start">
          <Button color="secondary" onPress={handleShowQRCode} isLoading={generateQRMutation.isPending}>
            {validQRInvitation ? 'Show QR Code' : 'Generate QR Code'}
          </Button>
        </div>

        {generateQRMutation.isError && <ErrorText className="mt-2" message={generateQRMutation.error.message} />}
      </div>

      {/* Modals */}
      {currentInvitation && (
        <>
          <InviteQRModal
            isOpen={qrModal.isOpen}
            onOpenChange={qrModal.onOpenChange}
            invitation={currentInvitation}
            onRegenerate={handleRegenerateQR}
            isRegenerating={generateQRMutation.isPending}
          />
          <InviteLinkModal
            isOpen={linkModal.isOpen}
            onOpenChange={linkModal.onOpenChange}
            invitation={currentInvitation}
          />
        </>
      )}
    </div>
  );
};

export default InviteMemberForm;

'use client';

import { useState } from 'react';
import { Button, Input, Divider, useDisclosure } from '@heroui/react';
import { Formik, Form } from 'formik';
import { useMutation } from '@tanstack/react-query';
import { enqueueSnackbar } from 'notistack';
import { object, string } from 'yup';

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
      setCurrentInvitation(data);
      qrModal.onOpen();
    },
    onError: (error: Error) => {
      enqueueSnackbar(error.message || 'Failed to generate QR code', { variant: 'error' });
    },
  });

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

                <div className="flex gap-2">
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
        <h3 className="text-lg font-semibold text-default-900 mb-2">Generate QR Code for Events</h3>
        <p className="text-sm text-default-500 mb-4">
          Generate a QR code for in-person events (workshops, rodas). Valid for 72 hours. Multiple people can scan the
          same code. Generating a new code will replace your current one.
        </p>

        <Button color="secondary" onPress={() => generateQRMutation.mutate()} isLoading={generateQRMutation.isPending}>
          Generate QR Code
        </Button>

        {generateQRMutation.isError && <ErrorText className="mt-2" message={generateQRMutation.error.message} />}
      </div>

      {/* Modals */}
      {currentInvitation && (
        <>
          <InviteQRModal isOpen={qrModal.isOpen} onOpenChange={qrModal.onOpenChange} invitation={currentInvitation} />
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

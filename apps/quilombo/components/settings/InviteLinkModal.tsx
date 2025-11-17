'use client';

import { useState } from 'react';
import { Modal, ModalContent, ModalHeader, ModalBody, ModalFooter, Button, Input } from '@heroui/react';
import { enqueueSnackbar } from 'notistack';

// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public
type InvitationResponse = {
  code: string;
  type: 'email_bound' | 'open';
  invitedEmail?: string;
  expiresAt: string;
  inviteLink: string;
};

type InviteLinkModalProps = {
  isOpen: boolean;
  onOpenChange: () => void;
  invitation: InvitationResponse;
};

const InviteLinkModal = ({ isOpen, onOpenChange, invitation }: InviteLinkModalProps) => {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(invitation.inviteLink);
      setCopied(true);
      enqueueSnackbar('Link copied to clipboard', { variant: 'success' });
      setTimeout(() => setCopied(false), 2000);
    } catch (_error) {
      enqueueSnackbar('Failed to copy link', { variant: 'error' });
    }
  };

  const expiryDate = new Date(invitation.expiresAt);
  const formattedExpiry = expiryDate.toLocaleString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric',
    hour: 'numeric',
    minute: '2-digit',
    hour12: true,
  });

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="lg">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">
              <h3 className="text-xl font-semibold">Invitation Link</h3>
              <p className="text-sm font-normal text-default-500">Share this link to invite a new member</p>
            </ModalHeader>

            <ModalBody className="gap-4">
              {/* Invited Email */}
              {invitation.invitedEmail && (
                <div>
                  <p className="text-sm font-semibold text-default-700 mb-2">Invited Email:</p>
                  <p className="text-base font-medium text-default-900 px-3 py-2 bg-default-100 rounded-lg">
                    {invitation.invitedEmail}
                  </p>
                </div>
              )}

              {/* Invitation Link */}
              <div>
                <p className="text-sm font-semibold text-default-700 mb-2">Invitation Link:</p>
                <div className="flex gap-2">
                  <Input
                    value={invitation.inviteLink}
                    readOnly
                    classNames={{
                      input: 'text-xs',
                    }}
                  />
                  <Button color={copied ? 'success' : 'primary'} onPress={handleCopy} className="shrink-0">
                    {copied ? 'Copied!' : 'Copy'}
                  </Button>
                </div>
              </div>

              {/* Expiry Information */}
              <div className="p-3 bg-default-100 rounded-lg border border-default-200">
                <p className="text-sm font-semibold text-default-700 mb-1">Valid until:</p>
                <p className="text-base font-medium text-default-900 mb-2">{formattedExpiry}</p>
                <p className="text-xs text-default-500">
                  This invitation can only be used by {invitation.invitedEmail}
                </p>
              </div>
            </ModalBody>

            <ModalFooter>
              <Button color="default" variant="light" onPress={onClose}>
                Close
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default InviteLinkModal;

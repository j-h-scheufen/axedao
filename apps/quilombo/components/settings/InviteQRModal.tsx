'use client';

import { Modal, ModalContent, ModalHeader, ModalBody, ModalFooter, Button } from '@heroui/react';
import { QRCodeSVG } from 'qrcode.react';

// TODO: TEMPORARY INVITE-ONLY - Remove when opening to public
type InvitationResponse = {
  code: string;
  type: 'email_bound' | 'open';
  invitedEmail?: string;
  expiresAt: string;
  inviteLink: string;
};

type InviteQRModalProps = {
  isOpen: boolean;
  onOpenChange: () => void;
  invitation: InvitationResponse;
};

const InviteQRModal = ({ isOpen, onOpenChange, invitation }: InviteQRModalProps) => {
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
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="md">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">
              <h3 className="text-xl font-semibold">Event QR Code</h3>
              <p className="text-sm font-normal text-default-500">Share this QR code at workshops and events</p>
            </ModalHeader>

            <ModalBody className="flex flex-col items-center gap-4 py-6">
              {/* QR Code */}
              <div className="p-4 bg-white rounded-lg">
                <QRCodeSVG value={invitation.inviteLink} size={256} level="M" includeMargin={true} />
              </div>

              {/* Expiry Information */}
              <div className="text-center space-y-2">
                <p className="text-sm font-semibold text-default-700">Valid until:</p>
                <p className="text-base font-medium text-default-900">{formattedExpiry}</p>
                <p className="text-xs text-default-500">(72 hours from generation)</p>
              </div>

              {/* Usage Information */}
              <div className="w-full p-3 bg-default-100 rounded-lg border border-default-200">
                <p className="text-xs text-default-600 text-center">
                  ✓ Multiple people can use this code
                  <br />✓ No email restriction
                  <br />✓ Perfect for in-person events
                </p>
              </div>
            </ModalBody>

            <ModalFooter>
              <Button color="primary" onPress={onClose} fullWidth>
                Close
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default InviteQRModal;

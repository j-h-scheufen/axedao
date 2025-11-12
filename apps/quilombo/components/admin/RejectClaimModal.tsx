'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, Textarea } from '@heroui/react';
import { useState } from 'react';

import * as admin from '@/query/admin';

type GroupClaim = {
  id: string;
  groupName: string;
  userName: string;
};

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  claim: GroupClaim;
  onSuccess: () => void;
};

const RejectClaimModal = ({ isOpen, onOpenChange, claim, onSuccess }: Props) => {
  const [reason, setReason] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  const rejectClaimMutation = admin.useRejectClaimMutation();

  const handleReject = async () => {
    if (!reason.trim()) {
      setError('Please provide a reason for rejection');
      return;
    }

    setError(null);
    try {
      await rejectClaimMutation.mutateAsync({ claimId: claim.id, adminNotes: reason });

      setSuccess(true);
      setTimeout(() => {
        onSuccess();
        setReason('');
        setSuccess(false);
        onOpenChange();
      }, 1500);
    } catch (error) {
      console.error('Error rejecting claim:', error);
      setError((error as Error).message || 'An error occurred while rejecting the claim');
    }
  };

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="lg">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader>Reject Claim</ModalHeader>
            <ModalBody>
              {success ? (
                <div className="text-success p-4 bg-success-50 rounded-lg">Claim rejected</div>
              ) : (
                <>
                  <p className="text-default-600 mb-4">
                    Reject <strong>{claim.userName}</strong>'s claim for <strong>{claim.groupName}</strong>?
                  </p>
                  <Textarea
                    label="Reason for rejection"
                    placeholder="This reason will be sent to the user in an email"
                    value={reason}
                    onChange={(e) => setReason(e.target.value)}
                    minRows={3}
                    isRequired
                  />
                  <p className="text-small text-default-500 mt-2">
                    The user will receive an email with your reason for rejection.
                  </p>
                  {error && <div className="text-danger text-small mt-2">{error}</div>}
                </>
              )}
            </ModalBody>
            <ModalFooter>
              <Button color="default" variant="light" onPress={onClose}>
                Cancel
              </Button>
              <Button color="danger" onPress={handleReject} isLoading={rejectClaimMutation.isPending}>
                Reject Claim
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default RejectClaimModal;

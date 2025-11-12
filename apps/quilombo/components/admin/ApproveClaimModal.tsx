'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
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

const ApproveClaimModal = ({ isOpen, onOpenChange, claim, onSuccess }: Props) => {
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  const approveClaimMutation = admin.useApproveClaimMutation();

  const handleApprove = async () => {
    setError(null);
    try {
      await approveClaimMutation.mutateAsync({ claimId: claim.id });

      setSuccess(true);
      setTimeout(() => {
        onSuccess();
        setSuccess(false);
        onOpenChange();
      }, 1500);
    } catch (error) {
      console.error('Error approving claim:', error);
      setError((error as Error).message || 'An error occurred while approving the claim');
    }
  };

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader>Approve Claim</ModalHeader>
            <ModalBody>
              {success ? (
                <div className="text-success p-4 bg-success-50 rounded-lg">Claim approved successfully!</div>
              ) : (
                <>
                  <p className="text-default-600">
                    Approve <strong>{claim.userName}</strong> as admin of <strong>{claim.groupName}</strong>?
                  </p>
                  <p className="text-small text-default-500 mt-2">
                    This will add the user as a group admin and send them a confirmation email.
                  </p>
                  {error && <div className="text-danger text-small mt-2">{error}</div>}
                </>
              )}
            </ModalBody>
            <ModalFooter>
              <Button color="default" variant="light" onPress={onClose}>
                Cancel
              </Button>
              <Button color="primary" onPress={handleApprove} isLoading={approveClaimMutation.isPending}>
                Approve
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default ApproveClaimModal;

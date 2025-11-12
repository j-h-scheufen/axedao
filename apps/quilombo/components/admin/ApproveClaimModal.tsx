'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { enqueueSnackbar } from 'notistack';

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
  const approveClaimMutation = admin.useApproveClaimMutation();

  const handleApprove = async () => {
    try {
      await approveClaimMutation.mutateAsync({ claimId: claim.id });
      enqueueSnackbar('Claim approved successfully!', { variant: 'success' });
      onSuccess();
      onOpenChange();
    } catch (error) {
      console.error('Error approving claim:', error);
      enqueueSnackbar((error as Error).message || 'An error occurred while approving the claim', { variant: 'error' });
    }
  };

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader>Approve Claim</ModalHeader>
            <ModalBody>
              <p className="text-default-600">
                Approve <strong>{claim.userName}</strong> as admin of <strong>{claim.groupName}</strong>?
              </p>
              <p className="text-small text-default-500 mt-2">
                This will add the user as a group admin and send them a confirmation email.
              </p>
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

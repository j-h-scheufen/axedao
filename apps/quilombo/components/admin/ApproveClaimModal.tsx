'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { enqueueSnackbar } from 'notistack';

import * as admin from '@/query/admin';
import type { GroupClaim } from '@/query/admin';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  claim: GroupClaim;
  onSuccess: () => void;
};

/** Helper to get the display name for a claim's group */
const getGroupName = (claim: GroupClaim): string => {
  if (claim.type === 'genealogy_group' && claim.groupProfile) {
    return claim.groupProfile.name;
  }
  return claim.proposedName || 'Unknown Group';
};

/** Helper to get the display name for a claim's user */
const getUserName = (claim: GroupClaim): string => {
  if (claim.user) {
    return claim.user.nickname || claim.user.name || 'Unknown User';
  }
  return 'Unknown User';
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

  const userName = getUserName(claim);
  const groupName = getGroupName(claim);

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader>Approve Claim</ModalHeader>
            <ModalBody>
              <p className="text-default-600">
                Approve <strong>{userName}</strong> as admin of <strong>{groupName}</strong>?
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

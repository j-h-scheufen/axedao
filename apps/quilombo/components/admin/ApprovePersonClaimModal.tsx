'use client';

import { Avatar, Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { enqueueSnackbar } from 'notistack';

import { type PersonClaim, useApprovePersonClaimMutation } from '@/query/admin';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  claim: PersonClaim;
  onSuccess: () => void;
};

const ApprovePersonClaimModal = ({ isOpen, onOpenChange, claim, onSuccess }: Props) => {
  const approveClaimMutation = useApprovePersonClaimMutation();

  const getProfileDisplayName = () => {
    return claim.profileApelido || claim.profileName || 'Unknown Profile';
  };

  const handleApprove = async () => {
    try {
      await approveClaimMutation.mutateAsync({ claimId: claim.id });
      enqueueSnackbar('Profile claim approved successfully!', { variant: 'success' });
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
            <ModalHeader>Approve Profile Claim</ModalHeader>
            <ModalBody>
              {/* Profile preview */}
              <div className="flex items-center gap-4 p-4 bg-default-100 rounded-lg mb-4">
                <Avatar
                  src={claim.profilePortrait || undefined}
                  name={getProfileDisplayName()}
                  size="lg"
                  className="flex-shrink-0"
                />
                <div className="flex-grow min-w-0">
                  {claim.profileTitle && (
                    <p className="text-xs text-default-500 uppercase tracking-wide">{claim.profileTitle}</p>
                  )}
                  <p className="text-lg font-semibold truncate">{getProfileDisplayName()}</p>
                  {claim.profileName && claim.profileApelido && (
                    <p className="text-sm text-default-500 truncate">{claim.profileName}</p>
                  )}
                </div>
              </div>

              <p className="text-default-600">
                Approve <strong>{claim.userName}</strong>&apos;s claim for the profile{' '}
                <strong>{getProfileDisplayName()}</strong>?
              </p>
              <p className="text-small text-default-500 mt-2">
                This will link the user&apos;s account to the genealogy profile and send them a confirmation email.
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

export default ApprovePersonClaimModal;

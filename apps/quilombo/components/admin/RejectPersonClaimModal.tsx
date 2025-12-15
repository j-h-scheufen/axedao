'use client';

import { Avatar, Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, Textarea } from '@heroui/react';
import { enqueueSnackbar } from 'notistack';
import { useState } from 'react';

import { type PersonClaim, useRejectPersonClaimMutation } from '@/query/admin';

type Props = {
  isOpen: boolean;
  onOpenChange: () => void;
  claim: PersonClaim;
  onSuccess: () => void;
};

const RejectPersonClaimModal = ({ isOpen, onOpenChange, claim, onSuccess }: Props) => {
  const [reason, setReason] = useState('');

  const rejectClaimMutation = useRejectPersonClaimMutation();

  const getProfileDisplayName = () => {
    return claim.profileApelido || claim.profileName || 'Unknown Profile';
  };

  const handleReject = async () => {
    if (!reason.trim()) {
      enqueueSnackbar('Please provide a reason for rejection', { variant: 'error' });
      return;
    }

    try {
      await rejectClaimMutation.mutateAsync({ claimId: claim.id, notes: reason });
      enqueueSnackbar('Profile claim rejected successfully', { variant: 'success' });
      onSuccess();
      setReason('');
      onOpenChange();
    } catch (error) {
      console.error('Error rejecting claim:', error);
      enqueueSnackbar((error as Error).message || 'An error occurred while rejecting the claim', { variant: 'error' });
    }
  };

  const handleClose = () => {
    setReason('');
    onOpenChange();
  };

  return (
    <Modal isOpen={isOpen} onOpenChange={handleClose} size="lg">
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader>Reject Profile Claim</ModalHeader>
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

              <p className="text-default-600 mb-4">
                Reject <strong>{claim.userName}</strong>&apos;s claim for the profile{' '}
                <strong>{getProfileDisplayName()}</strong>?
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

export default RejectPersonClaimModal;

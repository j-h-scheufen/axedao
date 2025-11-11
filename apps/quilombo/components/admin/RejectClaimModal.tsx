'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, Textarea } from '@heroui/react';
import { useState } from 'react';

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
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [reason, setReason] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState(false);

  const handleReject = async () => {
    if (!reason.trim()) {
      setError('Please provide a reason for rejection');
      return;
    }

    setIsSubmitting(true);
    setError(null);
    try {
      const response = await fetch(`/api/admin/claims/${claim.id}/reject`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ adminNotes: reason }),
      });

      const data = await response.json();

      if (!response.ok) {
        setError(data.error || 'Failed to reject claim');
        return;
      }

      setSuccess(true);
      setTimeout(() => {
        onSuccess();
        setReason('');
        setSuccess(false);
        onOpenChange();
      }, 1500);
    } catch (error) {
      console.error('Error rejecting claim:', error);
      setError('An error occurred while rejecting the claim');
    } finally {
      setIsSubmitting(false);
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
              <Button color="danger" onPress={handleReject} isLoading={isSubmitting}>
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

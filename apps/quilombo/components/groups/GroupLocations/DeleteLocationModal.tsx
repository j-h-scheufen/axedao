'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { useCallback } from 'react';

import type { GroupLocation } from '@/types/model';

interface DeleteLocationModalProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  location: GroupLocation | null;
  onDelete: () => Promise<void>;
  isDeleting: boolean;
}

const DeleteLocationModal = ({ isOpen, onOpenChange, location, onDelete, isDeleting }: DeleteLocationModalProps) => {
  const handleDelete = useCallback(async () => {
    await onDelete();
  }, [onDelete]);

  const handleClose = useCallback(() => {
    onOpenChange(false);
  }, [onOpenChange]);

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
      <ModalContent>
        <ModalHeader>Delete Location</ModalHeader>
        <ModalBody>
          <p>Are you sure you want to delete the location "{location?.name}"? This action cannot be undone.</p>
        </ModalBody>
        <ModalFooter>
          <Button variant="light" onPress={handleClose} isDisabled={isDeleting}>
            Cancel
          </Button>
          <Button color="danger" onPress={handleDelete} isLoading={isDeleting}>
            Continue
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default DeleteLocationModal;

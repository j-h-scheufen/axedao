'use client';

import { Button, Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@heroui/react';
import { useCallback } from 'react';

import { CreateEventForm } from '@/components/forms/event';
import type { CreateEventForm as CreateEventFormType } from '@/config/validation-schema';

interface EventModalProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  onSubmit: (data: CreateEventFormType | FormData) => Promise<void>;
  isSubmitting: boolean;
}

const CreateEventModal = ({ isOpen, onOpenChange, onSubmit, isSubmitting }: EventModalProps) => {
  const handleClose = useCallback(() => {
    onOpenChange(false);
  }, [onOpenChange]);

  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} size="4xl">
      <ModalContent>
        <ModalHeader>Create New Event</ModalHeader>
        <ModalBody className="lg:max-h-none lg:overflow-visible max-h-[80vh] overflow-y-auto">
          <CreateEventForm onSubmit={onSubmit} isSubmitting={isSubmitting} />
        </ModalBody>
        <ModalFooter>
          <Button variant="light" onPress={handleClose}>
            Cancel
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default CreateEventModal;

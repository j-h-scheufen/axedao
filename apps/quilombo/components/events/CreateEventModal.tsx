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
    <Modal
      isOpen={isOpen}
      onOpenChange={onOpenChange}
      size="4xl"
      scrollBehavior="inside"
      classNames={{
        base: 'max-h-[100dvh] my-0 sm:my-16 mx-0 sm:mx-auto',
        wrapper: 'items-center',
      }}
    >
      <ModalContent className="flex flex-col h-[100dvh] sm:h-auto max-h-[100dvh]">
        <ModalHeader className="flex-shrink-0">Create New Event</ModalHeader>
        <ModalBody className="flex-1 overflow-y-auto overflow-x-hidden min-h-0 px-4 sm:px-6">
          <CreateEventForm
            onSubmit={onSubmit}
            isSubmitting={isSubmitting}
            showSubmitButton={false}
            formId="create-event-form"
          />
        </ModalBody>
        <ModalFooter className="flex-shrink-0 justify-between">
          <Button variant="light" onPress={handleClose}>
            Cancel
          </Button>
          <Button color="primary" type="submit" form="create-event-form" isLoading={isSubmitting}>
            Create Event
          </Button>
        </ModalFooter>
      </ModalContent>
    </Modal>
  );
};

export default CreateEventModal;

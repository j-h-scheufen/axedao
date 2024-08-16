import {
  Button,
  Modal,
  ModalBody,
  ModalContent,
  ModalFooter,
  ModalHeader,
  ModalProps,
  Spinner,
} from '@nextui-org/react';

type Props = Omit<ModalProps, 'children'> & { onDelete: () => Promise<void>; isDeleting: boolean };
const LeaveGroupConfirmationModal = ({ isOpen, onOpenChange, onDelete, isDeleting, ...rest }: Props) => {
  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange} {...rest}>
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">Leave group</ModalHeader>
            <ModalBody>
              <p>Are you sure you want to leave this group?</p>
            </ModalBody>
            <ModalFooter>
              <Button variant="light" onPress={onClose}>
                Close
              </Button>
              <Button
                color="danger"
                variant="light"
                spinner={<Spinner size="sm" color="danger" />}
                isLoading={isDeleting}
                onPress={async () => {
                  await onDelete();
                  onClose();
                }}
              >
                Leave group
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};
export default LeaveGroupConfirmationModal;
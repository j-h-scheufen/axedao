import {
  Button,
  Modal,
  ModalBody,
  ModalContent,
  ModalFooter,
  ModalHeader,
  useDisclosure,
  Spinner,
} from '@heroui/react';

type Props = { deleteGroup: () => Promise<void>; isDeleting: boolean };
const DeleteGroup = ({ deleteGroup, isDeleting }: Props) => {
  const { isOpen, onOpen, onOpenChange } = useDisclosure();
  return (
    <>
      <Button
        variant="light"
        type="button"
        color="danger"
        className="flex w-full items-center"
        onPress={onOpen}
        isLoading={isDeleting}
      >
        Delete group
      </Button>
      <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
        <ModalContent>
          {(onClose) => (
            <>
              <ModalHeader className="flex flex-col gap-1">Delete group</ModalHeader>
              <ModalBody>
                <p>Are you sure you want to delete this group?</p>
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
                    await deleteGroup();
                    onClose();
                  }}
                >
                  Delete group
                </Button>
              </ModalFooter>
            </>
          )}
        </ModalContent>
      </Modal>
    </>
  );
};
export default DeleteGroup;

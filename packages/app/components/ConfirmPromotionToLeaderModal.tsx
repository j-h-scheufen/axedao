import { Button } from '@nextui-org/button';
import { Modal, ModalBody, ModalContent, ModalFooter, ModalHeader } from '@nextui-org/modal';
import { Spinner } from '@nextui-org/spinner';

type Props = { isOpen: boolean; onOpenChange: () => void; onProceed: () => void; isLoading: boolean };
const ConfirmPromotionToLeaderModal = ({ isOpen, onOpenChange, onProceed, isLoading }: Props) => {
  return (
    <Modal isOpen={isOpen} onOpenChange={onOpenChange}>
      <ModalContent>
        {(onClose) => (
          <>
            <ModalHeader className="flex flex-col gap-1">Careful! You will loose control of this group</ModalHeader>
            <ModalBody>
              <p>Promoting an admin to leader will give them control of the group and demote you to an admin.</p>
            </ModalBody>
            <ModalFooter>
              <Button color="danger" variant="light" onPress={onClose}>
                Close
              </Button>
              <Button color="primary" startContent={isLoading ? <Spinner size="sm" /> : null} onPress={onProceed}>
                Proceed
              </Button>
            </ModalFooter>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};
export default ConfirmPromotionToLeaderModal;

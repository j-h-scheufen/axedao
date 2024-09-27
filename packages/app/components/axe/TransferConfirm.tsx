import { Button } from '@nextui-org/button';
import { Modal, ModalBody, ModalContent, ModalFooter, ModalHeader, ModalProps } from '@nextui-org/modal';
import { useEffect, useRef } from 'react';

import { User } from '@/types/model';
import { getUserDisplayName } from '@/utils';

type Props = Omit<ModalProps, 'children'> & {
  to: User | null;
  amount: string;
  onConfirm: () => Promise<void>;
};

const TransferConfirm: React.FC<Props> = ({ to, amount, onConfirm, ...props }) => {
  const { isOpen, onOpenChange } = props;
  const nextButtonRef = useRef<HTMLButtonElement>(null);

  useEffect(() => {
    if (isOpen) nextButtonRef.current?.focus();
  }, [isOpen]);

  if (!to) return null;

  return (
    <div>
      <Modal isOpen={isOpen} onOpenChange={onOpenChange} isDismissable={false} isKeyboardDismissDisabled={true}>
        <ModalContent>
          {(onClose) => (
            <>
              <ModalHeader className="flex flex-col gap-1">Send Axé</ModalHeader>
              <ModalBody>
                <p>
                  You are about to send {amount} Axé to {getUserDisplayName(to)}.
                </p>
                <p>
                  Please confirm you&apos;d like to move ahead by clicking the button below. This will take you to your
                  Silk Wallet to confirm and submit the transaction. Please wait there until you see a confirmation and
                  click the &apos;<i>Close</i>&apos; button to return here.
                </p>
              </ModalBody>
              <ModalFooter>
                <Button color="danger" variant="light" onPress={onClose}>
                  Cancel
                </Button>
                <Button
                  ref={nextButtonRef}
                  color="primary"
                  onPress={() => {
                    onConfirm();
                    onClose();
                  }}
                >
                  NEXT
                </Button>
              </ModalFooter>
            </>
          )}
        </ModalContent>
      </Modal>
    </div>
  );
};

export default TransferConfirm;

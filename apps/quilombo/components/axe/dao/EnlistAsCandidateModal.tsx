'use client';

import { Accordion, AccordionItem } from "@heroui/accordion";
import { Button } from "@heroui/button";
import { Modal, ModalBody, ModalContent, ModalHeader, type ModalProps } from "@heroui/modal";
import { enqueueSnackbar } from 'notistack';
import { useEffect, useMemo, useState } from 'react';
import { useWaitForTransactionReceipt } from 'wagmi';

import ENV from '@/config/environment';
import { useWriteAxeMembershipEnlistAsCandidate } from '@/generated';
import { useLootShares } from '@/hooks/state/dao';
import LootAcquisition from './LootAcquisition';
import { useInvalidateSync } from '@/hooks/useSyncManager';

type Props = Omit<ModalProps, 'children'> & {
  onSuccess: () => void;
};

const EnlistAsCandidateModal: React.FC<Props> = ({ isOpen, onClose, onOpenChange, onSuccess }: Props) => {
  const [isLootAcquisitionExpanded, setIsLootAcquisitionExpanded] = useState<boolean>(false);
  const { balance: lootShares, refetch: refetchLootShares } = useLootShares();
  const hasLootShares = useMemo(() => !!lootShares && lootShares > 0n, [lootShares]);
  const invalidateSync = useInvalidateSync();

  const {
    data: enlistHash,
    isPending: enlistPending,
    writeContract: enlist,
  } = useWriteAxeMembershipEnlistAsCandidate();

  const {
    isSuccess: enlistSuccess,
    error: enlistError,
    isLoading: enlistLoading,
    data: enlistReceipt,
  } = useWaitForTransactionReceipt({ hash: enlistHash });

  // Handle transaction states
  useEffect(() => {
    if (enlistLoading) {
      enqueueSnackbar('Enlisting as candidate. Please wait for confirmation...', {
        autoHideDuration: 3000,
      });
    } else if (enlistSuccess && enlistReceipt) {
      console.log('[DEBUG] Transaction mined in block:', enlistReceipt.blockNumber);
      enqueueSnackbar('Successfully enlisted as candidate!');
      invalidateSync(enlistReceipt);
      onSuccess?.();
    } else if (enlistError) {
      enqueueSnackbar(`Failed to enlist: ${enlistError.message}`, { variant: 'error' });
    }
  }, [enlistLoading, enlistSuccess, enlistError, enlistReceipt, onSuccess, invalidateSync]);

  const handleEnlist = () => {
    enlist({ address: ENV.axeMembershipAddress });
  };

  return (
    <Modal isOpen={isOpen} onClose={onClose} onOpenChange={onOpenChange}>
      <ModalContent>
        {() => (
          <>
            <ModalHeader>Enlist as Council Candidate</ModalHeader>
            <ModalBody className="gap-3">
              <p>
                Council candidates can receive delegated votes from DAO members. The top candidates with the most
                delegations form the council.
              </p>

              {hasLootShares ? (
                <>
                  <p className="text-success">You have loot shares and are eligible to join the Council.</p>
                  <Button color="primary" onPress={handleEnlist} isLoading={enlistPending || enlistLoading}>
                    Enlist as Candidate
                  </Button>
                </>
              ) : (
                <>
                  <p className="text-warning">
                    You don&apos;t have any loot shares, yet. While not required to enlist as candidate, you need 1 loot
                    to claim a council seat if you receive enough delegated votes.
                  </p>
                  <Accordion
                    onExpandedChange={() => {
                      setIsLootAcquisitionExpanded(!isLootAcquisitionExpanded);
                    }}
                  >
                    <AccordionItem
                      key="loot-acquisition"
                      aria-label="Get Loot Shares"
                      title="Get Loot Shares (Optional)"
                    >
                      <div className="py-2">
                        <LootAcquisition variant="compact" onSuccess={refetchLootShares} />
                      </div>
                    </AccordionItem>
                  </Accordion>
                  <Button
                    color="primary"
                    onPress={handleEnlist}
                    isLoading={enlistPending || enlistLoading}
                    disabled={isLootAcquisitionExpanded}
                  >
                    Enlist as Candidate
                  </Button>
                </>
              )}
            </ModalBody>
          </>
        )}
      </ModalContent>
    </Modal>
  );
};

export default EnlistAsCandidateModal;

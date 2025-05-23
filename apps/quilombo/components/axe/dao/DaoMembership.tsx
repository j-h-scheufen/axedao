'use client';

import { Button, useDisclosure } from '@heroui/react';
import type { Address } from 'viem';
import { useAccount } from 'wagmi';
import { useCallback } from 'react';

import ENV from '@/config/environment';
import { useReadAxeMembershipIsMember } from '@/generated';
import { MemberBadge } from './Badges';
import MembershipDonationModal from './MembershipDonationModal';

const DaoMembership: React.FC = () => {
  const account = useAccount();
  const { isOpen, onOpen, onClose } = useDisclosure();

  const { data: isMember = false, refetch: updateIsMember } = useReadAxeMembershipIsMember({
    address: ENV.axeMembershipAddress,
    args: [account.address as Address],
  });

  const handleSuccess = useCallback(() => {
    updateIsMember();
    onClose();
  }, [updateIsMember, onClose]);

  return (
    <div className="flex flex-col w-full items-center">
      <div className="text-2xl mb-1 sm:mb-2">Your Status</div>
      <div className="flex flex-colgap-2 sm:gap-4 w-full items-center">
        {isMember ? (
          <div className="flex w-full justify-center items-center gap-2 sm:gap-4">
            <MemberBadge isMember={isMember} />
            <span>You are a member. Thank you!</span>
          </div>
        ) : (
          <div className="flex flex-col gap-2 sm:gap-4 w-full items-center">
            <span>You&apos;re not a member.</span>
            <span>Donate $10 once for lifetime membership.</span>
            <Button onPress={onOpen} color="primary" className="mt-4 sm:mt-6 w-full max-w-[300px]">
              Join the DAO
            </Button>
          </div>
        )}
        <MembershipDonationModal isOpen={isOpen} onOpenChange={onClose} onDonationSuccess={handleSuccess} />
      </div>
    </div>
  );
};

export default DaoMembership;

'use client';

import { Card } from '@nextui-org/card';
import { ArrowLeftRight } from 'lucide-react';
import { useAtomValue } from 'jotai';

import { incomingCouncilUsersAtom, outgoingCouncilUsersAtom } from '@/hooks/state/dao';
import RequestCouncilUpdateButton from './RequestCouncilUpdateButton';
import UserCard from '@/components/UserCard';

const CouncilSeatExchange: React.FC = () => {
  const { data: incomingCouncilUsers } = useAtomValue(incomingCouncilUsersAtom);
  const { data: outgoingCouncilUsers } = useAtomValue(outgoingCouncilUsersAtom);

  return (
    <div>
      <Card className="p-4 mb-3">
        <div className="flex flex-col gap-3 items-center">
          <h3 className="text-xl font-semibold">Council Seat Exchange</h3>

          <div className="flex items-center gap-8">
            <div className="flex flex-col items-center">
              <h4 className="text-lg mb-2">Outgoing</h4>
              {outgoingCouncilUsers && outgoingCouncilUsers.length > 0 ? (
                outgoingCouncilUsers.map((user) => (
                  <div key={user.walletAddress}>
                    <UserCard user={user} />
                  </div>
                ))
              ) : (
                <div className="text-danger">No members leaving</div>
              )}
            </div>

            <ArrowLeftRight size={24} />

            <div className="flex flex-col items-center">
              <h4 className="text-lg mb-2">Incoming</h4>
              {incomingCouncilUsers && incomingCouncilUsers.length > 0 ? (
                incomingCouncilUsers.map((user) => (
                  <div key={user.walletAddress}>
                    <UserCard user={user} />
                  </div>
                ))
              ) : (
                <div className="text-success">No new members</div>
              )}
            </div>
          </div>

          <p className="text-sm text-default-500 text-center mt-4">
            Council seats are exchanged based on delegation rankings.
          </p>
        </div>
      </Card>

      <RequestCouncilUpdateButton />
    </div>
  );
};

export default CouncilSeatExchange;

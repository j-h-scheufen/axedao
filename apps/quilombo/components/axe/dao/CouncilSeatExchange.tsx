'use client';

import { Card } from '@nextui-org/card';
import { ArrowLeftRight } from 'lucide-react';

const CouncilSeatExchange: React.FC = () => {
  return (
    <Card className="p-4">
      <div className="flex flex-col gap-4 items-center">
        <h3 className="text-xl font-semibold">Council Seat Exchange</h3>

        <div className="flex items-center gap-8">
          {/* Outgoing Members */}
          <div className="flex flex-col items-center">
            <h4 className="text-lg mb-2">Outgoing</h4>
            <div className="text-danger">No members leaving</div>
          </div>

          <ArrowLeftRight size={24} />

          {/* Incoming Members */}
          <div className="flex flex-col items-center">
            <h4 className="text-lg mb-2">Incoming</h4>
            <div className="text-success">No new members</div>
          </div>
        </div>

        <p className="text-sm text-default-500 text-center mt-4">
          Council seats are exchanged based on delegation rankings. Changes take effect after the next council update.
        </p>
      </div>
    </Card>
  );
};

export default CouncilSeatExchange;

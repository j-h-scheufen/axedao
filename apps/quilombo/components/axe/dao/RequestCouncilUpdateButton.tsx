'use client';

import { useCallback } from 'react';
import { Button } from '@nextui-org/button';

import { useReadAxeMembershipCouncilCanRequestCouncilUpdate } from '@/generated';
import { useCouncilUpdateRequest } from '@/hooks/state/dao';
import ENV from '@/config/environment';

export default function RequestCouncilUpdateButton() {
  const {
    data: canRequestUpdate,
    isLoading,
    refetch,
  } = useReadAxeMembershipCouncilCanRequestCouncilUpdate({
    address: ENV.axeMembershipCouncilAddress,
  });
  const { requestUpdate, isPending: isUpdatePending } = useCouncilUpdateRequest({
    onSuccess: useCallback(() => {
      refetch();
    }, [refetch]),
  });

  return (
    <div className="flex flex-col items-center gap-4">
      <p className="text-sm text-gray-500 text-center">
        Every 24 hours, anyone can request for the council to be updated.
      </p>

      <Button
        color="primary"
        className="max-w-[300px] w-full opacity-100 transition-opacity"
        isDisabled={!canRequestUpdate}
        isLoading={isUpdatePending || isLoading}
        onPress={() => requestUpdate()}
      >
        Request Council Update
      </Button>

      {!canRequestUpdate && <p className="text-xs text-gray-400">Last updated &lt; 24 hours ago</p>}
    </div>
  );
}

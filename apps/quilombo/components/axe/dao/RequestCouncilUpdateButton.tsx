'use client';

import { Button } from '@nextui-org/button';
import { useReadAxeMembershipCouncilCanRequestCouncilUpdate } from '@/generated';
import { useCouncilUpdateRequest } from '@/hooks/state/dao';

export default function RequestCouncilUpdateButton() {
  const { requestUpdate, isPending: isUpdatePending } = useCouncilUpdateRequest();
  const { data: canRequestUpdate } = useReadAxeMembershipCouncilCanRequestCouncilUpdate();

  return (
    <div className="flex flex-col items-center gap-4">
      <p className="text-sm text-gray-500 text-center">
        Every 24 hours, anyone can request for the council to be updated.
      </p>

      <Button
        color="primary"
        className="max-w-[400px] w-full opacity-100 transition-opacity"
        isDisabled={!canRequestUpdate}
        isLoading={isUpdatePending}
        onPress={() => requestUpdate()}
      >
        Request Council Update
      </Button>

      {!canRequestUpdate && <p className="text-xs text-gray-400">Last updated &lt; 24 hours ago</p>}
    </div>
  );
}

'use client';

import { FilterChip } from '@/components/filters';

type VerifiedFilterChipProps = {
  verified: boolean;
  onClear: () => void;
  onChipClick?: () => void;
};

/**
 * Filter chip for verified status.
 */
const VerifiedFilterChip = ({ verified, onClear, onChipClick }: VerifiedFilterChipProps) => {
  return (
    <FilterChip
      label="Status"
      items={[verified ? 'Verified' : 'Unverified']}
      onClear={onClear}
      onChipClick={onChipClick}
      maxVisible={1}
    />
  );
};

export default VerifiedFilterChip;

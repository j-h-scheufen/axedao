import { Chip, ChipProps } from '@heroui/react';
import { CircleCheckIcon } from 'lucide-react';

type Props = { verified: boolean } & ChipProps;
const VerificationChip = ({ verified, ...props }: Props) => {
  return (
    <Chip
      {...props}
      size="sm"
      startContent={
        verified ? <CircleCheckIcon size={18} className="[&>circle]:fill-primary stroke-default-100" /> : null
      }
      variant="light"
      color={verified ? 'primary' : 'secondary'}
    >
      {verified ? 'Verified' : 'Unverified'}
    </Chip>
  );
};
export default VerificationChip;

import { Chip, ChipProps } from '@nextui-org/react';
import { CircleCheckIcon } from 'lucide-react';

type Props = { verified: boolean } & ChipProps;
const VerificationChip = ({ verified, ...props }: Props) => {
  return (
    <Chip
      {...props}
      size="sm"
      startContent={
        verified ? <CircleCheckIcon size={18} className="[&>circle]:fill-success stroke-default-100" /> : null
      }
      variant="light"
      color={verified ? 'success' : 'secondary'}
    >
      {verified ? 'Verified' : 'Unverified'}
    </Chip>
  );
};
export default VerificationChip;

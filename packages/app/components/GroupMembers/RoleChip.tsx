import { Chip, ChipProps } from '@nextui-org/chip';

import { GroupMemberRole } from '../../store/groupMembers.store';

const roleColorMap: Record<string, ChipProps['color']> = {
  member: 'default',
  admin: 'secondary',
  leader: 'secondary',
  founder: 'secondary',
};

type Props = { role: GroupMemberRole };
const RoleChip = ({ role }: Props) => {
  return (
    <Chip className="capitalize" color={roleColorMap[role]} size="sm" variant="flat">
      {role}
    </Chip>
  );
};
export default RoleChip;

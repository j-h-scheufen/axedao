import { GroupMemberRole } from '@/store/groupMembers.store';
import { Chip, ChipProps } from '@nextui-org/react';

const roleColorMap: Record<string, ChipProps['color']> = {
  member: 'default',
  admin: 'secondary',
  leader: 'secondary',
  founder: 'secondary',
};

type Props = { role: GroupMemberRole };
const GroupMemberRoleChip = ({ role }: Props) => {
  return (
    <Chip className="capitalize" color={roleColorMap[role]} size="sm" variant="flat">
      {role}
    </Chip>
  );
};
export default GroupMemberRoleChip;

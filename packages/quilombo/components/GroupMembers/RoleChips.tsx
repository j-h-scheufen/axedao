import { Chip, ChipProps } from '@nextui-org/chip';

import { GroupMemberRole } from '@/types/model';

const roleColorMap: Record<string, ChipProps['color']> = {
  member: 'default',
  admin: 'secondary',
  leader: 'secondary',
  founder: 'secondary',
};

type Props = { roles: GroupMemberRole[] };

const RoleChips = ({ roles }: Props) => {
  return (
    <div className="flex flex-wrap gap-1 sm:gap-2">
      {roles.map((role) => (
        <Chip key={role} className="capitalize" color={roleColorMap[role]} size="sm" variant="flat">
          {role}
        </Chip>
      ))}
    </div>
  );
};
export default RoleChips;

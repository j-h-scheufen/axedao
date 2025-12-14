import { Chip } from '@heroui/react';

import type { GroupMemberRole } from '@/types/model';

const roleChipClasses: Record<string, string | string[]> = {
  member: 'default',
  admin: 'bg-secondary-500 dark:bg-secondary-200',
};

type Props = { roles: GroupMemberRole[] };

const RoleChips = ({ roles }: Props) => {
  return (
    <div className="flex flex-wrap gap-1 sm:gap-2">
      {roles.map((role) => (
        <Chip key={role} classNames={{ base: roleChipClasses[role] }} size="sm" variant="flat">
          <span className="capitalize">{role}</span>
        </Chip>
      ))}
    </div>
  );
};
export default RoleChips;

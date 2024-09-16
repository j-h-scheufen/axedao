import { ChipProps } from '@nextui-org/chip';

export const columns = [
  { name: 'USER', uid: 'name', sortable: true },
  { name: 'ROLE', uid: 'role' },
  { name: 'ACTIONS', uid: 'actions' },
] as const;

export type GroupMemberTableColumnKey = (typeof columns)[number]['uid'];

export const roleColorMap: Record<string, ChipProps['color']> = {
  member: 'default',
  admin: 'secondary',
  leader: 'secondary',
  founder: 'secondary',
};

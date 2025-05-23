import { Button } from "@heroui/button";
import { Link } from "@heroui/link";
import { Tooltip } from "@heroui/tooltip";
import { User } from "@heroui/user";
import { useAtomValue } from 'jotai';
import { has } from 'lodash';
import { ArrowDownIcon, ArrowUpIcon, UserXIcon } from 'lucide-react';
import { useCallback, useMemo } from 'react';

import { PATHS } from '@/config/constants';
import { currentUserIdAtom } from '@/hooks/state/currentUser';
import { groupAdminIdsAtom, groupIdAtom, isCurrentUserGroupAdminAtom } from '@/hooks/state/group';
import { useAddAdmin, useRemoveAdmin, useRemoveMember } from '@/hooks/useGroup';
import { GroupMember } from '@/types/model';
import { getImageUrl, getUserDisplayName } from '@/utils';
import RoleChips from './RoleChips';

export const COLUMNS = [
  { name: 'USER', uid: 'name' },
  { name: 'ROLES', uid: 'roles' },
  { name: 'ACTIONS', uid: 'actions' },
] as const;

export type GroupMemberTableColumnKey = (typeof COLUMNS)[number]['uid'];

type Props = { groupMember: GroupMember; columnKey: GroupMemberTableColumnKey };

const TableCellValue = ({ groupMember, columnKey }: Props) => {
  const currentUserId = useAtomValue(currentUserIdAtom);
  const isCurrentUserGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);
  const { data: groupAdminIds } = useAtomValue(groupAdminIdsAtom);
  const groupId = useAtomValue(groupIdAtom);
  const { addAdmin, isPending: isAddAdminPending } = useAddAdmin();
  const { removeAdmin, isPending: isRemoveAdminPending } = useRemoveAdmin();
  const { removeMember, isPending: isRemoveMemberPending } = useRemoveMember();

  const handleAddAdmin = useCallback(
    async (userId: string) => {
      return groupId ? addAdmin({ groupId, userId }) : null;
    },
    [addAdmin, groupId],
  );
  const handleRemoveAdmin = useCallback(
    async (userId: string) => {
      return groupId ? removeAdmin({ groupId, userId }) : null;
    },
    [removeAdmin, groupId],
  );
  const handleRemoveMember = useCallback(
    async (userId: string) => {
      return groupId ? removeMember({ groupId, userId }) : null;
    },
    [removeMember, groupId],
  );

  const { avatar, title, roles, id } = groupMember;
  const isLoggedInUser = useMemo(() => id === currentUserId, [id, currentUserId]);
  const cellValue = has(groupMember, columnKey) ? groupMember[columnKey]?.toString() : null;

  switch (columnKey) {
    case 'name':
      return (
        <Link href={`${PATHS.users}/${id}`} className="text-[unset]">
          <User
            avatarProps={{ radius: 'full', src: getImageUrl(avatar) }}
            name={
              <div className="flex flex-col w-full">
                {title && <span className="text-default-500 capitalize">{title}</span>}
                <div className="flex flex-1 items-center gap-1">
                  <span className="font-semibold leading-none text-default-700 sm:text-large">
                    {getUserDisplayName(groupMember)}
                  </span>
                  {isLoggedInUser ? <span>(You)</span> : null}
                </div>
              </div>
            }
            className="cursor-pointer"
          ></User>
        </Link>
      );
    case 'roles':
      return <RoleChips roles={roles} />;
    case 'actions':
      if (isCurrentUserGroupAdmin) {
        const isAdmin = roles.includes('admin');
        return (
          <div className="relative flex items-center justify-end gap-2">
            {!isAdmin ? (
              <Tooltip content="Make Admin">
                <Button
                  variant="ghost"
                  size="sm"
                  className="text-default-400 h-7 w-7 min-w-7 cursor-pointer active:opacity-50"
                  onPress={() => handleAddAdmin(id)}
                  isLoading={isAddAdminPending}
                  isIconOnly
                >
                  <ArrowUpIcon className="w-4" />
                </Button>
              </Tooltip>
            ) : (
              <Tooltip content="Remove Admin">
                <Button
                  variant="ghost"
                  size="sm"
                  className="text-default-400 h-7 w-7 min-w-7 cursor-pointer active:opacity-50"
                  onPress={() => handleRemoveAdmin(id)}
                  isLoading={isRemoveAdminPending}
                  disabled={isLoggedInUser || (groupAdminIds ? groupAdminIds.length <= 1 : false)}
                  isIconOnly
                >
                  <ArrowDownIcon className="w-4" />
                </Button>
              </Tooltip>
            )}
            <Tooltip content="Remove member from group">
              <Button
                variant="ghost"
                size="sm"
                className="text-default-400 h-7 w-7 min-w-7 cursor-pointer active:opacity-50"
                onPress={() => handleRemoveMember(id)}
                isLoading={isRemoveMemberPending}
                isIconOnly
              >
                <UserXIcon className="w-4" />
              </Button>
            </Tooltip>
          </div>
        );
      }
      return null;
    default:
      return cellValue;
  }
};
export default TableCellValue;

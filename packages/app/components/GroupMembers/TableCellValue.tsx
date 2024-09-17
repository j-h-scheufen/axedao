import { Button } from '@nextui-org/button';
import { Link } from '@nextui-org/link';
import { Tooltip } from '@nextui-org/tooltip';
import { User } from '@nextui-org/user';
import { has } from 'lodash';
import { ArrowDownIcon, ArrowUpIcon, UserXIcon } from 'lucide-react';

import { useProfileUser } from '@/store/profile.store';
import { GroupMember } from '@/types/model';
import { getUserDisplayName } from '@/utils';
import {
  useAdminBeingDemotedToMember,
  useGroupMembersActions,
  useMemberBeingPromotedToAdmin,
  useMemberBeingRemoved,
} from '../../store/groupMembers.store';
import { useIsGroupAdmin } from '../../store/groupProfile.store';
import RoleChips from './RoleChips';
import { GroupMemberTableColumnKey } from './utils';

type Props = { groupMember: GroupMember; columnKey: GroupMemberTableColumnKey };

const TableCellValue = ({ groupMember, columnKey }: Props) => {
  const profile = useProfileUser();
  const isGroupAdmin = useIsGroupAdmin();
  const { promoteToAdmin, demoteToMember, removeMember } = useGroupMembersActions();
  const memberBeingPromotedToAdmin = useMemberBeingPromotedToAdmin();
  const adminBeingDemotedToMember = useAdminBeingDemotedToMember();
  const memberBeingRemoved = useMemberBeingRemoved();

  const { avatar, email, roles, id } = groupMember;
  const isLoggedInUser = id === profile.id;
  const cellValue = has(groupMember, columnKey) ? groupMember[columnKey]?.toString() : null;

  switch (columnKey) {
    case 'name':
      return (
        <Link href={`/search/users/${id}`} className="text-[unset]">
          <User
            avatarProps={{ radius: 'full', src: avatar || '' }}
            description={email}
            name={`${getUserDisplayName(groupMember)} ${isLoggedInUser ? '(You)' : ''}`}
            className="cursor-pointer"
          >
            {email}
          </User>
        </Link>
      );
    case 'roles':
      return <RoleChips roles={roles} />;
    case 'actions':
      if (isGroupAdmin) {
        let promoteTooltipContent, demoteTooltipContent, promote, demote, isPromoting, isDemoting;
        if (roles.includes('admin')) {
          demoteTooltipContent = 'Demote to member';
          demote = demoteToMember;
          isDemoting = adminBeingDemotedToMember ? adminBeingDemotedToMember === id : false;
        } else {
          promoteTooltipContent = 'Promote to admin';
          promote = promoteToAdmin;
          isPromoting = memberBeingPromotedToAdmin === id;
        }
        const isRemoving = memberBeingRemoved === id;
        return (
          <div className="relative flex items-center justify-end gap-2">
            {promote && (
              <Tooltip content={promoteTooltipContent}>
                <Button
                  variant="ghost"
                  size="sm"
                  className="text-default-400 h-7 w-7 min-w-7 cursor-pointer active:opacity-50"
                  onPress={() => promote(id)}
                  isLoading={isPromoting}
                  disabled={!!memberBeingPromotedToAdmin}
                  isIconOnly
                >
                  <ArrowUpIcon className="w-4" />
                </Button>
              </Tooltip>
            )}
            {demote && (
              <Tooltip content={demoteTooltipContent}>
                <Button
                  variant="ghost"
                  size="sm"
                  className="text-default-400 h-7 w-7 min-w-7 cursor-pointer active:opacity-50"
                  onPress={() => demote(id)}
                  isLoading={isDemoting}
                  disabled={!!adminBeingDemotedToMember}
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
                onPress={() => removeMember(id)}
                isLoading={isRemoving}
                disabled={!!memberBeingRemoved}
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

import {
  GroupMember,
  useAdminBeingDemotedToMember,
  useAdminBeingPromotedToLeader,
  useGroupMembersActions,
  useMemberBeingPromotedToAdmin,
} from '@/store/groupMembers.store';
import { Button, Tooltip, User } from '@nextui-org/react';
import { has } from 'lodash';
import { ArrowDownIcon, ArrowUpIcon } from 'lucide-react';
import GroupMemberRoleChip from '../GroupMemberRoleChip';
import { GroupMemberTableColumnKey } from './utils';

type Props = { groupMember: GroupMember; columnKey: GroupMemberTableColumnKey };
const TableCellValue = ({ groupMember, columnKey }: Props) => {
  const { promoteToAdmin, promoteToLeader, demoteToMember } = useGroupMembersActions();
  const memberBeingPromotedToAdmin = useMemberBeingPromotedToAdmin();
  const adminBeingDemotedToMember = useAdminBeingDemotedToMember();
  const adminBeingPromotedToLeader = useAdminBeingPromotedToLeader();

  const { avatar, name, email, role, id } = groupMember;
  const cellValue = has(groupMember, columnKey) ? groupMember[columnKey]?.toString() : null;

  switch (columnKey) {
    case 'name':
      return (
        <User avatarProps={{ radius: 'full', src: avatar || '' }} description={email} name={name}>
          {email}
        </User>
      );
    case 'role':
      return <GroupMemberRoleChip role={role} />;
    case 'actions':
      if (role !== 'founder') {
        let promoteTooltipContent, demoteTooltipContent, promote, demote, isPromoting, isDemoting;
        if (role === 'member') {
          promoteTooltipContent = 'Promote to admin';
          promote = promoteToAdmin;
          isPromoting = memberBeingPromotedToAdmin === id;
        } else if (role === 'admin') {
          promoteTooltipContent = 'Promote to leader';
          promote = promoteToLeader;
          isPromoting = adminBeingPromotedToLeader === id;

          demoteTooltipContent = 'Demote to member';
          demote = demoteToMember;
          isDemoting = adminBeingDemotedToMember ? adminBeingDemotedToMember === id : false;
        }
        return (
          <div className="relative flex items-center justify-end gap-3">
            {promote && (
              <Tooltip content={promoteTooltipContent}>
                <Button
                  variant="ghost"
                  size="sm"
                  className="text-lg text-default-400 cursor-pointer active:opacity-50"
                  onPress={() => promote(id)}
                  isLoading={isPromoting}
                  isIconOnly
                >
                  <ArrowUpIcon className="w-5" />
                </Button>
              </Tooltip>
            )}
            {demote && (
              <Tooltip content={demoteTooltipContent}>
                <Button
                  variant="ghost"
                  size="sm"
                  className="text-lg text-default-400 cursor-pointer active:opacity-50"
                  onPress={() => demote(id)}
                  isLoading={isDemoting}
                  isIconOnly
                >
                  <ArrowDownIcon className="w-5" />
                </Button>
              </Tooltip>
            )}
          </div>
        );
      }
      return null;
    default:
      return cellValue;
  }
};
export default TableCellValue;

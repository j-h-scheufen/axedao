import {
  Chip,
  ChipProps,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
  Tooltip,
  User,
} from '@nextui-org/react';
import { ThumbsDownIcon, ThumbsUpIcon } from 'lucide-react';
import { Key, useCallback } from 'react';

type MembershipRequest = {
  id: number;
  user: {
    id: number;
    email: string;
    name: string;
    nickName: string;
    status: 'accepted' | 'rejected' | 'pending';
    avatar: string;
  };
};

const membershipRequests: MembershipRequest[] = [...Array(10)].map((_, i) => ({
  id: i,
  user: {
    id: i,
    email: 'mia.robinson@example.com',
    name: 'Mia Robinson',
    nickName: 'Nick name',
    status: (['accepted', 'rejected', 'pending'] as const)[i % 3],
    avatar: 'https://i.pravatar.cc/150?img=45',
  },
}));

export const columns = [
  { name: 'USER', uid: 'name', sortable: true },
  { name: 'STATUS', uid: 'status' },
  { name: 'ACTIONS', uid: 'actions' },
];

const statusColorMap: Record<string, ChipProps['color']> = {
  accepted: 'success',
  rejected: 'danger',
  pending: 'secondary',
};

const GroupMembershipRequests = () => {
  const renderCell = useCallback((request: MembershipRequest, columnKey: Key) => {
    const { user } = request;
    const { avatar, email, status } = user;
    const cellValue = user[columnKey as keyof MembershipRequest['user']];

    switch (columnKey) {
      case 'name':
        return (
          <User avatarProps={{ radius: 'full', src: avatar }} description={email} name={cellValue}>
            {email}
          </User>
        );
      case 'status':
        return (
          <Chip className="capitalize" color={statusColorMap[status]} size="sm" variant="flat">
            {cellValue}
          </Chip>
        );
      case 'actions':
        if (status === 'pending')
          return (
            <div className="relative flex items-center justify-end gap-3">
              <Tooltip content="Accept user">
                <span className="text-lg text-default-400 cursor-pointer active:opacity-50">
                  <ThumbsUpIcon className="w-5" />
                </span>
              </Tooltip>
              <Tooltip content="Reject user">
                <span className="text-lg text-default-400 cursor-pointer active:opacity-50">
                  <ThumbsDownIcon className="w-5" />
                </span>
              </Tooltip>
            </div>
          );
        return null;
      default:
        return cellValue;
    }
  }, []);

  return (
    <div>
      <Table aria-label="Example table with custom cells">
        <TableHeader columns={columns}>
          {(column) => (
            <TableColumn
              key={column.uid}
              align={column.uid === 'actions' ? 'center' : 'start'}
              className="last:text-end first:text-left text-center"
            >
              {column.name}
            </TableColumn>
          )}
        </TableHeader>
        <TableBody items={membershipRequests} emptyContent="No membership requests">
          {(item) => (
            <TableRow key={item.id}>
              {(columnKey) => (
                <TableCell className="last:text-end first:text-left text-center">
                  {renderCell(item, columnKey)}
                </TableCell>
              )}
            </TableRow>
          )}
        </TableBody>
      </Table>
    </div>
  );
};
export default GroupMembershipRequests;

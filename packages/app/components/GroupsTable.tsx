'use client';
import { useRouter } from 'next/navigation';
import { Table, TableHeader, TableColumn, TableBody, TableRow, TableCell } from '@nextui-org/table';
import { Avatar } from '@nextui-org/avatar';
import { Link } from '@nextui-org/link';
import groups from '@/data/groups.json';

const GroupsTable = () => {
  const router = useRouter();

  const goToGroup = (id: string | number) => router.push(`/dashboard/groups/${id}`);

  return (
    <Table
      isHeaderSticky
      color="default"
      selectionMode="single"
      aria-label="Groups table"
      classNames={{
        base: 'max-h-[520px] ',
        table: 'min-h-[420px]',
      }}
    >
      <TableHeader>
        <TableColumn>Name</TableColumn>
        <TableColumn>Leader</TableColumn>
        <TableColumn>Email</TableColumn>
        <TableColumn>Phone</TableColumn>
      </TableHeader>
      <TableBody>
        {groups.map((group) => {
          const { id, name, email, logo } = group;
          return (
            <TableRow key={id} className="cursor-pointer" onClick={() => goToGroup(id)}>
              <TableCell>
                <span className="flex items-center gap-2">
                  <Avatar src={logo} size="sm" /> <span>{name}</span>
                </span>
              </TableCell>
              <TableCell>John Doe</TableCell>
              <TableCell>
                <Link showAnchorIcon href={`mailto:${email}`} onClick={(e) => e.preventDefault()}>
                  {email}
                </Link>
              </TableCell>
              <TableCell>
                <Link showAnchorIcon href={`tel:${email}`} onClick={(e) => e.preventDefault()}>
                  +606 772 038 739
                </Link>
              </TableCell>
            </TableRow>
          );
        })}
      </TableBody>
    </Table>
  );
};
export default GroupsTable;

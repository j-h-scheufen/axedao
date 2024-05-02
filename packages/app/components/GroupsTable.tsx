'use client';
import { useRouter } from 'next/navigation';
import { User } from '@nextui-org/user';
import { Table, TableHeader, TableColumn, TableBody, TableRow, TableCell } from '@nextui-org/table';
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
        <TableColumn>Group</TableColumn>
        <TableColumn>Founder</TableColumn>
      </TableHeader>
      <TableBody>
        {groups.map((group) => {
          const { id, name, logo } = group;
          return (
            <TableRow key={id} className="cursor-pointer" onClick={() => goToGroup(id)}>
              <TableCell>
                <User avatarProps={{ src: logo }} description="75 members" name={name}>
                  {name}
                </User>
              </TableCell>
              <TableCell className="text-small">
                <User
                  avatarProps={{ src: 'http://dummyimage.com/100x100.png/555/ffffff' }}
                  description="johndoe@email.com"
                  name="John Doe"
                >
                  John Doe
                </User>
              </TableCell>
            </TableRow>
          );
        })}
      </TableBody>
    </Table>
  );
};
export default GroupsTable;

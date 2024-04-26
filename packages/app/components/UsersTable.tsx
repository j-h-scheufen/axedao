'use client';
import { useRouter } from 'next/navigation';
import { Table, TableHeader, TableColumn, TableBody, TableRow, TableCell } from '@nextui-org/table';
import { Link } from '@nextui-org/link';
import { User } from '@nextui-org/user';

const users = [...Array(100)].map((_, i) => ({
  fullName: 'John Doe',
  nickName: 'JD',
  title: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Odio, quasi quos modi vero vel quaerat in soluta',
  avatar: 'http://dummyimage.com/100x100.png/999/ffffff',
  group: 'The Excellent Group',
  links: ['https://johndoeexample.com'],
  email: 'example7@gmail.com',
  phone: '+606 3893 828',
  id: i,
}));

type Props = {};
const UsersTable = (props: Props) => {
  const router = useRouter();

  const goToGroup = (id: string | number) => router.push(`/groups/${id}`);

  return (
    <Table
      isHeaderSticky
      color="default"
      selectionMode="single"
      aria-label="Example static collection table"
      classNames={{
        base: 'max-h-[520px] ',
        table: 'min-h-[420px]',
      }}
    >
      <TableHeader>
        <TableColumn>Full name</TableColumn>
        <TableColumn>Group</TableColumn>
        <TableColumn>Email</TableColumn>
        <TableColumn>Phone</TableColumn>
      </TableHeader>
      <TableBody>
        {users.map((user) => {
          const { id, avatar, fullName, email, group, phone } = user;
          return (
            <TableRow key={id} className="cursor-pointer" onClick={() => goToGroup(id)}>
              <TableCell>
                <User avatarProps={{ src: avatar, size: 'sm' }} name={fullName} />
              </TableCell>
              <TableCell>{group}</TableCell>
              <TableCell>
                <Link showAnchorIcon href={`mailto:${email}`} onClick={(e) => e.preventDefault()}>
                  {email}
                </Link>
              </TableCell>
              <TableCell>
                <Link showAnchorIcon href={`tel:${phone}`} onClick={(e) => e.preventDefault()}>
                  {phone}
                </Link>
              </TableCell>
            </TableRow>
          );
        })}
      </TableBody>
    </Table>
  );
};
export default UsersTable;

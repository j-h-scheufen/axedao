import { fetchUsers } from '@/db/db';

export default async function UsersPage() {
  const users = await fetchUsers();

  return (
    <section className="flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <div className="flex flex-col gap-2">
        {users.map((user) => (
          <p key={`p=${user.id}`}>{user.nickname}</p>
        ))}
      </div>
    </section>
  );
}

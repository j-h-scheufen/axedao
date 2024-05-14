import { fetchGroups } from '@/db/db';

export default async function GroupsPage() {
  const users = await fetchGroups();

  return (
    <section className="flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <div className="flex flex-col gap-2">
        {users.map((group) => (
          <p key={`p=${group.id}`}>{group.name}</p>
        ))}
      </div>
    </section>
  );
}

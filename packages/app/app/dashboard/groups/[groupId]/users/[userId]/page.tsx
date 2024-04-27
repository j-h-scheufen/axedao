import PageHeading from '@/components/PageHeading';
import UserProfile from '@/components/UserProfile';

const page = () => {
  return (
    <div>
      <PageHeading back="/dashboard/groups/1">Jane Doe</PageHeading>
      <UserProfile />
    </div>
  );
};
export default page;

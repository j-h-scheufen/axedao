import PageHeading from '@/components/PageHeading';
import UserProfile from '@/components/UserProfile';

const Page = () => {
  return (
    <div>
      <PageHeading back="/dashboard/overview?tab=users">John Doe</PageHeading>
      <UserProfile />
    </div>
  );
};
export default Page;

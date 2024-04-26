import PageHeading from '@/components/PageHeading';
import UserProfile from '@/components/UserProfile';

type Props = {};
const page = (props: Props) => {
  return (
    <div>
      <PageHeading back="/dashboard/groups/1">Jane Doe</PageHeading>
      <UserProfile />
    </div>
  );
};
export default page;

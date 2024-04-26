import Admin from '@/components/Admin';
import PageHeading from '@/components/PageHeading';

type Props = {};
const page = (props: Props) => {
  return (
    <div>
      <PageHeading>Admin</PageHeading>
      <Admin />
    </div>
  );
};
export default page;

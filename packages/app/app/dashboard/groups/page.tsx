import PageHeading from '@/components/PageHeading';
import Groups from '@/components/Groups';

type Props = {};
const page = (props: Props) => {
  return (
    <div>
      <PageHeading>Groups</PageHeading>
      <Groups />
    </div>
  );
};
export default page;

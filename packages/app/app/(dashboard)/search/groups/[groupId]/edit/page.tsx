import GroupForm from '@/components/GroupForm';
import PageHeading from '@/components/PageHeading';
import { PATHS } from '@/config/constants';

type Props = { params: { groupId: string } };
const page = ({ params: { groupId = '' } }: Props) => {
  return (
    <>
      <PageHeading back={`${PATHS.groups}/${groupId}`}>Edit group</PageHeading>
      <GroupForm id={groupId} />
    </>
  );
};
export default page;

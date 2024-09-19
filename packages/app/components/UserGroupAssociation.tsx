import GroupCard from '@/components/GroupCard';
import { Group } from '@/types/model';

type Props = {
  group: Group | null;
};

const UserGroupAssociation = ({ group }: Props) => {
  return group ? (
    <GroupCard className="mx-auto sm:mx-0 md:max-w-80" group={group} />
  ) : (
    <div className="text-default-500 text-sm">User has no group association</div>
  );
};
export default UserGroupAssociation;

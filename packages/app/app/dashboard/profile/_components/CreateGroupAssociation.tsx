'use client';

import CreateNewGroupForm from '@/app/dashboard/profile/_components/CreateNewGroupForm';
import JoinGroupForm from '@/app/dashboard/profile/_components/JoinGroupForm';
import { Tab, Tabs } from '@nextui-org/tabs';
import CreateGroupAssociationSkeleton from './skeletons';

type Props = { isLoading?: boolean };

const CreateGroupAssociation = ({ isLoading = false }: Props) => {
  if (isLoading) return <CreateGroupAssociationSkeleton />;
  return (
    <div className="max-w-lg">
      <Tabs variant="bordered" aria-label="Options">
        <Tab key="join-a-group" title="Join a group">
          <JoinGroupForm />
        </Tab>
        <Tab key="create-group" title="Create new group">
          <CreateNewGroupForm />
        </Tab>
      </Tabs>
    </div>
  );
};
export default CreateGroupAssociation;

'use client';

import CreateNewGroupForm from '@/app/dashboard/profile/_components/CreateNewGroupForm';
import JoinGroupForm from '@/app/dashboard/profile/_components/JoinGroupForm';
import { Tab, Tabs } from '@nextui-org/tabs';
import CreateGroupAssociationSkeleton from './skeletons';

type Props = { onSubmit?: () => void | null; isLoading?: boolean };

const CreateGroupAssociation = ({ onSubmit, isLoading = false }: Props) => {
  if (isLoading) return <CreateGroupAssociationSkeleton />;
  return (
    <div className="max-w-lg">
      <Tabs variant="bordered" aria-label="Options">
        <Tab key="join-a-group" title="Join a group">
          <JoinGroupForm onSubmit={onSubmit} />
        </Tab>
        <Tab key="create-group" title="Create new group">
          <CreateNewGroupForm onSubmit={onSubmit} />
        </Tab>
      </Tabs>
    </div>
  );
};
export default CreateGroupAssociation;

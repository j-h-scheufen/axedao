'use client';

import { Tab, Tabs } from '@nextui-org/tabs';
import { ReactNode } from 'react';
import CreateNewGroupForm from './CreateNewGroupForm';
import JoinGroupForm from './JoinGroupForm';
import CreateGroupAssociationSkeleton from './skeletons/CreateGroupAssociationSkeleton';

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null; isLoading?: boolean };

const CreateGroupAssociation = ({ secondaryButton, onSubmit, isLoading = false }: Props) => {
  if (isLoading) return <CreateGroupAssociationSkeleton />;
  return (
    <div className="max-w-lg">
      <Tabs variant="bordered" aria-label="Options">
        <Tab key="join-a-group" title="Join a group">
          <JoinGroupForm secondaryButton={secondaryButton} onSubmit={onSubmit} />
        </Tab>
        <Tab key="create-group" title="Create new group">
          <CreateNewGroupForm secondaryButton={secondaryButton} onSubmit={onSubmit} />
        </Tab>
      </Tabs>
    </div>
  );
};
export default CreateGroupAssociation;

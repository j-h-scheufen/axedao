'use client';

import { Tab, Tabs } from '@heroui/react';

import CreateGroupAssociationSkeleton from '@/components/skeletons/ProfileSkeletons';
import CreateNewGroupForm from '@/components/groups/CreateNewGroupForm';
import JoinGroupForm from '@/components/forms/group/JoinGroupForm';

type Props = { isLoading?: boolean };

const CreateGroupAssociation = ({ isLoading = false }: Props) => {
  if (isLoading) return <CreateGroupAssociationSkeleton />;
  return (
    <div className="max-w-lg">
      <Tabs
        variant="bordered"
        aria-label="Options"
        classNames={{
          panel: 'px-0', // Remove default horizontal padding from tab panels
        }}
      >
        <Tab key="join-a-group" title="Join existing group">
          <JoinGroupForm />
        </Tab>
        <Tab key="create-group" title="Register a new group">
          <CreateNewGroupForm />
        </Tab>
      </Tabs>
    </div>
  );
};
export default CreateGroupAssociation;

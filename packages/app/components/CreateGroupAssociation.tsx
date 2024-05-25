'use client';

import { ReactNode } from 'react';
import { Tabs, Tab } from '@nextui-org/tabs';
import CreateNewGroupForm from './CreateNewGroupForm';
import JoinGroupForm from './JoinGroupForm';

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null };

const CreateGroupAssociation = ({ secondaryButton, onSubmit }: Props) => {
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

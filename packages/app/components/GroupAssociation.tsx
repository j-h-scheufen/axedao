'use client';

import { useState } from 'react';
import GroupCard from './GroupCard';
import JoinGroup from './JoinGroup';
import { Button } from '@nextui-org/button';

const GroupAssociation = () => {
  const [editing, setEditing] = useState<boolean>(false);

  return (
    <div>
      {editing ? (
        <JoinGroup
          onSubmit={() => setEditing(false)}
          secondaryButton={
            <Button variant="bordered" onClick={() => setEditing(false)}>
              Cancel
            </Button>
          }
        />
      ) : (
        <GroupCard change={() => setEditing(true)} />
      )}
    </div>
  );
};
export default GroupAssociation;

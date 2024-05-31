'use client';

import { useState } from 'react';
// import GroupCard from './GroupCard';
import CreateGroupAssociation from './CreateGroupAssociation';
import { Button } from '@nextui-org/button';

const GroupAssociation = () => {
  const [editing, setEditing] = useState<boolean>(false);

  return (
    <div>
      {
        editing ? (
          <CreateGroupAssociation
            onSubmit={() => setEditing(false)}
            secondaryButton={
              <Button variant="bordered" onClick={() => setEditing(false)}>
                Cancel
              </Button>
            }
          />
        ) : null
        // <GroupCard className="mx-auto sm:mx-0 md:max-w-80" change={() => setEditing(true)} />
      }
    </div>
  );
};
export default GroupAssociation;

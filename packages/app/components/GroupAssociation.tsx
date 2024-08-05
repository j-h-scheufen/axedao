'use client';
import { useGroupProfile, useGroupProfileActions, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import { useIsInitializingProfile, useIsProfileInitialized, useProfile } from '@/store/profile.store';
import { getGroupMemberRole } from '@/utils';
import { Button } from '@nextui-org/button';
import { capitalize } from 'lodash';
import { useEffect, useState } from 'react';
import CreateGroupAssociation from './CreateGroupAssociation';
import GroupCard from './GroupCard';
import GroupRequestCard from './GroupRequestCard';

const GroupAssociation = () => {
  const [editing, setEditing] = useState<boolean>(false);
  const profile = useProfile();

  const { group_id } = profile;
  const isInitializingProfile = useIsInitializingProfile();
  const isProfileInitialized = useIsProfileInitialized();
  const groupProfile = useGroupProfile();
  const groupProfileActions = useGroupProfileActions();
  const isInitializingGroupProfile = useIsInitializingGroupProfile();

  useEffect(() => {
    if (!group_id) return;
    groupProfileActions.initialize(group_id);
  }, [group_id, groupProfileActions]);

  const isLoading = (!group_id && !isProfileInitialized) || isInitializingProfile || isInitializingGroupProfile;
  const hasNoGroup = editing || !(group_id && !isInitializingProfile);
  const hasPendingGroupRequest = false;

  if (hasPendingGroupRequest) return <GroupRequestCard />;

  if (hasNoGroup)
    return (
      <CreateGroupAssociation
        // onSubmit={() => console.log('creating group assocition')}
        secondaryButton={
          group_id && (
            <Button variant="bordered" onClick={() => setEditing(false)}>
              Cancel
            </Button>
          )
        }
        isLoading={isLoading}
      />
    );

  const groupMemberRole = getGroupMemberRole(profile.id, groupProfile);

  return (
    <GroupCard
      group={groupProfile}
      className="mx-auto sm:mx-0 md:max-w-80"
      startFooter={
        <Button size="sm" variant="light" color="secondary" className="pointer-events-none">
          {capitalize(groupMemberRole)}
        </Button>
      }
      isLoading={isLoading}
    />
  );
};
export default GroupAssociation;

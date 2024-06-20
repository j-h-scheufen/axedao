'use client';
import { useGroupProfile, useGroupProfileActions, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import {
  useIsExitingGroup,
  useIsInitializingProfile,
  useIsProfileInitialized,
  useProfile,
  useProfileActions,
} from '@/store/profile.store';
import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/react';
import { useEffect, useState } from 'react';
import CreateGroupAssociation from './CreateGroupAssociation';
import GroupCard from './GroupCard';

const GroupAssociation = () => {
  const [editing, setEditing] = useState<boolean>(false);
  const profile = useProfile();
  const profileActions = useProfileActions();
  const isExitingGroup = useIsExitingGroup();

  const { group_id } = profile;
  const isInitializingProfile = useIsInitializingProfile();
  const isProfileInitialized = useIsProfileInitialized();
  const groupProfile = useGroupProfile();
  const groupProfileActions = useGroupProfileActions();
  const isInitializingGroupProfile = useIsInitializingGroupProfile();

  useEffect(() => {
    if (!group_id) return;
    groupProfileActions.initialize(group_id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [group_id]);

  if (editing || !(group_id && !isInitializingProfile))
    return (
      <CreateGroupAssociation
        onSubmit={() => console.log('creating group assocition')}
        secondaryButton={
          group_id && (
            <Button variant="bordered" onClick={() => setEditing(false)}>
              Cancel
            </Button>
          )
        }
      />
    );

  return (
    <GroupCard
      group={groupProfile}
      className="mx-auto sm:mx-0 md:max-w-80"
      startFooter={
        <Button
          variant="light"
          size="sm"
          color="danger"
          onPress={profileActions.exitGroup}
          spinner={<Spinner size="sm" color="danger" />}
          isLoading={isExitingGroup}
        >
          Exit group
        </Button>
      }
      isLoading={(!group_id && !isProfileInitialized) || isInitializingProfile || isInitializingGroupProfile}
    />
  );
};
export default GroupAssociation;

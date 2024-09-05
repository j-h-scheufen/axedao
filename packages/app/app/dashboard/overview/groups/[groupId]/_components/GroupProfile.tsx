'use client';

import ContactInfo from '@/components/ContactInfo';
import PageHeading from '@/components/PageHeading';
import SubsectionHeading from '@/components/SubsectionHeading';
import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import { Suspense, useEffect } from 'react';
import { useGroupProfile, useGroupProfileActions } from '../store/groupProfile.store';
import GroupActions from './GroupActions';
import GroupBanner from './GroupBanner';

import UserCard from '@/components/UserCard';
import { isUUID } from '@/utils';
import { useIsInitializingUser, useUser, useUserActions } from '../../../users/[userId]/store';
import GroupDescription from './GroupDescription';
import GroupMembers from './GroupMembers';

type Props = { id: string };
const GroupProfile = ({ id }: Props) => {
  const groupProfileActions = useGroupProfileActions();
  const groupProfile = useGroupProfile();

  const { name, logo, links, founder } = groupProfile;
  const isFounderUUID = founder && isUUID(founder);

  const userActions = useUserActions();
  const founderProfile = useUser();
  const isFetchingFounderProfile = useIsInitializingUser();

  useEffect(() => {
    if (!founder || !isFounderUUID) return;
    userActions.initializeUser(founder);
  }, [userActions, founder, isFounderUUID]);

  useEffect(() => {
    groupProfileActions.initialize(id);
  }, [groupProfileActions, id]);

  return (
    <Suspense>
      <PageHeading back="/dashboard/overview?tab=groups">{name}</PageHeading>
      <GroupActions />
      <GroupBanner />
      <div className="mt-5 xs:flex xs:gap-5">
        <Avatar
          showFallback
          src={logo || undefined}
          fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="mx-auto mb-5 block aspect-square h-full max-h-20 w-full max-w-20 xs:mx-0 xs:mb-0 xs:inline-block"
        />
        <div className="flex-1">
          <GroupDescription />
          <ContactInfo links={links} />
        </div>
      </div>
      <SubsectionHeading>Founder</SubsectionHeading>
      <div className="text-default-500">
        {isFounderUUID ? <UserCard user={founderProfile} isLoading={isFetchingFounderProfile} /> : founder}
      </div>
      <SubsectionHeading>Members</SubsectionHeading>
      <GroupMembers id={id} />
    </Suspense>
  );
};
export default GroupProfile;

'use client';

import ContactInfo from '@/components/ContactInfo';
import PageHeading from '@/components/PageHeading';
import SubsectionHeading from '@/components/SubsectionHeading';
import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import { useEffect } from 'react';
import { useGroupProfile, useGroupProfileActions, useIsInitializingGroupProfile } from '../store/groupProfile.store';
import GroupActions from './GroupActions';
import GroupBanner from './GroupBanner';
import GroupDescription from './GroupDescription';
import GroupMembers from './GroupMembers';

type Props = { id: string };
const GroupProfile = ({ id }: Props) => {
  const groupProfileActions = useGroupProfileActions();
  const groupProfile = useGroupProfile();
  const isLoading = useIsInitializingGroupProfile();

  useEffect(() => {
    groupProfileActions.initialize(id);
  }, [groupProfileActions, id]);

  const { name, logo, links } = groupProfile;

  return (
    <>
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
          <ContactInfo links={links} isLoading={isLoading} />
        </div>
      </div>
      <SubsectionHeading>Members</SubsectionHeading>
      <GroupMembers id={id} />
    </>
  );
};
export default GroupProfile;

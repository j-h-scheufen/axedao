'use client';

import { useGroupProfile, useGroupProfileActions, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import { Avatar } from '@nextui-org/avatar';
import { Tab, Tabs } from '@nextui-org/tabs';
import { Camera } from 'lucide-react';
import { useEffect } from 'react';
import ContactInfo from './ContactInfo';
import GroupActions from './GroupActions';
import GroupBanner from './GroupBanner';
import GroupDescription from './GroupDescription';
import GroupMembers from './GroupMembers';
import GroupMembershipRequests from './GroupMembershipRequests';
import PageHeading from './PageHeading';
import SubsectionHeading from './SubsectionHeading';

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
          <SubsectionHeading className="mt-0 text-default-400 mb-2">Description</SubsectionHeading>
          <GroupDescription />
          <ContactInfo links={links} isLoading={isLoading} />
        </div>
      </div>
      <Tabs variant="bordered" aria-label="Options" classNames={{ tabList: 'mb-3 mt-8' }}>
        <Tab key="members" title="Members">
          <GroupMembers id={id} />
        </Tab>
        <Tab key="membership-requests" title="Membership requests">
          <GroupMembershipRequests />
        </Tab>
      </Tabs>
    </>
  );
};
export default GroupProfile;

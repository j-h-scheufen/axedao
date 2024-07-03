'use client';

import { useGroupProfile, useGroupProfileActions, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import { useEffect } from 'react';
import ContactInfo from './ContactInfo';
import GroupActions from './GroupActions';
import GroupBanner from './GroupBanner';
import GroupMembers from './GroupMembers';
import PageHeading from './PageHeading';
import SectionHeading from './SectionHeading';
import SubsectionHeading from './SubsectionHeading';

type Props = { id: string };
const GroupProfile = ({ id }: Props) => {
  const groupProfileActions = useGroupProfileActions();
  const groupProfile = useGroupProfile();
  const isLoading = useIsInitializingGroupProfile();

  useEffect(() => {
    groupProfileActions.initialize(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const { name, banner, logo, links, description } = groupProfile;

  return (
    <>
      <PageHeading back="/dashboard/overview?tab=groups">{name}</PageHeading>
      <GroupBanner banner={banner} isLoading={isLoading} />
      <GroupActions />
      <div className="mt-5 xs:flex xs:gap-5">
        <Avatar
          showFallback
          src={logo || undefined}
          fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="mx-auto mb-5 block aspect-square h-full max-h-20 w-full max-w-20 xs:mx-0 xs:mb-0 xs:inline-block"
        />
        <div>
          <SubsectionHeading className="mt-0 text-default-400 mb-2">Description</SubsectionHeading>
          <p className="text-center text-small text-default-500 xs:text-left mb-5">{description}</p>
          <ContactInfo links={links} isLoading={isLoading} />
        </div>
      </div>
      <SectionHeading>Members</SectionHeading>
      <GroupMembers id={id} />
    </>
  );
};
export default GroupProfile;

'use client';

import { useGroupProfile, useGroupProfileActions } from '@/store/groupProfile.store';
import { useProfile } from '@/store/profile.store';
import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import { useEffect } from 'react';
import ContactInfo from './ContactInfo';
import GroupBanner from './GroupBanner';
import GroupMembers from './GroupMembers';
import PageHeading from './PageHeading';
import SectionHeading from './SectionHeading';

type Props = { id: string };
const GroupProfile = ({ id }: Props) => {
  const { id: userId } = useProfile();
  const groupProfileActions = useGroupProfileActions();
  const groupProfile = useGroupProfile();

  useEffect(() => {
    groupProfileActions.initialize(id);
  }, [id, groupProfileActions]);

  const { name, banner, logo, links, description, founder } = groupProfile;

  const isFounder = userId === founder;

  return (
    <>
      <PageHeading back="/dashboard/overview?tab=groups">{name}</PageHeading>
      <GroupBanner banner={banner} isFounder={isFounder} />
      <div className="mt-5 xs:flex xs:gap-5">
        <Avatar
          showFallback
          src={logo || undefined}
          fallback={<Camera className="h-8 w-8 animate-pulse text-default-500" strokeWidth={1} size={20} />}
          className="mx-auto mb-5 block aspect-square h-full max-h-20 w-full max-w-20 xs:mx-0 xs:mb-0 xs:inline-block"
        />
        <ContactInfo links={links} />
      </div>
      <p className="mt-5 text-center text-small xs:text-left">{description}</p>
      <SectionHeading>Members</SectionHeading>
      <GroupMembers id={id} />
    </>
  );
};
export default GroupProfile;
'use client';

import { Avatar } from '@nextui-org/avatar';
import { Camera } from 'lucide-react';
import ContactInfo from './ContactInfo';
import SectionHeading from './SectionHeading';
import GroupMembers from './GroupMembers';
import GroupBanner from './GroupBanner';
import {
  useGroupProfile,
  useGroupProfileActions,
  // useGroupProfileIsInitialized,
  // useGroupProfileIsLoading,
} from '@/store/groupProfile.store';
import { useEffect } from 'react';
import PageHeading from './PageHeading';

type Props = { id: string };
const GroupProfile = ({ id }: Props) => {
  const groupProfileActions = useGroupProfileActions();
  const groupProfile = useGroupProfile();
  // const isLoading = useGroupProfileIsLoading();
  // const initialized = useGroupProfileIsInitialized();

  useEffect(() => {
    groupProfileActions.initialize(id);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id]);

  const { name, banner, logo, links, description } = groupProfile;

  return (
    <>
      <PageHeading back="/dashboard/overview?tab=groups">{name}</PageHeading>
      <GroupBanner banner={banner} />
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

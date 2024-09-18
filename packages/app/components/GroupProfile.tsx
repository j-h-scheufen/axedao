'use client';

import { Avatar } from '@nextui-org/avatar';
import { Link } from '@nextui-org/link';
import { Camera } from 'lucide-react';
import { Suspense, useEffect } from 'react';

import ContactInfo from '@/components/ContactInfo';
import PageHeading from '@/components/PageHeading';
import SubsectionHeading from '@/components/SubsectionHeading';
import { GroupProfile as GroupProfileType } from '@/types/model';
import { isUUID } from '@/utils';
import { Spinner } from '@nextui-org/spinner';
import { useGroupProfile, useGroupProfileActions } from '../store/groupProfile.store';
import GroupActions from './GroupActions';
import GroupBanner from './GroupBanner';
import GroupDescription from './GroupDescription';
import GroupMembers from './GroupMembers';
import UserCardWithFetch from './UserCardDynamic';

type Props = { profile: GroupProfileType };

const GroupProfile = ({ profile }: Props) => {
  const { setGroupProfile } = useGroupProfileActions();
  const groupProfile = useGroupProfile();

  const {
    group: { name, logo, founder, email, description },
    links,
  } = groupProfile;
  const isFounderUUID = !!founder && isUUID(founder);

  useEffect(() => {
    if (!groupProfile || groupProfile.group.id !== profile.group.id) setGroupProfile(profile);
  }, [groupProfile, profile, setGroupProfile]);

  return (
    <Suspense fallback={<Spinner />}>
      <PageHeading back="/search?tab=groups">{name}</PageHeading>
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
          <GroupDescription description={description} />
          {email && (
            <Link href={`mailto:${email}`} className="text-small tracking-tight text-default-400">
              {email}
            </Link>
          )}
          <ContactInfo links={links} />
        </div>
      </div>
      <SubsectionHeading>Founder</SubsectionHeading>
      {isFounderUUID ? <UserCardWithFetch userId={founder} /> : <div className="text-default-500">founder</div>}
      <SubsectionHeading>Members</SubsectionHeading>
      <GroupMembers id={profile.group.id} />
    </Suspense>
  );
};

export default GroupProfile;

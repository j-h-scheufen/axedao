'use client';

import { Avatar } from '@nextui-org/avatar';
import { Link } from '@nextui-org/link';
import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';
import { Camera } from 'lucide-react';
import { Suspense } from 'react';

import ContactInfo from '@/components/ContactInfo';
import PageHeading from '@/components/PageHeading';
import SubsectionHeading from '@/components/SubsectionHeading';
import { isFounderUuidAtom } from '@/hooks/state/group';
import { initGroup } from '@/hooks/useGroup';
import GroupActions from './GroupActions';
import GroupBanner from './GroupBanner';
import GroupDescription from './GroupDescription';
import GroupMembers from './GroupMembers';
import UserCardWithFetch from './UserCardWithFetch';

type Props = { groupId: string };

const GroupProfile = ({ groupId }: Props) => {
  const { groupProfile } = initGroup(groupId);
  const isFounderUUID = useAtomValue(isFounderUuidAtom);
  if (!groupProfile) return <Spinner />;
  const {
    group: { name, logo, founder, email, description, links },
  } = groupProfile;

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
      {isFounderUUID ? <UserCardWithFetch userId={founder!} /> : <div className="text-default-500">founder</div>}
      <SubsectionHeading>Members</SubsectionHeading>
      <GroupMembers />
    </Suspense>
  );
};

export default GroupProfile;

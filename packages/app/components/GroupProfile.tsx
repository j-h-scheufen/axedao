'use client';

import { Avatar } from '@nextui-org/avatar';
import { Link } from '@nextui-org/link';
import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';
import { Camera } from 'lucide-react';

import ContactInfo from '@/components/ContactInfo';
import PageHeading from '@/components/PageHeading';
import SubsectionHeading from '@/components/SubsectionHeading';
import { PATHS } from '@/config/constants';
import { groupAtom, groupLogoUrlAtom, isFounderUuidAtom } from '@/hooks/state/group';
import { useInitGroup } from '@/hooks/useGroup';
import GroupActions from './GroupActions';
import GroupBanner from './GroupBanner';
import GroupDescription from './GroupDescription';
import GroupMembers from './GroupMembers';
import UserCardWithFetch from './UserCardWithFetch';

type Props = { groupId: string };

const GroupProfile = ({ groupId }: Props) => {
  useInitGroup(groupId); // TODO the init needs either hydrateAtoms or a Jotai Provider in the layout
  const group = useAtomValue(groupAtom);
  const isFounderUUID = useAtomValue(isFounderUuidAtom);
  const logoUrl = useAtomValue(groupLogoUrlAtom);
  if (!group) return <Spinner />;
  const { name, founder, email, description, links } = group;

  return (
    <>
      <PageHeading back={`${PATHS.search}?tab=groups`}>{name}</PageHeading>
      <GroupActions />
      <GroupBanner />
      <div className="mt-5 xs:flex xs:gap-5">
        <Avatar
          showFallback
          src={logoUrl || undefined}
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
    </>
  );
};

export default GroupProfile;

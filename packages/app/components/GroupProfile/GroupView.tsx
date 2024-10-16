'use client';

import { Link } from '@nextui-org/link';
import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';

import ContactInfo from '@/components/ContactInfo';
import GroupMembers from '@/components/GroupMembers';
import PageHeading from '@/components/PageHeading';
import SubsectionHeading from '@/components/SubsectionHeading';
import UserCardWithFetch from '@/components/UserCardWithFetch';
import { PATHS } from '@/config/constants';
import { groupAtom, isFounderUuidAtom } from '@/hooks/state/group';
import { getImageUrl } from '@/utils';
import { GroupActions, GroupBanner, GroupDescription, GroupLogo } from '.';

const GroupView = () => {
  const { data: group, isFetching } = useAtomValue(groupAtom);
  const isFounderUuid = useAtomValue(isFounderUuidAtom);

  if (!group || isFetching) return <Spinner />;
  return (
    <div className="relative">
      <PageHeading back={`${PATHS.search}?tab=groups`}>{group.name}</PageHeading>
      <GroupBanner />
      <div className="mt-5 xs:flex xs:gap-5">
        <GroupLogo url={getImageUrl(group.logo)} />
        <div className="">
          <GroupDescription description={group.description} />
          {group.email && (
            <Link href={`mailto:${group.email}`} className="text-small tracking-tight text-default-400">
              {group.email}
            </Link>
          )}
          <ContactInfo links={group.links} />
        </div>
      </div>
      <GroupActions />
      <SubsectionHeading>Founder</SubsectionHeading>
      {group.founder && isFounderUuid ? (
        <UserCardWithFetch userId={group.founder!} />
      ) : (
        <div className="text-default-500">{group.founder}</div>
      )}
      <SubsectionHeading>Members</SubsectionHeading>
      <GroupMembers />
    </div>
  );
};

export default GroupView;

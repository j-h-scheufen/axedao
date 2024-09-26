import { dehydrate, HydrationBoundary, QueryClient } from '@tanstack/react-query';
import { Link } from 'lucide-react';
import { notFound } from 'next/navigation';

import ContactInfo from '@/components/ContactInfo';
import GroupMembers from '@/components/GroupMembers';
import {
  GroupActions,
  GroupBanner,
  GroupDescription,
  GroupLogo,
  GroupProfileClientState,
} from '@/components/GroupProfile';
import PageHeading from '@/components/PageHeading';
import SubsectionHeading from '@/components/SubsectionHeading';
import UserCardWithFetch from '@/components/UserCardWithFetch';
import { PATHS } from '@/config/constants';
import { fetchGroupProfile } from '@/db';
import { QUERY_KEYS } from '@/query';
import { getImageUrl, isUUID } from '@/utils';

type Props = { params: { groupId: string } };

const GroupProfilePage = async ({ params: { groupId } }: Props) => {
  if (!groupId) throw Error('This page must be placed on a dynamic path containing [groupId]');
  const profile = await fetchGroupProfile(groupId);
  if (!profile) throw notFound();

  const queryClient = new QueryClient();
  queryClient.setQueryData([QUERY_KEYS.group.getGroup, groupId], profile.group);
  queryClient.setQueryData([QUERY_KEYS.group.getGroupProfile, groupId], profile);
  const dehydratedState = dehydrate(queryClient);
  queryClient.clear(); // should help with memory usage

  const { name, founder, email, description, links, logo } = profile.group;

  return (
    <HydrationBoundary state={dehydratedState}>
      <div className="relative">
        <PageHeading back={`${PATHS.search}?tab=groups`}>{name}</PageHeading>
        <GroupBanner />
        <div className="mt-5 xs:flex xs:gap-5">
          <GroupLogo url={getImageUrl(logo)} />
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
        <GroupProfileClientState groupId={groupId}>
          <GroupActions />
          <SubsectionHeading>Founder</SubsectionHeading>
          {founder && isUUID(founder) ? (
            <UserCardWithFetch userId={founder!} />
          ) : (
            <div className="text-default-500">{founder}</div>
          )}
          <SubsectionHeading>Members</SubsectionHeading>
          <GroupMembers />
        </GroupProfileClientState>
      </div>
    </HydrationBoundary>
  );
};

export default GroupProfilePage;

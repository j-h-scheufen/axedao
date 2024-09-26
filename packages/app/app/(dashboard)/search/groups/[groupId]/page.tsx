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
import { fetchGroup, fetchGroupAdminIds, fetchGroupMembers } from '@/db';
import { QUERY_KEYS } from '@/query';
import { getImageUrl, isUUID } from '@/utils';

type Props = { params: { groupId: string } };

const GroupProfilePage = async ({ params: { groupId } }: Props) => {
  if (!groupId) throw Error('This page must be placed on a dynamic path containing [groupId]');
  const group = await fetchGroup(groupId);
  const adminIds = await fetchGroupAdminIds(groupId);
  const groupMembers = await fetchGroupMembers(groupId);
  if (!group) throw notFound();

  const queryClient = new QueryClient();
  queryClient.setQueryData([QUERY_KEYS.group.getGroup, groupId], group);
  queryClient.setQueryData([QUERY_KEYS.group.getGroupAdmins], adminIds);
  queryClient.setQueryData([QUERY_KEYS.group.getGroupMembers], groupMembers);
  const dehydratedState = dehydrate(queryClient);
  queryClient.clear(); // should help with memory usage

  const { name, founder, email, description, links, logo } = group;

  return (
    <HydrationBoundary state={dehydratedState}>
      <GroupProfileClientState groupId={groupId} />

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
        <GroupActions />
        <SubsectionHeading>Founder</SubsectionHeading>
        {founder && isUUID(founder) ? (
          <UserCardWithFetch userId={founder!} />
        ) : (
          <div className="text-default-500">{founder}</div>
        )}
        <SubsectionHeading>Members</SubsectionHeading>
        <GroupMembers />
      </div>
    </HydrationBoundary>
  );
};

export default GroupProfilePage;

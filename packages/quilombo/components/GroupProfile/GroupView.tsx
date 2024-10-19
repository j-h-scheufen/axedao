'use client';

import { Link } from '@nextui-org/link';
import { Spinner } from '@nextui-org/spinner';
import { useAtomValue } from 'jotai';
import { MailIcon } from 'lucide-react';

import ContactInfo from '@/components/ContactInfo';
import GroupMembers from '@/components/GroupMembers';
import SubsectionHeading from '@/components/SubsectionHeading';
import UserCardWithFetch from '@/components/UserCardWithFetch';
import { groupAtom, isFounderUuidAtom } from '@/hooks/state/group';
import { getImageUrl } from '@/utils';
import { GroupActions, GroupBanner, GroupLogo } from '.';

const GroupView = () => {
  const { data: group, isFetching } = useAtomValue(groupAtom);
  const isFounderUuid = useAtomValue(isFounderUuidAtom);

  if (!group || isFetching) return <Spinner />;
  return (
    <>
      <GroupBanner />
      {/* Repeating relevant attributes from (main) layout */}
      <div className="flex flex-col px-3 mt-4 gap-2 sm:gap-3">
        <div className="flex gap-3 sm:gap-4 w-full">
          <GroupLogo url={getImageUrl(group.logo)} />
          <div className="flex flex-col w-full">
            <div className="flex justify-between">
              <SubsectionHeading className="my-0 text-default-400">Description</SubsectionHeading>
              <GroupActions />
            </div>
            {!!group.description && <p className="mt-1 text-small text-default-500">{group.description}</p>}
          </div>
        </div>
        <div className="flex flex-col gap-2 sm:gap-4 mt-2">
          {group.email && (
            <div className="flex gap-1 items-center text-default-400">
              <MailIcon className="h-4 w-4" />
              <Link
                href={`mailto:${group.email}`}
                className="text-small text-default-400 tracking-tight hover:text-primary"
              >
                {group.email}
              </Link>
            </div>
          )}
          <ContactInfo links={group.links} />
        </div>
        <SubsectionHeading>Founder</SubsectionHeading>
        {group.founder && isFounderUuid ? (
          <UserCardWithFetch userId={group.founder!} />
        ) : (
          <div className="text-default-500">{group.founder}</div>
        )}
        <SubsectionHeading>Members</SubsectionHeading>
        <GroupMembers />
      </div>
    </>
  );
};

export default GroupView;

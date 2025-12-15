'use client';

import { Link, Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { MailIcon } from 'lucide-react';

import ContactInfo from '@/components/ContactInfo';
import { GroupMembers } from '@/components/groups/GroupMembers';
import GroupLocations from '@/components/groups/GroupLocations/GroupLocations';
import SubsectionHeading from '@/components/SubsectionHeading';
import { groupAtom } from '@/hooks/state/group';
import { getImageUrl } from '@/utils';
import { GroupActionsDropdown, GroupBanner, GroupLogo } from '.';

const GroupView = () => {
  const { data: group, isLoading } = useAtomValue(groupAtom);

  if (!group || isLoading) return <Spinner />;

  return (
    <>
      <GroupBanner />
      {/* Repeating relevant attributes from (main) layout */}
      <div className="flex flex-col px-2 mt-4 gap-2 sm:gap-3">
        <div className="flex gap-3 sm:gap-4 w-full px-1">
          <div className="shrink-0">
            <GroupLogo url={getImageUrl(group.logo)} adminCount={group.adminCount} />
          </div>
          <div className="flex flex-col w-full min-w-0 overflow-hidden">
            <div className="flex justify-between items-start gap-2">
              <SubsectionHeading className="my-0 text-default-400">Description</SubsectionHeading>
              <div className="flex-shrink-0">
                <GroupActionsDropdown />
              </div>
            </div>
            {!!group.description && (
              <p className="mt-1 text-small text-default-500 whitespace-pre-wrap break-words">{group.description}</p>
            )}
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
          {!!group.links?.length && <ContactInfo links={group.links} />}
          {group.style && (
            <div className="flex gap-1 sm:gap-2 items-end">
              <div className="text-lg font-semibold">Style</div>
              <div className="text-lg capitalize">{group.style}</div>
            </div>
          )}
        </div>
        <GroupLocations />
        <GroupMembers />
      </div>
    </>
  );
};

export default GroupView;

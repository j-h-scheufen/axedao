'use client';

import { Avatar, Card, CardBody, Chip, Divider, Link, Spinner } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { Building2Icon, KeyIcon, UsersIcon } from 'lucide-react';

import GroupAssociationWizard from '@/components/groups/GroupAssociationWizard';
import SectionHeading from '@/components/SectionHeading';
import { PATHS } from '@/config/constants';
import { currentUserAtom } from '@/hooks/state/currentUser';
import { useFetchUserGroups } from '@/query/currentUser';
import type { Group } from '@/types/model';
import { getImageUrl } from '@/utils';

const DEFAULT_GROUP_LOGO = '/quilombo-icon-192x192.png';

type GroupListItemProps = {
  group: Group;
  badge?: React.ReactNode;
};

const GroupListItem = ({ group, badge }: GroupListItemProps) => (
  <Link href={`${PATHS.groups}/${group.id}`} className="block">
    <Card className="hover:bg-default-100 transition-colors">
      <CardBody className="flex flex-row items-center gap-3 p-3">
        <Avatar
          src={getImageUrl(group.logo) || DEFAULT_GROUP_LOGO}
          size="md"
          icon={<Building2Icon className="h-5 w-5" />}
        />
        <div className="flex-1 min-w-0">
          <p className="font-medium truncate">{group.name}</p>
          {group.style && <p className="text-small text-default-500 capitalize">{group.style}</p>}
        </div>
        {badge}
      </CardBody>
    </Card>
  </Link>
);

/**
 * Component for managing user's group association on their profile.
 *
 * Displays:
 * 1. Groups where user is an admin (from group_admins table)
 * 2. Groups where user is a member (via genealogy member_of statements)
 * 3. Wizard for associating with new groups
 */
const ProfileGroupAssociation = () => {
  const currentUser = useAtomValue(currentUserAtom);
  const { data: userGroups, isLoading: isLoadingGroups } = useFetchUserGroups();

  if (currentUser.isLoading) return <Spinner />;

  const adminGroups = userGroups?.adminGroups ?? [];
  const memberGroups = userGroups?.memberGroups ?? [];
  const hasAdminGroups = adminGroups.length > 0;
  const hasMemberGroups = memberGroups.length > 0;
  const hasAnyGroups = hasAdminGroups || hasMemberGroups;

  return (
    <div className="space-y-6">
      {/* Groups I Manage Section */}
      {isLoadingGroups ? (
        <div className="flex items-center gap-2 p-4">
          <Spinner size="sm" />
          <p className="text-default-500">Loading your groups...</p>
        </div>
      ) : (
        hasAnyGroups && (
          <>
            {hasMemberGroups && (
              <div className="space-y-3">
                <div className="flex items-center gap-2">
                  <UsersIcon className="h-5 w-5 text-primary" />
                  <h3 className="text-lg font-semibold">My Memberships</h3>
                </div>
                <div className="grid gap-2 sm:grid-cols-2">
                  {memberGroups.map((group) => (
                    <GroupListItem
                      key={group.id}
                      group={group}
                      badge={
                        <Chip size="sm" color="primary" variant="flat">
                          Member
                        </Chip>
                      }
                    />
                  ))}
                </div>
              </div>
            )}

            {hasAdminGroups && (
              <div className="space-y-3">
                <div className="flex items-center gap-2">
                  <KeyIcon className="h-5 w-5 text-secondary" />
                  <h3 className="text-lg font-semibold">Groups I Manage</h3>
                </div>
                <div className="grid gap-2 sm:grid-cols-2">
                  {adminGroups.map((group) => (
                    <GroupListItem
                      key={group.id}
                      group={group}
                      badge={
                        <Chip size="sm" color="secondary" variant="flat">
                          Admin
                        </Chip>
                      }
                    />
                  ))}
                </div>
              </div>
            )}

            <Divider className="my-6" />
            <SectionHeading>Add another group</SectionHeading>
          </>
        )
      )}

      {/* Wizard for adding group associations */}
      <GroupAssociationWizard />
    </div>
  );
};

export default ProfileGroupAssociation;

'use client';

import { useIsGroupAdmin, useIsInitializingGroupProfile } from '@/store/groupProfile.store';
import { useIsExitingGroup, useProfileActions } from '@/store/profile.store';
import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/react';
import { EditIcon } from 'lucide-react';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';

const GroupActions = () => {
  const router = useRouter();

  const pathname = usePathname();

  const isGroupAdmin = useIsGroupAdmin();
  const isLoading = useIsInitializingGroupProfile();

  const profileActions = useProfileActions();
  const isExitingGroup = useIsExitingGroup();

  const exitGroupHandler = async () => {
    await profileActions.exitGroup();
    router.push('/dashboard/profile');
  };

  return (
    <div className="flex gap-3 justify-end">
      {!isLoading && (
        <>
          <Button
            variant="light"
            size="sm"
            color="danger"
            onPress={exitGroupHandler}
            spinner={<Spinner size="sm" color="danger" />}
            isLoading={isExitingGroup}
          >
            Leave group
          </Button>
          {isGroupAdmin && (
            <Button
              href={`${pathname}/edit`}
              as={Link}
              startContent={<EditIcon className="h-4 w-4" />}
              size="sm"
              variant="bordered"
            >
              Edit group
            </Button>
          )}
        </>
      )}
    </div>
  );
};
export default GroupActions;

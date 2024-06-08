'use client';
import { useInitializeGroupError, useIsGroupAdmin } from '@/store/groupProfile.store';
import { useIsExitingGroup, useProfileActions } from '@/store/profile.store';
import { Button } from '@nextui-org/button';
import { Spinner } from '@nextui-org/react';
import { Edit } from 'lucide-react';
import Image from 'next/image';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import ErrorText from './ErrorText';
import GroupBannerSkeleton from './skeletons/GroupBannerSkeleton';

type Props = { banner: string | null; isFounder?: boolean; isLoading?: boolean };
const GroupBanner = ({ banner, isLoading }: Props) => {
  const router = useRouter();
  const pathname = usePathname();

  const isGroupAdmin = useIsGroupAdmin();
  const initializeGroupError = useInitializeGroupError();

  const profileActions = useProfileActions();
  const isExitingGroup = useIsExitingGroup();

  const exitGroupHandler = async () => {
    await profileActions.exitGroup();
    router.push('/dashboard/profile');
  };

  if (isLoading) return <GroupBannerSkeleton />;

  return (
    <>
      <ErrorText message={initializeGroupError} />
      <div className="relative bottom-5 h-[200px] w-full rounded-xl bg-gradient-to-t from-neutral-900">
        {banner && <Image src={banner} objectFit="cover" className="h-full w-full" alt="Group banner" />}
        <div className="absolute right-5 top-5 flex gap-3">
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
              startContent={<Edit className="h-4 w-4" />}
              size="sm"
              variant="bordered"
            >
              Edit group
            </Button>
          )}
        </div>
      </div>
    </>
  );
};
export default GroupBanner;

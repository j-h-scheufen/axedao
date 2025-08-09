'use client';

import { Card, CardBody, Image, Link, Button } from '@heroui/react';
import { MapPinIcon, ExternalLinkIcon, SettingsIcon } from 'lucide-react';
import { useAtomValue } from 'jotai';
import NextLink from 'next/link';
import { usePathname } from 'next/navigation';

import { zonedEventAtom } from '@/hooks/state/event';
import { currentUserIdAtom } from '@/hooks/state/currentUser';
import { getFlagEmoji, getImageUrl } from '@/utils';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';
// import UserCard from '@/components/UserCard';
// import SubsectionHeading from '@/components/SubsectionHeading';
import EventDateTime from './EventDateTime';
// import { useFetchUser } from '@/query/user';
// import UserCardSkeleton from '../skeletons/UserCardSkeleton';

const EventDetails = () => {
  const { event, isLoading } = useAtomValue(zonedEventAtom);
  const currentUserId = useAtomValue(currentUserIdAtom);
  // const { data: creator, isLoading: isCreatorLoading } = useFetchUser(event?.creatorId);
  const pathname = usePathname();

  if (isLoading || !event) {
    return <div>Loading...</div>;
  }

  const { name, start, end, isAllDay, countryCode, url, feature, image, description } = event;
  const isEventCreator = event.creatorId === currentUserId;

  return (
    <div className="space-y-6">
      <div className="flex flex-col lg:flex-row gap-2 sm:gap-4">
        {/* Main content */}
        <div className="flex-1">
          {/* Combined details card */}
          <Card>
            <CardBody className="flex flex-col gap-2">
              {/* Edit button for event creator */}
              {isEventCreator && (
                <div className="flex justify-end mb-2">
                  <Button
                    as={NextLink}
                    href={`${pathname}/edit`}
                    size="sm"
                    variant="light"
                    startContent={<SettingsIcon className="h-4 w-4" />}
                  >
                    Edit Event
                  </Button>
                </div>
              )}
              {/* Date and time */}
              <EventDateTime start={start} end={end} isAllDay={isAllDay} variant="detailed" />

              {/* Location */}
              {feature && (
                <div className="flex items-center gap-3">
                  {countryCode ? (
                    <span className="text-lg mt-0.5">{getFlagEmoji(countryCode)}</span>
                  ) : (
                    <MapPinIcon className="h-5 w-5 text-default-500 mt-0.5" />
                  )}
                  <span className="font-medium">{getGeoJsonFeatureLabel(feature)}</span>
                </div>
              )}

              {/* Description */}
              {description && (
                <div>
                  <h3 className="text-lg font-semibold mb-2">Description</h3>
                  <p className="text-default-600 whitespace-pre-wrap">{description}</p>
                </div>
              )}

              {/* External URL */}
              {url && (
                <div className="flex items-center gap-3">
                  <ExternalLinkIcon className="h-5 w-5 text-default-500" />
                  <Link href={url} isExternal className="text-primary">
                    Visit event website
                  </Link>
                </div>
              )}
            </CardBody>
          </Card>

          {/* Creator */}
          {/* {creator && (
            <div>
              <SubsectionHeading>Created by</SubsectionHeading>
              {isCreatorLoading ? <UserCardSkeleton /> : <UserCard user={creator} />}
            </div>
          )} */}
        </div>

        {image && (
          <div className="w-full sm:w-3/4 lg:w-5/12 self-center">
            <Image
              src={getImageUrl(image)}
              alt={`${name} event image`}
              className="w-full object-cover rounded-lg"
              loading="lazy"
            />
          </div>
        )}
      </div>
    </div>
  );
};

export default EventDetails;

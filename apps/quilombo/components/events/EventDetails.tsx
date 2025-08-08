'use client';

import { Badge, Card, CardBody, Image, Link } from '@heroui/react';
import { CalendarIcon, MapPinIcon, ExternalLinkIcon, ClockIcon } from 'lucide-react';
import { useAtomValue } from 'jotai';

import { zonedEventAtom } from '@/hooks/state/event';
import { getFlagEmoji, getImageUrl, getEventTypeColor, getEventTypeLabel } from '@/utils';
import { formatDate, formatTime } from '@/components/_utils';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';
import UserCard from '@/components/UserCard';
import { useFetchUser } from '@/query/user';

const EventDetails = () => {
  const { event, isLoading } = useAtomValue(zonedEventAtom);
  const { data: creator, isLoading: isCreatorLoading } = useFetchUser(event?.creatorId);

  if (isLoading || !event) {
    return <div>Loading...</div>;
  }

  const { name, type, start, end, isAllDay, countryCode, url, feature, image, description } = event;

  return (
    <div className="space-y-6">
      <div className="flex flex-col lg:flex-row gap-6">
        {/* Main content */}
        <div className="flex-1 space-y-6">
          {/* Event type badge */}
          <div className="flex items-center gap-2">
            <Badge className={getEventTypeColor(type)} variant="flat">
              {getEventTypeLabel(type)}
            </Badge>
          </div>

          {/* Date and time */}
          <Card>
            <CardBody className="p-4">
              <div className="flex items-center gap-3">
                <CalendarIcon className="h-5 w-5 text-default-500" />
                <div className="flex flex-col">
                  <span className="font-medium">
                    {isAllDay ? (
                      <>
                        {formatDate(start)}
                        {end && start.toDate().toDateString() !== end.toDate().toDateString() && (
                          <>
                            {' - '}
                            {formatDate(end)}
                          </>
                        )}
                      </>
                    ) : (
                      <>
                        {formatDate(start)}
                        {start.hour !== 0 && ` at ${formatTime(start)}`}
                        {end && (
                          <>
                            {' - '}
                            {formatDate(end)}
                            {end.hour !== 0 && ` at ${formatTime(end)}`}
                          </>
                        )}
                      </>
                    )}
                  </span>
                  {!isAllDay && (
                    <span className="text-sm text-default-500 flex items-center gap-1">
                      <ClockIcon className="h-3 w-3" />
                      {start.hour === 0 ? 'All day event' : 'Timed event'}
                    </span>
                  )}
                </div>
              </div>
            </CardBody>
          </Card>

          {/* Location */}
          {feature && (
            <Card>
              <CardBody className="p-4">
                <div className="flex items-center gap-3">
                  {countryCode ? (
                    <span className="text-lg">{getFlagEmoji(countryCode)}</span>
                  ) : (
                    <MapPinIcon className="h-5 w-5 text-default-500" />
                  )}
                  <span className="font-medium">{getGeoJsonFeatureLabel(feature)}</span>
                </div>
              </CardBody>
            </Card>
          )}

          {/* Description */}
          {description && (
            <Card>
              <CardBody className="p-4">
                <h3 className="text-lg font-semibold mb-2">Description</h3>
                <p className="text-default-600 whitespace-pre-wrap">{description}</p>
              </CardBody>
            </Card>
          )}

          {/* External URL */}
          {url && (
            <Card>
              <CardBody className="p-4">
                <div className="flex items-center gap-3">
                  <ExternalLinkIcon className="h-5 w-5 text-default-500" />
                  <Link href={url} isExternal className="text-primary">
                    Visit event website
                  </Link>
                </div>
              </CardBody>
            </Card>
          )}
        </div>

        {/* Image - responsive layout */}
        {image && (
          <div className="lg:w-1/3">
            <Card>
              <CardBody className="p-0">
                <Image
                  src={getImageUrl(image)}
                  alt={`${name} event image`}
                  className="w-full h-64 lg:h-80 object-cover rounded-lg"
                  loading="lazy"
                />
              </CardBody>
            </Card>
          </div>
        )}
      </div>

      {/* Creator section */}
      {creator && !isCreatorLoading && (
        <div className="max-w-md">
          <UserCard user={creator} />
        </div>
      )}
    </div>
  );
};

export default EventDetails;

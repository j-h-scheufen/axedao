import { Link, Avatar, Card, CardBody, CardFooter } from '@heroui/react';
import clsx from 'clsx';
import { MapPinIcon } from 'lucide-react';
import type { ReactNode } from 'react';

import { PATHS } from '@/config/constants';
import type { Group } from '@/types/model';
import { getFlagEmoji, getImageUrl } from '@/utils';
import GroupStatusBadge from './GroupStatusBadge';

type Props = { group: Group; className?: string; cardFooter?: ReactNode };

const DEFAULT_GROUP_LOGO = '/quilombo-icon-192x192.png';

const GroupCard = ({ group, className = '', cardFooter = null }: Props) => {
  const { name, id, logo, lastVerifiedAt, adminCount, countryCodes } = group;
  return (
    <Card as={Link} href={`${PATHS.groups}/${id}`}>
      <CardBody className={clsx('flex flex-row gap-3 p-2', className)}>
        <GroupStatusBadge lastVerifiedAt={lastVerifiedAt} adminCount={adminCount}>
          <Avatar src={getImageUrl(logo) || DEFAULT_GROUP_LOGO} size="lg" />
        </GroupStatusBadge>
        <div className="flex-1 flex flex-col">
          <h3 className="flex items-center text-md">{name}</h3>
          {countryCodes.length > 0 && (
            <div className="flex items-center gap-2">
              <span className="flex items-center gap-1 text-small text-default-500 uppercase">
                <MapPinIcon className="h-3 w-3" />
                {countryCodes.map((code) => (
                  <span key={code} title={code} className="text-lg">
                    {getFlagEmoji(code)}
                  </span>
                ))}
              </span>
            </div>
          )}
        </div>
      </CardBody>
      {cardFooter && <CardFooter className="flex-row">{cardFooter}</CardFooter>}
    </Card>
  );
};

export default GroupCard;

import { Link, Avatar, Card, CardBody, CardFooter } from '@heroui/react';
import clsx from 'clsx';
import { MapPinIcon } from 'lucide-react';
import type { ReactNode } from 'react';

import { PATHS } from '@/config/constants';
import type { Group } from '@/types/model';
import { getImageUrl } from '@/utils';
import VerificationBadge from './VerificationBadge';

type Props = { group: Group; className?: string; cardFooter?: ReactNode };

const GroupCard = ({ group, className = '', cardFooter = null }: Props) => {
  const { name, id, logo, verified, countryName } = group;
  return (
    <Card as={Link} href={`${PATHS.groups}/${id}`}>
      <CardBody className={clsx('flex flex-row gap-3 p-2', className)}>
        <VerificationBadge verified={verified}>
          <Avatar src={getImageUrl(logo)} size="lg" />
        </VerificationBadge>
        <div className="flex-1 flex flex-col">
          <h3 className="flex items-center text-md">{name}</h3>
          {countryName && (
            <div className="flex items-center gap-2">
              <span className="flex items-center gap-1 text-small text-default-500">
                <MapPinIcon className="h-3 w-3" />
                {countryName}
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

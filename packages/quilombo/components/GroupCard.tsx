import { Avatar } from '@nextui-org/avatar';
import { Card, CardFooter, CardHeader } from '@nextui-org/card';
import { Link } from '@nextui-org/link';
import clsx from 'clsx';
import { MapPinIcon } from 'lucide-react';
import { ReactNode } from 'react';

import { PATHS } from '@/config/constants';
import { Group } from '@/types/model';
import { getImageUrl } from '@/utils';
import VerificationChip from './VerificationChip';

type Props = { group: Group; className?: string; cardFooter?: ReactNode };

const GroupCard = ({ group, className = '', cardFooter = null }: Props) => {
  const { name, id, logo, verified, country, city } = group;
  return (
    <Card as={Link} href={`${PATHS.groups}/${id}`} className={clsx('w-full', className)}>
      <CardHeader className="flex gap-3">
        <Avatar src={getImageUrl(logo)} size="lg" />
        <div className="flex-1 flex flex-col">
          <div className="flex items-start justify-between gap-3">
            <h3 className="flex items-center gap-2 text-md">{name}</h3>
            <VerificationChip verified={verified} className="position top-[1px]" />
          </div>
          <div className="flex items-center gap-2">
            <span className="flex items-center gap-1 text-small text-default-500">
              <MapPinIcon className="h-3 w-3" /> {city}, {country}
            </span>
          </div>
        </div>
      </CardHeader>
      {cardFooter && <CardFooter className="flex-row">{cardFooter}</CardFooter>}
    </Card>
  );
};

export default GroupCard;

import { Card, Button, Avatar } from '@heroui/react';
import Link from 'next/link';
import type { FC } from 'react';
import { X } from 'lucide-react';

import type { GroupLocationFeatureProperties } from '@/types/model';
import { getImageUrl } from '@/utils';

interface GroupLocationPopoverProps {
  location: GroupLocationFeatureProperties;
  address: string;
  x: number;
  y: number;
  onClose?: () => void;
}

const GroupLocationPopover: FC<GroupLocationPopoverProps> = ({ location, address, x, y, onClose }) => (
  <div
    style={{
      position: 'absolute',
      left: x,
      top: y,
      zIndex: 1000,
      pointerEvents: 'auto',
      transform: 'translate(-50%, -100%)',
    }}
    className="min-w-[220px]"
  >
    <Card className="p-4 shadow-lg rounded-xl flex flex-col items-center gap-2 relative">
      {onClose && (
        <Button
          isIconOnly
          size="sm"
          variant="light"
          className="absolute top-2 right-2"
          onPress={onClose}
          aria-label="Close"
        >
          <X className="w-4 h-4" />
        </Button>
      )}
      <Avatar src={getImageUrl(location.groupLogo)} size="lg" />
      <div className="font-bold mb-1">{location.groupName}</div>
      <div className="text-xs text-gray-500 mb-2 text-center">{address}</div>
      <Button as={Link} href={`/groups/${location.groupId}`} color="primary" size="sm">
        Go to group
      </Button>
    </Card>
  </div>
);

export default GroupLocationPopover;

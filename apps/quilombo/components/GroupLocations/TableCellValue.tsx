'use client';

import { Button, Tooltip } from '@heroui/react';
import { EditIcon, TrashIcon } from 'lucide-react';
import { useMemo } from 'react';

import type { GroupLocation } from '@/types/model';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';

export const COLUMNS = [
  { uid: 'name', name: 'Name' },
  { uid: 'description', name: 'Description' },
  { uid: 'address', name: 'Address' },
  { uid: 'actions', name: 'Actions' },
] as const;

export type GroupLocationTableColumnKey = (typeof COLUMNS)[number]['uid'];

interface TableCellValueProps {
  groupLocation: GroupLocation;
  columnKey: GroupLocationTableColumnKey;
  onEdit?: () => void;
  onDelete?: () => void;
  isUpdating?: boolean;
  isDeleting?: boolean;
}

const TableCellValue = ({
  groupLocation,
  columnKey,
  onEdit,
  onDelete,
  isUpdating,
  isDeleting,
}: TableCellValueProps) => {
  const address = useMemo(() => getGeoJsonFeatureLabel(groupLocation.feature), [groupLocation.feature]);

  const truncatedDescription = useMemo(() => {
    const description = groupLocation.description || '';
    if (description.length <= 50) return description;
    return `${description.substring(0, 50)}...`;
  }, [groupLocation.description]);

  switch (columnKey) {
    case 'name':
      return <span className="font-medium">{groupLocation.name}</span>;

    case 'description':
      return groupLocation.description ? (
        <Tooltip content={groupLocation.description}>
          <span className="text-gray-600">{truncatedDescription}</span>
        </Tooltip>
      ) : (
        <span className="text-gray-400 italic">No description</span>
      );

    case 'address':
      return <span className="text-gray-700">{address}</span>;

    case 'actions':
      return (
        <div className="flex gap-2 justify-end">
          {onEdit && (
            <Button isIconOnly size="sm" variant="light" onPress={onEdit} isDisabled={isUpdating || isDeleting}>
              <EditIcon className="h-4 w-4" />
            </Button>
          )}
          {onDelete && (
            <Button
              isIconOnly
              size="sm"
              variant="light"
              color="danger"
              onPress={onDelete}
              isDisabled={isUpdating || isDeleting}
            >
              <TrashIcon className="h-4 w-4" />
            </Button>
          )}
        </div>
      );

    default:
      return null;
  }
};

export default TableCellValue;

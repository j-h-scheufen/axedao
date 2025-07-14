'use client';

import {
  Accordion,
  AccordionItem,
  Button,
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
  Tooltip,
  useDisclosure,
} from '@heroui/react';
import { Info } from 'lucide-react';
import { useAtomValue } from 'jotai';
import { useCallback, useMemo, useState } from 'react';

import { GroupLocationsSkeleton } from '@/components/skeletons/GroupSkeletons';
import { groupLocationsAtom } from '@/hooks/state/group';
import type { GroupLocation } from '@/types/model';
import TableCellValue, { COLUMNS, type GroupLocationTableColumnKey } from './TableCellValue';
import LocationDetailsModal from './LocationDetailsModal';

// View-only columns (exclude actions and description, add info column)
const VIEW_COLUMNS = [
  ...COLUMNS.filter((column) => column.uid !== 'actions' && column.uid !== 'description'),
  { uid: 'info', name: '' },
];

const GroupLocations = () => {
  const { data: groupLocations, isLoading } = useAtomValue(groupLocationsAtom);
  const [selectedLocation, setSelectedLocation] = useState<GroupLocation | null>(null);

  const { isOpen: isModalOpen, onOpen: onModalOpen, onOpenChange: onModalOpenChange } = useDisclosure();

  const sortedGroupLocations = useMemo(
    () => groupLocations?.sort((a, b) => a.name.localeCompare(b.name)) ?? [],
    [groupLocations]
  );

  const handleInfoClick = useCallback(
    (location: GroupLocation) => {
      setSelectedLocation(location);
      onModalOpen();
    },
    [onModalOpen]
  );

  const handleModalClose = () => {
    setSelectedLocation(null);
  };

  if (isLoading) {
    return <GroupLocationsSkeleton />;
  }

  if (!sortedGroupLocations.length) {
    return null;
  }

  const locationCount = sortedGroupLocations.length;
  const locationText = locationCount === 1 ? 'Location' : 'Locations';

  return (
    <>
      <Accordion variant="bordered" className="w-full">
        <AccordionItem
          key="locations"
          aria-label={`${locationCount} ${locationText}`}
          title={`${locationCount} ${locationText}`}
          className="px-0"
        >
          <Table aria-label="Group locations table" hideHeader removeWrapper>
            <TableHeader columns={VIEW_COLUMNS}>
              {(column) => (
                <TableColumn
                  key={column.uid}
                  className={column.uid === 'info' ? 'text-right w-12' : 'text-left capitalize'}
                >
                  {column.name}
                </TableColumn>
              )}
            </TableHeader>
            <TableBody
              items={sortedGroupLocations}
              isLoading={isLoading}
              loadingContent={<Spinner label="Loading..." size="sm" color="default" />}
            >
              {(item) => (
                <TableRow key={item.id}>
                  {(columnKey) => (
                    <TableCell className={columnKey === 'info' ? 'text-right' : 'text-left'}>
                      {columnKey === 'info' ? (
                        <Button isIconOnly size="sm" variant="light" onPress={() => handleInfoClick(item)}>
                          <Info className="h-4 w-4 text-default-600" />
                        </Button>
                      ) : columnKey === 'address' && item.description ? (
                        <Tooltip content={item.description}>
                          <span>
                            <TableCellValue groupLocation={item} columnKey={columnKey as GroupLocationTableColumnKey} />
                          </span>
                        </Tooltip>
                      ) : (
                        <TableCellValue groupLocation={item} columnKey={columnKey as GroupLocationTableColumnKey} />
                      )}
                    </TableCell>
                  )}
                </TableRow>
              )}
            </TableBody>
          </Table>
        </AccordionItem>
      </Accordion>

      <LocationDetailsModal
        isOpen={isModalOpen}
        onOpenChange={onModalOpenChange}
        onClose={handleModalClose}
        location={selectedLocation}
      />
    </>
  );
};

export default GroupLocations;

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

  const locationCount = sortedGroupLocations.length;
  const locationText = locationCount === 0 ? 'No Locations' : locationCount === 1 ? 'Location' : 'Locations';

  if (!sortedGroupLocations.length) {
    return (
      <Accordion variant="bordered" className="w-full">
        <AccordionItem key="locations" aria-label="No Locations" title="No Locations" className="px-0" isDisabled>
          <div className="text-default-500 text-center py-4">No locations configured</div>
        </AccordionItem>
      </Accordion>
    );
  }

  return (
    <>
      <Accordion variant="bordered" className="w-full px-0" fullWidth>
        <AccordionItem
          key="locations"
          aria-label={`${locationCount} ${locationText}`}
          title={`${locationCount} ${locationText}`}
          classNames={{
            content: 'px-0 py-1',
            heading: 'px-4 py-1',
          }}
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

'use client';

import {
  Button,
  Spinner,
  Table,
  TableBody,
  TableCell,
  TableColumn,
  TableHeader,
  TableRow,
  useDisclosure,
} from '@heroui/react';
import { PlusIcon } from 'lucide-react';
import { useAtomValue } from 'jotai';
import { useCallback, useMemo, useState } from 'react';

import { GroupLocationsSkeleton } from '@/components/skeletons/GroupSkeletons';
import { groupIdAtom, groupLocationsAtom, isCurrentUserGroupAdminAtom } from '@/hooks/state/group';
import { useCreateGroupLocation, useDeleteGroupLocation, useUpdateGroupLocation } from '@/hooks/useGroup';
import type { GroupLocation } from '@/types/model';
import TableCellValue, { COLUMNS, type GroupLocationTableColumnKey } from './TableCellValue';
import { LocationModal, DeleteLocationModal } from '.';

const GroupLocations = () => {
  const { data: groupLocations, isPending } = useAtomValue(groupLocationsAtom);
  const groupId = useAtomValue(groupIdAtom);
  const isGroupAdmin = useAtomValue(isCurrentUserGroupAdminAtom);

  const {
    isOpen: isLocationModalOpen,
    onOpen: onLocationModalOpen,
    onOpenChange: onLocationModalOpenChange,
  } = useDisclosure();
  const {
    isOpen: isDeleteModalOpen,
    onOpen: onDeleteModalOpen,
    onOpenChange: onDeleteModalOpenChange,
  } = useDisclosure();

  const [editingLocation, setEditingLocation] = useState<GroupLocation | null>(null);
  const [deletingLocation, setDeletingLocation] = useState<GroupLocation | null>(null);

  const { createGroupLocation, isPending: isCreating } = useCreateGroupLocation();
  const { updateGroupLocation, isPending: isUpdating } = useUpdateGroupLocation();
  const { deleteGroupLocation, isPending: isDeleting } = useDeleteGroupLocation();

  const handleAddLocation = useCallback(() => {
    setEditingLocation(null);
    onLocationModalOpen();
  }, [onLocationModalOpen]);

  const handleEditLocation = useCallback(
    (location: GroupLocation) => {
      setEditingLocation(location);
      onLocationModalOpen();
    },
    [onLocationModalOpen]
  );

  const handleDeleteLocation = useCallback(
    (location: GroupLocation) => {
      setDeletingLocation(location);
      onDeleteModalOpen();
    },
    [onDeleteModalOpen]
  );

  const handleLocationSubmit = useCallback(
    async (data: any) => {
      if (!groupId) return;

      if (editingLocation) {
        await updateGroupLocation({ groupId, locationId: editingLocation.id, data });
      } else {
        await createGroupLocation({ groupId, data });
      }

      onLocationModalOpenChange();
      setEditingLocation(null);
    },
    [groupId, editingLocation, updateGroupLocation, createGroupLocation, onLocationModalOpenChange]
  );

  const handleLocationDelete = useCallback(async () => {
    if (!groupId || !deletingLocation) return;

    await deleteGroupLocation({ groupId, locationId: deletingLocation.id });

    onDeleteModalOpenChange();
    setDeletingLocation(null);
  }, [groupId, deletingLocation, deleteGroupLocation, onDeleteModalOpenChange]);

  const sortedGroupLocations = useMemo(
    () => groupLocations?.sort((a, b) => a.name.localeCompare(b.name)) ?? [],
    [groupLocations]
  );

  const filteredColumns = [...COLUMNS].filter((column) => (isGroupAdmin ? true : column.uid !== 'actions'));

  if (isPending) return <GroupLocationsSkeleton />;

  return (
    <>
      <div className="flex justify-between items-center mb-4">
        <h3 className="text-lg font-semibold">Locations</h3>
        {isGroupAdmin && (
          <Button
            size="sm"
            color="primary"
            startContent={<PlusIcon className="h-4 w-4" />}
            onPress={handleAddLocation}
            isLoading={isCreating}
          >
            Add Location
          </Button>
        )}
      </div>

      <Table aria-label="Group locations table" hideHeader removeWrapper>
        <TableHeader columns={filteredColumns}>
          {(column) => (
            <TableColumn key={column.uid} className="last:text-end text-left capitalize">
              {column.name}
            </TableColumn>
          )}
        </TableHeader>
        <TableBody
          items={sortedGroupLocations}
          isLoading={isPending}
          loadingContent={<Spinner label="Loading..." size="sm" color="default" />}
          emptyContent="No locations found"
        >
          {(item) => (
            <TableRow key={item.id}>
              {(columnKey) => (
                <TableCell className="last:text-end first:text-left text-center">
                  <TableCellValue
                    groupLocation={item}
                    columnKey={columnKey as GroupLocationTableColumnKey}
                    onEdit={isGroupAdmin ? () => handleEditLocation(item) : undefined}
                    onDelete={isGroupAdmin ? () => handleDeleteLocation(item) : undefined}
                    isUpdating={isUpdating}
                    isDeleting={isDeleting}
                  />
                </TableCell>
              )}
            </TableRow>
          )}
        </TableBody>
      </Table>

      <LocationModal
        isOpen={isLocationModalOpen}
        onOpenChange={onLocationModalOpenChange}
        location={editingLocation}
        onSubmit={handleLocationSubmit}
        isSubmitting={isCreating || isUpdating}
      />

      <DeleteLocationModal
        isOpen={isDeleteModalOpen}
        onOpenChange={onDeleteModalOpenChange}
        location={deletingLocation}
        onDelete={handleLocationDelete}
        isDeleting={isDeleting}
      />
    </>
  );
};

export default GroupLocations;

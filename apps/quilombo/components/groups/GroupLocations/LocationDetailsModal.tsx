'use client';

import { Modal, ModalBody, ModalContent, ModalHeader, type ModalProps } from '@heroui/react';

import type { GroupLocation } from '@/types/model';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';

interface LocationDetailsModalProps extends Omit<ModalProps, 'children'> {
  location: GroupLocation | null;
}

const LocationDetailsModal = ({ isOpen, onOpenChange, location }: LocationDetailsModalProps) => {
  if (!location) return null;

  const address = getGeoJsonFeatureLabel(location.feature);

  return (
    <Modal
      isOpen={isOpen}
      onOpenChange={onOpenChange}
      size="md"
      classNames={{
        base: 'sm:max-w-md',
        backdrop: 'sm:backdrop-blur-sm',
        wrapper: 'sm:p-4',
      }}
      scrollBehavior="inside"
    >
      <ModalContent>
        <ModalHeader>
          <span>Location Details</span>
        </ModalHeader>
        <ModalBody className="gap-4">
          <div className="flex flex-col gap-3">
            <div>
              <h3 className="text-sm font-medium text-default-600 mb-1">Name</h3>
              <p className="text-default-900">{location.name}</p>
            </div>

            <div>
              <h3 className="text-sm font-medium text-default-600 mb-1">Address</h3>
              <p className="text-default-900">{address}</p>
            </div>

            {location.description && (
              <div>
                <h3 className="text-sm font-medium text-default-600 mb-1">Description</h3>
                <p className="text-default-900 whitespace-pre-wrap">{location.description}</p>
              </div>
            )}
          </div>
        </ModalBody>
      </ModalContent>
    </Modal>
  );
};

export default LocationDetailsModal;

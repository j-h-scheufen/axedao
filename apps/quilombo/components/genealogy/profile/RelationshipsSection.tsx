'use client';

import { Button, Card, CardBody, CardHeader, Chip, Divider } from '@heroui/react';
import { PlusIcon, XMarkIcon } from '@heroicons/react/24/outline';
import { useState } from 'react';

import type { Predicate, SelectStatement } from '@/db/schema/genealogy';
import { PREDICATE_LABELS } from '@/components/genealogy/types';
import { SELF_DECLARED_CONFIDENCE } from '@/config/constants';
import AddRelationshipModal from './AddRelationshipModal';

type RelationshipsWithDetails = SelectStatement & {
  objectName?: string; // Name of the person/group
};

type RelationshipsSectionProps = {
  /** User's genealogy profile ID */
  profileId?: string;
  /** Existing relationships where user is the subject */
  relationships: RelationshipsWithDetails[];
  /** Loading state */
  isLoading?: boolean;
  /** Callback when relationship is deleted */
  onDelete: (statementId: string) => void;
};

/**
 * Section for managing relationships (mestres, groups, etc.)
 * Displays existing relationships and allows adding/removing them.
 */
const RelationshipsSection = ({ profileId, relationships, isLoading, onDelete }: RelationshipsSectionProps) => {
  const [isAddModalOpen, setIsAddModalOpen] = useState(false);

  return (
    <>
      <Card>
        <CardHeader>
          <div className="flex flex-col w-full">
            <div className="flex justify-between items-center">
              <div>
                <p className="text-md font-semibold">Relationships</p>
                <p className="text-small text-default-500">Declare your connections to mestres and groups</p>
              </div>
              {profileId && (
                <Button
                  color="primary"
                  variant="flat"
                  size="sm"
                  startContent={<PlusIcon className="w-4 h-4" />}
                  onPress={() => setIsAddModalOpen(true)}
                  isDisabled={!profileId}
                >
                  Add Relationship
                </Button>
              )}
            </div>
          </div>
        </CardHeader>
        <Divider />
        <CardBody>
          {!profileId ? (
            <p className="text-default-400 text-center py-4">Publish your profile first to add relationships</p>
          ) : isLoading ? (
            <p className="text-default-400 text-center py-4">Loading relationships...</p>
          ) : relationships.length === 0 ? (
            <p className="text-default-400 text-center py-4">
              No relationships declared yet. Add your first connection!
            </p>
          ) : (
            <div className="space-y-2">
              {relationships.map((rel) => (
                <RelationshipItem key={rel.id} relationship={rel} onDelete={() => onDelete(rel.id)} />
              ))}
            </div>
          )}
        </CardBody>
      </Card>
      <AddRelationshipModal isOpen={isAddModalOpen} onClose={() => setIsAddModalOpen(false)} profileId={profileId} />
    </>
  );
};

type RelationshipItemProps = {
  relationship: RelationshipsWithDetails;
  onDelete: () => void;
};

/**
 * Individual relationship item display.
 */
const RelationshipItem = ({ relationship, onDelete }: RelationshipItemProps) => {
  const predicateLabel = PREDICATE_LABELS[relationship.predicate as Predicate];
  const objectTypeLabel = relationship.objectType === 'person' ? 'Person' : 'Group';

  return (
    <div className="flex items-center justify-between p-3 bg-default-100 rounded-lg">
      <div className="flex items-center gap-3 flex-1">
        <div className="flex flex-col gap-1">
          <div className="flex items-center gap-2">
            <span className="text-sm font-medium">{predicateLabel}</span>
            <span className="text-sm text-default-600">→</span>
            <span className="text-sm font-semibold">{relationship.objectName || 'Unknown'}</span>
            <Chip size="sm" variant="flat" color="default">
              {objectTypeLabel}
            </Chip>
          </div>
          <div className="flex items-center gap-2">
            <Chip
              size="sm"
              variant="flat"
              color={
                relationship.confidence === 'verified'
                  ? 'success'
                  : relationship.confidence === SELF_DECLARED_CONFIDENCE
                    ? 'primary'
                    : 'warning'
              }
            >
              {relationship.confidence || SELF_DECLARED_CONFIDENCE}
            </Chip>
            {relationship.startedAt && (
              <span className="text-xs text-default-500">From {new Date(relationship.startedAt).getFullYear()}</span>
            )}
            {relationship.endedAt && (
              <span className="text-xs text-default-500">to {new Date(relationship.endedAt).getFullYear()}</span>
            )}
          </div>
        </div>
      </div>
      <Button isIconOnly size="sm" variant="light" color="danger" onPress={onDelete} aria-label="Delete relationship">
        <XMarkIcon className="w-4 h-4" />
      </Button>
    </div>
  );
};

export default RelationshipsSection;

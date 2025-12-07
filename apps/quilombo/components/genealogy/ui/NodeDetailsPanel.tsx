'use client';

import { Avatar, Button, Card, CardBody, CardHeader, Chip, Divider, Spinner } from '@heroui/react';

import type {
  GraphNode,
  GroupDetails,
  GroupMetadata,
  PersonDetails,
  PersonMetadata,
  StatementDetail,
} from '@/components/genealogy/types';
import { PREDICATE_LABELS } from '@/components/genealogy/types';

interface NodeDetailsPanelProps {
  node: GraphNode | null;
  details: {
    type: string;
    data: PersonDetails | GroupDetails;
    relationships: {
      outgoing: StatementDetail[];
      incoming: StatementDetail[];
    };
  } | null;
  isLoading: boolean;
  onClose: () => void;
  onNodeSelect: (entityType: string, entityId: string) => void;
}

function formatYear(year: number | null | undefined, precision?: string | null): string {
  if (!year) return 'Unknown';
  switch (precision) {
    case 'exact':
      return year.toString();
    case 'approximate':
      return `c. ${year}`;
    case 'decade':
      return `${Math.floor(year / 10) * 10}s`;
    case 'century':
      return `${Math.floor(year / 100) + 1}th century`;
    default:
      return year.toString();
  }
}

function PersonCard({ data }: { data: PersonDetails }) {
  const displayName = data.apelido || data.name || 'Unknown';
  const lifespan =
    data.birthYear || data.deathYear
      ? `${formatYear(data.birthYear, data.birthYearPrecision)} - ${data.deathYear ? formatYear(data.deathYear, data.deathYearPrecision) : 'Present'}`
      : null;

  return (
    <div className="space-y-3">
      <div className="flex items-start gap-3">
        <Avatar src={data.avatar || undefined} name={displayName} size="lg" className="shrink-0" />
        <div className="min-w-0 flex-1">
          <h3 className="text-lg font-bold">{displayName}</h3>
          {data.name && data.name !== data.apelido && <p className="text-small text-default-500">{data.name}</p>}
          <div className="mt-1 flex flex-wrap gap-1">
            {data.title && (
              <Chip size="sm" variant="flat" color="primary">
                {data.title}
              </Chip>
            )}
            {data.style && (
              <Chip size="sm" variant="flat" color="secondary">
                {data.style}
              </Chip>
            )}
          </div>
        </div>
      </div>

      {lifespan && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Lifespan</p>
          <p className="text-small">{lifespan}</p>
        </div>
      )}

      {(data.birthPlace || data.deathPlace) && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Places</p>
          {data.birthPlace && <p className="text-small">Born: {data.birthPlace}</p>}
          {data.deathPlace && <p className="text-small">Died: {data.deathPlace}</p>}
        </div>
      )}

      {data.bio && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Biography</p>
          <p className="text-small">{data.bio}</p>
        </div>
      )}

      {data.achievements && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Achievements</p>
          <p className="text-small">{data.achievements}</p>
        </div>
      )}
    </div>
  );
}

function GroupCard({ data }: { data: GroupDetails }) {
  return (
    <div className="space-y-3">
      <div className="flex items-start gap-3">
        <Avatar src={data.logo || undefined} name="G" size="lg" className="shrink-0" radius="sm" />
        <div className="min-w-0 flex-1">
          <h3 className="text-lg font-bold">Group</h3>
          <div className="mt-1 flex flex-wrap gap-1">
            {data.style && (
              <Chip size="sm" variant="flat" color="secondary">
                {data.style}
              </Chip>
            )}
            <Chip size="sm" variant="flat" color={data.isActive ? 'success' : 'default'}>
              {data.isActive ? 'Active' : 'Inactive'}
            </Chip>
          </div>
        </div>
      </div>

      {data.nameAliases && data.nameAliases.length > 0 && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Also Known As</p>
          <p className="text-small">{data.nameAliases.join(', ')}</p>
        </div>
      )}

      {data.foundedYear && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Founded</p>
          <p className="text-small">
            {formatYear(data.foundedYear, data.foundedYearPrecision)}
            {data.foundedLocation && ` in ${data.foundedLocation}`}
          </p>
        </div>
      )}

      {data.description && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Description</p>
          <p className="text-small">{data.description}</p>
        </div>
      )}

      {data.philosophy && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Philosophy</p>
          <p className="text-small">{data.philosophy}</p>
        </div>
      )}
    </div>
  );
}

function RelationshipsList({
  relationships,
  direction,
  onNodeSelect,
}: {
  relationships: StatementDetail[];
  direction: 'outgoing' | 'incoming';
  onNodeSelect: (entityType: string, entityId: string) => void;
}) {
  if (relationships.length === 0) {
    return <p className="text-small text-default-400">No {direction} relationships</p>;
  }

  return (
    <div className="space-y-2">
      {relationships.map((rel) => {
        const targetType = direction === 'outgoing' ? rel.objectType : rel.subjectType;
        const targetId = direction === 'outgoing' ? rel.objectId : rel.subjectId;
        const label = PREDICATE_LABELS[rel.predicate] || rel.predicate;

        return (
          <button
            type="button"
            key={rel.id}
            className="flex w-full cursor-pointer items-center justify-between rounded-lg border border-default-200 p-2 text-left transition-colors hover:bg-default-100"
            onClick={() => onNodeSelect(targetType, targetId)}
          >
            <div className="min-w-0 flex-1">
              <p className="text-small font-medium">{direction === 'outgoing' ? label : `${label} by`}</p>
              <p className="truncate text-tiny text-default-500">
                {targetType} • {targetId.slice(0, 8)}...
              </p>
            </div>
            <Chip size="sm" variant="flat" color={rel.confidence === 'verified' ? 'success' : 'default'}>
              {rel.confidence || 'unverified'}
            </Chip>
          </button>
        );
      })}
    </div>
  );
}

export function NodeDetailsPanel({ node, details, isLoading, onClose, onNodeSelect }: NodeDetailsPanelProps) {
  if (!node) {
    return (
      <Card className="h-full">
        <CardBody className="flex items-center justify-center">
          <p className="text-default-400">Select a node to view details</p>
        </CardBody>
      </Card>
    );
  }

  return (
    <Card className="h-full overflow-auto">
      <CardHeader className="flex items-center justify-between pb-0">
        <h2 className="font-semibold">{node.name}</h2>
        <Button isIconOnly size="sm" variant="light" onPress={onClose}>
          <span className="text-lg">&times;</span>
        </Button>
      </CardHeader>
      <CardBody className="gap-4">
        {isLoading ? (
          <div className="flex items-center justify-center py-8">
            <Spinner size="lg" />
          </div>
        ) : details ? (
          <>
            {details.type === 'person' ? (
              <PersonCard data={details.data as PersonDetails} />
            ) : (
              <GroupCard data={details.data as GroupDetails} />
            )}

            <Divider />

            {/* Relationships */}
            <div className="space-y-4">
              <div>
                <h4 className="mb-2 text-small font-semibold">Outgoing ({details.relationships.outgoing.length})</h4>
                <RelationshipsList
                  relationships={details.relationships.outgoing}
                  direction="outgoing"
                  onNodeSelect={onNodeSelect}
                />
              </div>

              <div>
                <h4 className="mb-2 text-small font-semibold">Incoming ({details.relationships.incoming.length})</h4>
                <RelationshipsList
                  relationships={details.relationships.incoming}
                  direction="incoming"
                  onNodeSelect={onNodeSelect}
                />
              </div>
            </div>
          </>
        ) : (
          <div className="space-y-2">
            <p className="text-small">Type: {node.type}</p>
            {node.type === 'person' && (
              <>
                {(node.metadata as PersonMetadata).title && (
                  <p className="text-small">Title: {(node.metadata as PersonMetadata).title}</p>
                )}
                {(node.metadata as PersonMetadata).style && (
                  <p className="text-small">Style: {(node.metadata as PersonMetadata).style}</p>
                )}
              </>
            )}
            {node.type === 'group' && (node.metadata as GroupMetadata).style && (
              <p className="text-small">Style: {(node.metadata as GroupMetadata).style}</p>
            )}
          </div>
        )}
      </CardBody>
    </Card>
  );
}

export default NodeDetailsPanel;

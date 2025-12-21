'use client';

import {
  Accordion,
  AccordionItem,
  Avatar,
  Button,
  Card,
  CardBody,
  CardHeader,
  Chip,
  Spinner,
  Tooltip,
} from '@heroui/react';
import { useAtomValue } from 'jotai';
import { ArrowLeft, ArrowRight, FileText } from 'lucide-react';
import { useState } from 'react';

import { needsRefocusAtom, refocusCallbackAtom } from '@/components/genealogy/state';

import { FullDetailsModal } from './FullDetailsModal';

import type {
  GraphNode,
  GroupDetails,
  GroupMetadata,
  PersonDetails,
  PersonMetadata,
  StatementDetail,
} from '@/components/genealogy/types';
import { PREDICATE_LABELS, PREDICATE_LABELS_INVERSE } from '@/components/genealogy/types';

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
  /** All graph nodes for looking up names by ID */
  allNodes: GraphNode[];
  isLoading: boolean;
  onClose: () => void;
  onNodeSelect: (entityType: string, entityId: string) => void;
  /** When true, renders without Card wrapper (used inside DetailsDrawer) */
  isInDrawer?: boolean;
}

/**
 * Format a key string for display (e.g., "time_and_place" -> "Time And Place").
 */
function formatKey(key: string): string {
  return key.replace(/[-_]/g, ' ').replace(/\b\w/g, (char) => char.toUpperCase());
}

/**
 * Recursively render a value as indented text.
 * Handles primitives, arrays, and nested objects.
 */
function FormattedValue({ value, depth = 0 }: { value: unknown; depth?: number }) {
  const indent = depth > 0 ? 'ml-3' : '';

  // Null/undefined
  if (value === null || value === undefined) {
    return <span className="text-default-400 italic">none</span>;
  }

  // Primitives
  if (typeof value !== 'object') {
    return <span>{String(value)}</span>;
  }

  // Arrays
  if (Array.isArray(value)) {
    if (value.length === 0) {
      return <span className="text-default-400 italic">empty</span>;
    }
    // For arrays of primitives, join with commas
    if (value.every((item) => typeof item !== 'object' || item === null)) {
      return <span>{value.join(', ')}</span>;
    }
    // For arrays of objects, render each on its own line
    return (
      <div className={indent}>
        {value.map((item, index) => (
          // biome-ignore lint/suspicious/noArrayIndexKey: generic rendering of unknown data without stable IDs
          <div key={index} className="mt-1">
            <FormattedValue value={item} depth={depth + 1} />
          </div>
        ))}
      </div>
    );
  }

  // Objects
  const entries = Object.entries(value);
  if (entries.length === 0) {
    return <span className="text-default-400 italic">empty</span>;
  }

  return (
    <div className={indent}>
      {entries.map(([key, val]) => {
        const isNestedObject = val !== null && typeof val === 'object' && !Array.isArray(val);
        const isNestedArray = Array.isArray(val) && val.some((item) => typeof item === 'object' && item !== null);

        return (
          <div key={key} className="mt-1 first:mt-0">
            <span className="font-medium">{formatKey(key)}</span>
            {isNestedObject || isNestedArray ? (
              <>
                :<FormattedValue value={val} depth={depth + 1} />
              </>
            ) : (
              <>
                : <FormattedValue value={val} depth={depth + 1} />
              </>
            )}
          </div>
        );
      })}
    </div>
  );
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

/**
 * Maximum reasonable human lifespan for determining if someone is likely deceased.
 * If born more than this many years ago, show "Unknown" instead of "Present" for missing death date.
 */
const MAX_LIFESPAN_YEARS = 120;

/**
 * Get the appropriate label for a missing death year.
 * Shows "Present" for people who could reasonably still be alive,
 * and "Unknown" for historical figures.
 */
function getDeathYearLabel(birthYear: number | null | undefined): string {
  if (!birthYear) return 'Unknown';
  const currentYear = new Date().getFullYear();
  const age = currentYear - birthYear;
  return age > MAX_LIFESPAN_YEARS ? 'Unknown' : 'Present';
}

function PersonCard({ data }: { data: PersonDetails | undefined }) {
  if (!data) {
    return <p className="text-small text-default-400">No person data available</p>;
  }
  // Build display name with title prefix if available
  const baseName = data.apelido || data.name || 'Unknown';
  const displayName =
    data.title && data.apelido
      ? `${data.title.charAt(0).toUpperCase() + data.title.slice(1)} ${data.apelido}`
      : baseName;
  const lifespan =
    data.birthYear || data.deathYear
      ? `${formatYear(data.birthYear, data.birthYearPrecision)} - ${data.deathYear ? formatYear(data.deathYear, data.deathYearPrecision) : getDeathYearLabel(data.birthYear)}`
      : null;

  return (
    <div className="space-y-3">
      <div className="flex items-start gap-3">
        <Avatar src={data.avatar || undefined} name={baseName} size="lg" className="shrink-0" />
        <div className="min-w-0 flex-1">
          <h3 className="text-lg font-bold">{displayName}</h3>
          {data.name && data.name !== data.apelido && <p className="text-small text-default-500">{data.name}</p>}
          <div className="mt-1 flex flex-wrap gap-1">
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

function GroupCard({ data }: { data: GroupDetails | undefined }) {
  if (!data) {
    return <p className="text-small text-default-400">No group data available</p>;
  }
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

/**
 * Format a date string for display.
 */
function formatDate(dateStr: string | null | undefined): string | null {
  if (!dateStr) return null;
  try {
    const date = new Date(dateStr);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
  } catch {
    return dateStr;
  }
}

/**
 * Render relationship metadata fields in a readable format.
 */
function RelationshipMetadata({ rel }: { rel: StatementDetail }) {
  const hasMetadata = rel.startedAt || rel.endedAt || rel.source || rel.notes || rel.properties;

  if (!hasMetadata) {
    return <p className="text-tiny text-default-400 italic">No additional details available</p>;
  }

  return (
    <div className="space-y-2 text-small">
      {(rel.startedAt || rel.endedAt) && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Period</p>
          <p>
            {formatDate(rel.startedAt) || 'Unknown'} — {formatDate(rel.endedAt) || 'Present'}
          </p>
        </div>
      )}
      {rel.source && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Source</p>
          <p className="text-default-600">{rel.source}</p>
        </div>
      )}
      {rel.notes && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Notes</p>
          <p className="text-default-600">{rel.notes}</p>
        </div>
      )}
      {rel.properties && Object.keys(rel.properties).length > 0 && (
        <div>
          <p className="text-tiny font-semibold text-default-500">Additional Info</p>
          <div className="text-default-600">
            <FormattedValue value={rel.properties} />
          </div>
        </div>
      )}
    </div>
  );
}

function RelationshipsList({
  relationships,
  direction,
  allNodes,
  onNodeSelect,
}: {
  relationships: StatementDetail[];
  direction: 'outgoing' | 'incoming';
  allNodes: GraphNode[];
  onNodeSelect: (entityType: string, entityId: string) => void;
}) {
  if (relationships.length === 0) {
    return <p className="text-small text-default-400">No {direction} relationships</p>;
  }

  // Create lookup maps for node data
  const nodeMap = new Map(allNodes.map((n) => [n.id, n]));

  // Get the inverse label, with special handling for student_of when object is a mestre
  const getInverseLabel = (rel: StatementDetail): string => {
    if (rel.predicate === 'student_of') {
      // For student_of, check if the current node (object) is a mestre
      const objectNode = nodeMap.get(rel.objectId);
      if (objectNode?.type === 'person') {
        const meta = objectNode.metadata as PersonMetadata;
        if (meta.title === 'mestre') {
          return 'Mestre of';
        }
      }
    }
    return PREDICATE_LABELS_INVERSE[rel.predicate] || rel.predicate;
  };

  // Sort relationships alphabetically by predicate label
  const sortedRelationships = [...relationships].sort((a, b) => {
    const labelA = direction === 'outgoing' ? PREDICATE_LABELS[a.predicate] || a.predicate : getInverseLabel(a);
    const labelB = direction === 'outgoing' ? PREDICATE_LABELS[b.predicate] || b.predicate : getInverseLabel(b);
    return labelA.localeCompare(labelB);
  });

  return (
    <Accordion selectionMode="multiple" variant="splitted" className="px-0">
      {sortedRelationships.map((rel) => {
        const targetType = direction === 'outgoing' ? rel.objectType : rel.subjectType;
        const targetId = direction === 'outgoing' ? rel.objectId : rel.subjectId;
        const targetNode = nodeMap.get(targetId);
        const targetName = targetNode?.name || `${targetType} (unknown)`;

        // Use appropriate label based on direction
        const label =
          direction === 'outgoing' ? PREDICATE_LABELS[rel.predicate] || rel.predicate : getInverseLabel(rel);

        return (
          <AccordionItem
            key={rel.id}
            aria-label={`${label}: ${targetName}`}
            classNames={{
              base: 'py-0',
              trigger: 'py-2',
              title: 'text-small',
              content: 'pt-0 pb-3',
            }}
            title={
              <div className="flex items-center gap-2 pr-2">
                <div className="min-w-0 flex-1">
                  <p className="text-small font-medium">{label}</p>
                  <p className="truncate text-tiny text-default-500">{targetName}</p>
                </div>
                <Chip size="sm" variant="flat" color={rel.confidence === 'verified' ? 'success' : 'default'}>
                  {rel.confidence || 'unverified'}
                </Chip>
                <Tooltip content={`Go to ${targetName}`} placement="left">
                  {/* biome-ignore lint/a11y/useSemanticElements: Cannot use button here - it's inside AccordionItem title which renders inside a button element. Nested buttons are invalid HTML. */}
                  <div
                    role="button"
                    tabIndex={0}
                    className="flex h-6 w-6 shrink-0 cursor-pointer items-center justify-center rounded-full bg-primary text-primary-foreground hover:opacity-80"
                    onClick={(e) => {
                      e.stopPropagation();
                      onNodeSelect(targetType, targetId);
                    }}
                    onKeyDown={(e) => {
                      if (e.key === 'Enter' || e.key === ' ') {
                        e.stopPropagation();
                        onNodeSelect(targetType, targetId);
                      }
                    }}
                    aria-label={`Navigate to ${targetName}`}
                  >
                    <ArrowRight className="h-3.5 w-3.5" />
                  </div>
                </Tooltip>
              </div>
            }
          >
            <RelationshipMetadata rel={rel} />
          </AccordionItem>
        );
      })}
    </Accordion>
  );
}

/**
 * Get display name for a node, using "Title Apelido" format for persons with titles.
 */
function getNodeDisplayName(node: GraphNode): string {
  if (node.type === 'person') {
    const meta = node.metadata as PersonMetadata;
    if (meta.title && meta.apelido) {
      const titleCap = meta.title.charAt(0).toUpperCase() + meta.title.slice(1);
      return `${titleCap} ${meta.apelido}`;
    }
    if (meta.apelido) return meta.apelido;
  }
  return node.name;
}

export function NodeDetailsPanel({
  node,
  details,
  allNodes,
  isLoading,
  onClose,
  onNodeSelect,
  isInDrawer = false,
}: NodeDetailsPanelProps) {
  const [isFullDetailsOpen, setIsFullDetailsOpen] = useState(false);
  const needsRefocus = useAtomValue(needsRefocusAtom);
  const refocusCallback = useAtomValue(refocusCallbackAtom);

  // Empty state - only shown when not in drawer (drawer handles its own visibility)
  if (!node && !isInDrawer) {
    return (
      <Card className="h-full">
        <CardBody className="flex items-center justify-center">
          <p className="text-default-400">Select a node to view details</p>
        </CardBody>
      </Card>
    );
  }

  // When in drawer and no node, return null (drawer handles visibility)
  if (!node) {
    return null;
  }

  // Content that's shared between Card and Drawer modes
  const panelContent = (
    <>
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

          {/* Full Details Button - replaces divider */}
          <Button
            size="md"
            variant="flat"
            color="secondary"
            startContent={<FileText className="h-4 w-4" />}
            onPress={() => setIsFullDetailsOpen(true)}
            className="w-full"
          >
            Full Details
          </Button>

          {/* Relationships */}
          <div className="space-y-4">
            <div>
              <h4 className="mb-2 text-small font-semibold">Outgoing ({details.relationships.outgoing.length})</h4>
              <RelationshipsList
                relationships={details.relationships.outgoing}
                direction="outgoing"
                allNodes={allNodes}
                onNodeSelect={onNodeSelect}
              />
            </div>

            <div>
              <h4 className="mb-2 text-small font-semibold">Incoming ({details.relationships.incoming.length})</h4>
              <RelationshipsList
                relationships={details.relationships.incoming}
                direction="incoming"
                allNodes={allNodes}
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
    </>
  );

  // When in drawer mode, return just the content (drawer provides wrapper)
  if (isInDrawer) {
    return (
      <>
        <div className="flex flex-col gap-4 p-4">{panelContent}</div>
        <FullDetailsModal
          isOpen={isFullDetailsOpen}
          onClose={() => setIsFullDetailsOpen(false)}
          entityType={node.type as 'person' | 'group'}
          entityId={node.id}
          entityName={node.name}
        />
      </>
    );
  }

  // Desktop mode: Card wrapper with header
  return (
    <>
      <Card>
        <CardHeader className="flex items-center justify-between pb-0">
          <div className="flex items-center gap-2">
            {needsRefocus && refocusCallback && (
              <Tooltip content="Refocus" placement="bottom">
                <Button
                  isIconOnly
                  size="sm"
                  variant="flat"
                  color="primary"
                  onPress={refocusCallback}
                  aria-label="Refocus on selected node"
                >
                  <ArrowLeft className="h-4 w-4" />
                </Button>
              </Tooltip>
            )}
            <h2 className="font-semibold">{getNodeDisplayName(node)}</h2>
          </div>
          <Button isIconOnly size="sm" variant="light" onPress={onClose}>
            <span className="text-lg">&times;</span>
          </Button>
        </CardHeader>
        <CardBody className="gap-4">{panelContent}</CardBody>
      </Card>

      <FullDetailsModal
        isOpen={isFullDetailsOpen}
        onClose={() => setIsFullDetailsOpen(false)}
        entityType={node.type as 'person' | 'group'}
        entityId={node.id}
        entityName={node.name}
      />
    </>
  );
}

export default NodeDetailsPanel;

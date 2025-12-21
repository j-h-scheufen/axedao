'use client';

import { Autocomplete, AutocompleteItem } from '@heroui/react';
import { SearchIcon } from 'lucide-react';
import { useMemo, useState } from 'react';

import type { GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import { NODE_COLORS } from '@/components/genealogy/types';
import { matchesNormalized } from '@/utils';

interface NodeSearchProps {
  /** All nodes available for searching */
  nodes: GraphNode[];
  /** Currently selected node ID */
  selectedNodeId: string | null;
  /** Callback when a node is selected */
  onNodeSelect: (nodeId: string | null) => void;
  /** Loading state */
  isLoading?: boolean;
  /** Disabled state */
  isDisabled?: boolean;
  /** Additional className for the autocomplete */
  className?: string;
}

/**
 * Search component for finding nodes in the genealogy graph.
 * Searches persons by apelido, alias apelido, and full name.
 * Searches groups by name.
 */
export function NodeSearch({
  nodes,
  selectedNodeId,
  onNodeSelect,
  isLoading = false,
  isDisabled = false,
  className,
}: NodeSearchProps) {
  const [searchTerm, setSearchTerm] = useState('');

  // Filter nodes based on search term (accent-insensitive)
  const filteredNodes = useMemo(() => {
    if (!searchTerm.trim()) {
      return [];
    }

    return nodes
      .filter((node) => {
        // Always match against the primary name (accent-insensitive)
        if (matchesNormalized(node.name, searchTerm)) {
          return true;
        }

        // For persons, also match against fullName and apelido in metadata
        if (node.type === 'person') {
          const meta = node.metadata as PersonMetadata;
          if (matchesNormalized(meta.fullName, searchTerm)) {
            return true;
          }
          if (matchesNormalized(meta.apelido, searchTerm)) {
            return true;
          }
        }

        return false;
      })
      .slice(0, 20); // Limit results for performance
  }, [nodes, searchTerm]);

  // Get display info for a node
  const getNodeDisplayInfo = (node: GraphNode) => {
    if (node.type === 'person') {
      const meta = node.metadata as PersonMetadata;
      const title = meta.title as keyof (typeof NODE_COLORS)['person'] | undefined;
      const color = title && NODE_COLORS.person[title] ? NODE_COLORS.person[title] : NODE_COLORS.person.default;
      // Capitalize first letter of title, or show "Historical" for no title
      const badge = meta.title ? meta.title.charAt(0).toUpperCase() + meta.title.slice(1) : 'Historical';
      return {
        primary: node.name,
        secondary: meta.fullName && meta.fullName !== node.name ? meta.fullName : null,
        badge,
        color,
      };
    }
    // Group
    const meta = node.metadata as GroupMetadata;
    const style = meta.style as keyof (typeof NODE_COLORS)['group'] | undefined;
    const color = style && NODE_COLORS.group[style] ? NODE_COLORS.group[style] : NODE_COLORS.group.default;
    const badge = meta.style ? meta.style.charAt(0).toUpperCase() + meta.style.slice(1) : 'Group';
    return {
      primary: node.name,
      secondary: null,
      badge,
      color,
    };
  };

  const handleSelection = (key: string | number | null) => {
    onNodeSelect(key?.toString() || null);
    if (key) {
      setSearchTerm('');
    }
  };

  return (
    <Autocomplete
      className={className}
      size="sm"
      variant="bordered"
      label="Search"
      placeholder="Search persons or groups..."
      aria-label="Search genealogy nodes"
      startContent={<SearchIcon className="h-4 w-4 text-default-400" strokeWidth={1.5} />}
      items={filteredNodes}
      isLoading={isLoading}
      isDisabled={isDisabled}
      inputValue={searchTerm}
      selectedKey={selectedNodeId}
      listboxProps={{
        emptyContent: searchTerm.trim() ? 'No matches found' : 'Type to search...',
      }}
      onInputChange={setSearchTerm}
      onSelectionChange={handleSelection}
      onClear={() => {
        setSearchTerm('');
        onNodeSelect(null);
      }}
      allowsCustomValue={false}
      isClearable
    >
      {(node: GraphNode) => {
        const info = getNodeDisplayInfo(node);
        return (
          <AutocompleteItem
            key={node.id}
            textValue={node.name}
            aria-label={`${node.type === 'person' ? 'Person' : 'Group'}: ${node.name}`}
          >
            <div className="flex items-center justify-between gap-2">
              <div className="flex min-w-0 flex-col">
                <span className="truncate font-medium">{info.primary}</span>
                {info.secondary && <span className="truncate text-tiny text-default-400">{info.secondary}</span>}
              </div>
              <span
                className="shrink-0 rounded px-1.5 py-0.5 text-tiny text-white"
                style={{ backgroundColor: info.color }}
              >
                {info.badge}
              </span>
            </div>
          </AutocompleteItem>
        );
      }}
    </Autocomplete>
  );
}

export default NodeSearch;

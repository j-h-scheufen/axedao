'use client';

import { Autocomplete, AutocompleteItem } from '@heroui/react';
import { SearchIcon } from 'lucide-react';
import { useMemo, useState } from 'react';

import type { GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import { NODE_COLORS } from '@/components/genealogy/types';

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
}: NodeSearchProps) {
  const [searchTerm, setSearchTerm] = useState('');

  // Filter nodes based on search term
  const filteredNodes = useMemo(() => {
    if (!searchTerm.trim()) {
      return [];
    }

    const term = searchTerm.toLowerCase();

    return nodes
      .filter((node) => {
        // Always match against the primary name
        if (node.name.toLowerCase().includes(term)) {
          return true;
        }

        // For persons, also match against fullName and apelido in metadata
        if (node.type === 'person') {
          const meta = node.metadata as PersonMetadata;
          if (meta.fullName?.toLowerCase().includes(term)) {
            return true;
          }
          if (meta.apelido?.toLowerCase().includes(term)) {
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

  return (
    <Autocomplete
      className="w-80"
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
      onInputChange={(value) => {
        setSearchTerm(value);
      }}
      onSelectionChange={(key) => {
        onNodeSelect(key?.toString() || null);
        if (key) {
          // Clear search after selection to show placeholder
          setSearchTerm('');
        }
      }}
      // Clear selection when input is cleared
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
              <div className="flex flex-col min-w-0">
                <span className="font-medium truncate">{info.primary}</span>
                {info.secondary && <span className="text-tiny text-default-400 truncate">{info.secondary}</span>}
              </div>
              <span
                className="text-tiny px-1.5 py-0.5 rounded shrink-0 text-white"
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

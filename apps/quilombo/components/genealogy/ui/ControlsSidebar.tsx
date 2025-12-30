'use client';

import { Button } from '@heroui/react';
import { ChevronsLeft, ChevronsRight } from 'lucide-react';
import { useState } from 'react';

import { GraphControls } from './GraphControls';

import type { GraphStats } from '@/components/genealogy/types';

interface ControlsSidebarProps {
  /** Graph statistics */
  stats: GraphStats | undefined;
  /** Loading state */
  isLoading: boolean;
  /** IDs of nodes currently in the filtered graph */
  nodeIds?: ReadonlySet<string>;
  /** Default expanded state */
  defaultExpanded?: boolean;
}

/** Width of the sidebar when expanded */
const SIDEBAR_WIDTH = 256; // 16rem = 256px

/**
 * Collapsible sidebar for GraphControls on desktop.
 * Pushes the main content when expanded (not overlay).
 * Shows a thin toggle strip when collapsed.
 */
export function ControlsSidebar({ stats, isLoading, nodeIds, defaultExpanded = true }: ControlsSidebarProps) {
  const [isExpanded, setIsExpanded] = useState(defaultExpanded);

  return (
    <div
      className="relative flex h-full shrink-0 border-r border-default-200 bg-background transition-all duration-300 ease-in-out"
      style={{ width: isExpanded ? SIDEBAR_WIDTH : 40 }}
    >
      {/* Sidebar content - hidden when collapsed */}
      <div
        className={`h-full overflow-hidden transition-opacity duration-200 ${
          isExpanded ? 'opacity-100' : 'pointer-events-none opacity-0'
        }`}
        style={{ width: SIDEBAR_WIDTH }}
      >
        {/* Header */}
        <div className="flex items-center justify-between border-b border-default-200 px-3 py-2">
          <span className="text-sm font-semibold">Filters & Controls</span>
          <Button
            isIconOnly
            variant="light"
            size="sm"
            onPress={() => setIsExpanded(false)}
            aria-label="Collapse sidebar"
          >
            <ChevronsLeft className="h-4 w-4" />
          </Button>
        </div>

        {/* Controls content */}
        <div className="h-[calc(100%-44px)] overflow-y-auto">
          <GraphControls stats={stats} isLoading={isLoading} nodeIds={nodeIds} />
        </div>
      </div>

      {/* Collapsed toggle button - visible when collapsed */}
      {!isExpanded && (
        <div className="absolute inset-0 flex items-start justify-center pt-3">
          <Button isIconOnly variant="light" size="sm" onPress={() => setIsExpanded(true)} aria-label="Expand sidebar">
            <ChevronsRight className="h-4 w-4" />
          </Button>
        </div>
      )}
    </div>
  );
}

export default ControlsSidebar;

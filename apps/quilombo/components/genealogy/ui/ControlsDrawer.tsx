'use client';

import { Button, Drawer, DrawerBody, DrawerContent, DrawerHeader, useDisclosure } from '@heroui/react';
import { Menu } from 'lucide-react';

import { GraphControls } from './GraphControls';

import type { GraphStats } from '@/components/genealogy/types';

interface ControlsDrawerProps {
  /** Graph statistics */
  stats: GraphStats | undefined;
  /** Loading state */
  isLoading: boolean;
  /** IDs of nodes currently in the filtered graph */
  nodeIds?: ReadonlySet<string>;
}

/**
 * Overlay drawer for GraphControls on mobile/tablet.
 * Shows a hamburger button that opens the drawer with blur backdrop.
 * For desktop, use ControlsSidebar instead.
 */
export function ControlsDrawer({ stats, isLoading, nodeIds }: ControlsDrawerProps) {
  const { isOpen, onOpen, onClose, onOpenChange } = useDisclosure();

  return (
    <>
      {/* Toggle button */}
      <Button
        isIconOnly
        variant="flat"
        size="sm"
        onPress={onOpen}
        className="absolute left-3 top-3 z-20"
        aria-label="Open filters"
      >
        <Menu className="h-5 w-5" />
      </Button>

      <Drawer
        isOpen={isOpen}
        onOpenChange={onOpenChange}
        placement="left"
        size="xs"
        backdrop="blur"
        classNames={{
          base: 'max-w-64',
          body: 'p-0',
        }}
      >
        <DrawerContent>
          <DrawerHeader className="border-b border-default-200 py-2">
            <span className="text-sm font-semibold">Filters & Controls</span>
          </DrawerHeader>
          <DrawerBody className="overflow-y-auto">
            <GraphControls stats={stats} isLoading={isLoading} nodeIds={nodeIds} onClose={onClose} />
          </DrawerBody>
        </DrawerContent>
      </Drawer>
    </>
  );
}

export default ControlsDrawer;

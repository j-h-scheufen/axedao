'use client';

import { Drawer, DrawerBody, DrawerContent } from '@heroui/react';
import { useSetAtom } from 'jotai';
import { useCallback, useEffect, useMemo, useState } from 'react';

import { useResponsiveLayout } from '@/hooks/useResponsiveLayout';

import { mobileDrawerOpenAtom } from '@/components/genealogy/state';
import { NodeDetailsPanel } from './NodeDetailsPanel';

import type { GraphNode, GroupDetails, PersonDetails, StatementDetail } from '@/components/genealogy/types';

interface DetailsDrawerProps {
  /** Selected node to display */
  node: GraphNode | null;
  /** Node details (fetched data) */
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
  /** Loading state */
  isLoading: boolean;
  /** Callback when drawer is closed */
  onClose: () => void;
  /** Callback when a related node is selected */
  onNodeSelect: (entityType: string, entityId: string) => void;
}

/**
 * Responsive drawer wrapper for NodeDetailsPanel.
 * - Desktop: Right-side drawer, opens when node selected
 * - Mobile Portrait: Bottom sheet drawer
 * - Mobile Landscape: Right-side drawer
 */
export function DetailsDrawer({ node, details, allNodes, isLoading, onClose, onNodeSelect }: DetailsDrawerProps) {
  const { isMobile, detailsDrawerPlacement } = useResponsiveLayout();
  const [isOpen, setIsOpen] = useState(false);
  const setMobileDrawerOpen = useSetAtom(mobileDrawerOpenAtom);

  // Sync drawer open state with node selection
  useEffect(() => {
    if (node) {
      setIsOpen(true);
    } else {
      setIsOpen(false);
    }
  }, [node]);

  // Track when drawer is open on mobile for camera offset calculations
  useEffect(() => {
    const isMobileDrawerOpen = isOpen && isMobile;
    setMobileDrawerOpen(isMobileDrawerOpen);

    return () => setMobileDrawerOpen(false);
  }, [isOpen, isMobile, setMobileDrawerOpen]);

  const handleOpenChange = (open: boolean) => {
    setIsOpen(open);
    if (!open) {
      onClose();
    }
  };

  const handleClose = useCallback(() => {
    setIsOpen(false);
    onClose();
  }, [onClose]);

  // Swipe-to-dismiss for bottom sheet drawer
  // Threshold: 100px drag down closes the drawer
  const SWIPE_THRESHOLD = 100;

  const handleDragEnd = useCallback(
    (_event: MouseEvent | TouchEvent | PointerEvent, info: { offset: { y: number } }) => {
      if (info.offset.y > SWIPE_THRESHOLD) {
        handleClose();
      }
    },
    [handleClose]
  );

  // Motion props for swipe-to-dismiss (only for bottom placement)
  const motionProps = useMemo(() => {
    if (detailsDrawerPlacement !== 'bottom') {
      return undefined;
    }

    return {
      drag: 'y' as const,
      dragConstraints: { top: 0, bottom: 0 },
      dragElastic: { top: 0, bottom: 0.5 },
      onDragEnd: handleDragEnd,
    };
  }, [detailsDrawerPlacement, handleDragEnd]);

  // Determine drawer size based on placement
  // Bottom drawer needs more height, right drawer needs consistent width
  const drawerSize = detailsDrawerPlacement === 'bottom' ? 'lg' : 'md';

  return (
    <Drawer
      isOpen={isOpen}
      onOpenChange={handleOpenChange}
      placement={detailsDrawerPlacement}
      size={drawerSize}
      backdrop="transparent"
      motionProps={motionProps}
      classNames={{
        base: detailsDrawerPlacement === 'bottom' ? 'max-h-[50vh]' : 'max-w-80',
        body: 'p-0',
      }}
    >
      <DrawerContent>
        {/* Drag handle indicator for bottom sheet */}
        {detailsDrawerPlacement === 'bottom' && (
          <div className="flex justify-center pt-2 pb-1">
            <div className="h-1 w-10 rounded-full bg-default-300" />
          </div>
        )}
        <DrawerBody className="overflow-y-auto">
          <NodeDetailsPanel
            node={node}
            details={details}
            allNodes={allNodes}
            isLoading={isLoading}
            onClose={handleClose}
            onNodeSelect={onNodeSelect}
            isInDrawer
          />
        </DrawerBody>
      </DrawerContent>
    </Drawer>
  );
}

export default DetailsDrawer;

'use client';

import { Modal, ModalBody, ModalContent, ModalHeader, useDisclosure } from '@heroui/react';
import { useEffect, useRef, type ReactNode } from 'react';

import { useMediaQuery } from '@/hooks/useMediaQuery';

import { WizardProgress } from './WizardProgress';

interface OnboardingContainerProps {
  /** Whether the wizard should be shown */
  isOpen: boolean;
  /** Title displayed in the header */
  title: string;
  /** Child content (wizard steps) */
  children: ReactNode;
  /** Whether to show the progress indicator */
  showProgress?: boolean;
}

/**
 * Responsive container for the onboarding wizard.
 * - Mobile: Full-screen page layout
 * - Desktop: Modal dialog (non-dismissable)
 */
export function OnboardingContainer({ isOpen, title, children, showProgress = true }: OnboardingContainerProps) {
  const isMobile = useMediaQuery('(max-width: 768px)');
  const { isOpen: modalIsOpen, onOpen, onClose: modalOnClose } = useDisclosure();
  const contentRef = useRef<HTMLDivElement>(null);

  // Sync external isOpen with internal modal state
  useEffect(() => {
    if (isOpen) {
      onOpen();
    } else {
      modalOnClose();
    }
  }, [isOpen, onOpen, modalOnClose]);

  // Scroll content to top when step changes (title changes on each step)
  // biome-ignore lint/correctness/useExhaustiveDependencies: title is intentionally used to trigger scroll on step change
  useEffect(() => {
    if (contentRef.current) {
      contentRef.current.scrollTo({ top: 0, behavior: 'instant' });
    }
  }, [title]);

  // Mobile: Full-screen layout
  if (isMobile) {
    if (!isOpen) return null;

    return (
      <div className="fixed inset-0 z-50 flex flex-col bg-background">
        {/* Header */}
        <div className="shrink-0 px-2 sm:px-4 py-4">
          <h1 className="text-xl font-bold">{title}</h1>
          {showProgress && (
            <div className="mt-3">
              <WizardProgress />
            </div>
          )}
        </div>

        {/* Content - extra bottom padding for fixed navigation footer */}
        <div ref={contentRef} className="flex-1 overflow-y-auto px-2 sm:px-4 py-4 pb-24">
          {children}
        </div>
      </div>
    );
  }

  // Desktop: Modal layout
  return (
    <Modal
      isOpen={modalIsOpen}
      onOpenChange={(open) => {
        if (!open) {
          // Don't allow dismissal by clicking outside or pressing escape
          // The wizard must be completed or explicitly skipped
        }
      }}
      isDismissable={false}
      isKeyboardDismissDisabled
      hideCloseButton
      size="2xl"
      scrollBehavior="inside"
      classNames={{
        base: 'max-h-[90vh]',
        body: 'py-4',
      }}
    >
      <ModalContent>
        <ModalHeader className="flex flex-col gap-1 pb-0">
          <span className="text-xl">{title}</span>
          {showProgress && (
            <div className="mt-2">
              <WizardProgress />
            </div>
          )}
        </ModalHeader>
        <ModalBody>{children}</ModalBody>
      </ModalContent>
    </Modal>
  );
}

export default OnboardingContainer;

'use client';

import { useEffect, useState } from 'react';
import {
  Accordion,
  AccordionItem,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button,
  Checkbox,
  Tooltip,
} from '@heroui/react';
import { useTheme } from 'next-themes';
import { Mail } from 'lucide-react';
import { useSearchParams } from 'next/navigation';
import { enqueueSnackbar } from 'notistack';

import PageHeading from '@/components/PageHeading';
import { ThemeSwitch, AuthenticationManagement } from '@/components/settings';
import { useFetchAuthMethods, useUpdateCurrentUserMutation } from '@/query/currentUser';
import { useAtomValue } from 'jotai';
import { currentUserAtom } from '@/hooks/state/currentUser';

const SettingsPage = () => {
  const { theme } = useTheme();
  const searchParams = useSearchParams();
  const [expandedKeys, setExpandedKeys] = useState<Set<string>>(new Set([]));
  const [showEmailUpdateModal, setShowEmailUpdateModal] = useState(false);
  const [isConfirming, setIsConfirming] = useState(false);
  const [mounted, setMounted] = useState(false);
  const [emailUpdateData, setEmailUpdateData] = useState<{
    currentEmail: string;
    newEmail: string;
  } | null>(null);

  // Fetch auth methods to get contact email
  const { data: authMethods } = useFetchAuthMethods();

  // Fetch current user for privacy settings
  const { data: user } = useAtomValue(currentUserAtom);
  const { mutateAsync: updateProfile } = useUpdateCurrentUserMutation();

  // Avoid hydration mismatch with theme
  useEffect(() => {
    setMounted(true);
  }, []);

  const isDarkMode = mounted && theme === 'dark';

  // Handle error parameter from OAuth redirect
  useEffect(() => {
    const error = searchParams.get('error');
    if (error) {
      enqueueSnackbar(error, { variant: 'error' });
      // Clean up URL by replacing state without the error param
      const url = new URL(window.location.href);
      url.searchParams.delete('error');
      window.history.replaceState({}, '', url.toString());
    }
  }, [searchParams]);

  // Handle email update confirmation prompt
  useEffect(() => {
    const confirmEmailUpdate = searchParams.get('confirm_email_update');

    if (confirmEmailUpdate === 'true') {
      // Fetch the pending link data from server-side cookie
      const fetchPendingLink = async () => {
        try {
          const response = await fetch('/api/auth/oauth-link');
          if (response.ok) {
            const data = await response.json();
            if (data.currentEmail && data.newEmail) {
              setEmailUpdateData({
                currentEmail: data.currentEmail,
                newEmail: data.newEmail,
              });
              setShowEmailUpdateModal(true);
            }
          }
        } catch (error) {
          console.error('Failed to fetch pending link data:', error);
        }
      };

      fetchPendingLink();

      // Clean up URL
      const url = new URL(window.location.href);
      url.searchParams.delete('confirm_email_update');
      window.history.replaceState({}, '', url.toString());
    }
  }, [searchParams]);

  const handleConfirmEmailUpdate = async () => {
    if (!emailUpdateData) return;

    setIsConfirming(true);
    setShowEmailUpdateModal(false);

    try {
      // Call API endpoint to complete the linking using stored OAuth data
      const response = await fetch('/api/auth/oauth-link', {
        method: 'POST',
      });

      if (!response.ok) {
        const data = await response.json();
        throw new Error(data.error || 'Failed to link OAuth account');
      }

      // Refresh auth methods to show updated state
      window.location.reload();
    } catch (error) {
      console.error('Failed to confirm email update:', error);
      enqueueSnackbar(error instanceof Error ? error.message : 'Failed to update email. Please try again.', {
        variant: 'error',
      });
      setIsConfirming(false);
    }
  };

  const handleCancelEmailUpdate = async () => {
    setShowEmailUpdateModal(false);
    setEmailUpdateData(null);

    // Clear the pending link cookie when user cancels
    try {
      await fetch('/api/auth/oauth-link', { method: 'DELETE' });
    } catch (error) {
      console.error('Failed to cancel OAuth link:', error);
    }
  };

  const handleHideEmailChange = async (checked: boolean) => {
    try {
      await updateProfile({ hideEmail: checked, links: user?.links || [] });
      enqueueSnackbar(checked ? 'Email hidden from profile' : 'Email visible on profile', { variant: 'success' });
    } catch (error) {
      console.error('Failed to update privacy setting:', error);
      enqueueSnackbar('Failed to update privacy setting', { variant: 'error' });
    }
  };

  return (
    <>
      <PageHeading>Settings</PageHeading>
      <div className="flex flex-col items-start mt-3">
        {/* Contact Email Section */}
        {authMethods?.notificationEmail && (
          <div className="w-full mb-4 p-4 bg-default-100 rounded-lg border border-default-200">
            <div className="flex items-start gap-3">
              <Mail className="w-6 h-6 text-primary mt-0.5" strokeWidth={1.5} />
              <div className="flex-1">
                <h3 className="text-sm font-semibold text-default-700 mb-1">Contact Email</h3>
                <p className="text-base font-medium text-default-900 mb-1">{authMethods.notificationEmail}</p>
                <p className="text-xs text-default-500">
                  Used for account updates, security alerts, and platform notifications
                </p>
              </div>
            </div>
          </div>
        )}

        <Accordion
          className="w-full"
          variant="bordered"
          selectedKeys={expandedKeys}
          onSelectionChange={(keys) => setExpandedKeys(keys as Set<string>)}
        >
          <AccordionItem
            key="dark-mode"
            aria-label="Dark Mode"
            title="Dark Mode"
            subtitle={isDarkMode ? 'Dark Mode is On' : 'Dark Mode is Off'}
            classNames={{
              trigger: 'py-4',
            }}
          >
            <div className="flex items-center justify-between pb-4">
              <span className="text-sm text-default-500">
                {isDarkMode ? 'Switch to light mode' : 'Switch to dark mode'}
              </span>
              <ThemeSwitch />
            </div>
          </AccordionItem>

          <AccordionItem
            key="auth-methods"
            aria-label="Authentication Methods"
            title="Authentication Methods"
            subtitle="Manage how you sign in to your account"
            classNames={{
              trigger: 'py-4',
            }}
          >
            <div className="pb-4">
              <AuthenticationManagement />
            </div>
          </AccordionItem>

          <AccordionItem
            key="privacy"
            aria-label="Privacy"
            title="Privacy"
            subtitle="Control what information is visible on your profile"
            classNames={{
              trigger: 'py-4',
            }}
          >
            <div className="pb-4 space-y-4">
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  <Tooltip
                    content="When enabled, your email address will not be shown on your public profile"
                    placement="right"
                    className="max-w-xs"
                  >
                    <Checkbox isSelected={user?.hideEmail || false} onValueChange={handleHideEmailChange} size="md">
                      <div>
                        <div className="font-medium">Hide Email from Profile</div>
                        <div className="text-xs text-default-500 mt-1">
                          Your email will not be visible to other users when they view your profile
                        </div>
                      </div>
                    </Checkbox>
                  </Tooltip>
                </div>
              </div>
            </div>
          </AccordionItem>
        </Accordion>
      </div>

      {/* Email Update Confirmation Modal */}
      <Modal isOpen={showEmailUpdateModal} onClose={handleCancelEmailUpdate} isDismissable={!isConfirming}>
        <ModalContent>
          <ModalHeader>Update Primary Email?</ModalHeader>
          <ModalBody>
            <div className="flex flex-col gap-3">
              <p>
                The Google account you're trying to link has a different email address than your current account email.
              </p>
              <div className="p-3 bg-default-100 rounded-lg">
                <p className="text-sm">
                  <span className="font-semibold">Current email:</span>{' '}
                  <span className="text-default-600">{emailUpdateData?.currentEmail}</span>
                </p>
                <p className="text-sm mt-1">
                  <span className="font-semibold">Google email:</span>{' '}
                  <span className="text-primary">{emailUpdateData?.newEmail}</span>
                </p>
              </div>
              <p className="text-sm text-default-600">
                Would you like to update your primary account email to match the Google account email and link this
                Google account?
              </p>
              <div className="p-3 bg-warning-50 rounded-lg border border-warning-200">
                <p className="text-sm text-warning-700">
                  <strong>Note:</strong> Your primary email will be changed to{' '}
                  <strong>{emailUpdateData?.newEmail}</strong>. This will be used for all account notifications and
                  login.
                </p>
              </div>
            </div>
          </ModalBody>
          <ModalFooter>
            <Button variant="flat" onPress={handleCancelEmailUpdate} isDisabled={isConfirming}>
              Cancel
            </Button>
            <Button color="primary" onPress={handleConfirmEmailUpdate} isLoading={isConfirming}>
              Yes, Update Email & Link Google
            </Button>
          </ModalFooter>
        </ModalContent>
      </Modal>
    </>
  );
};

export default SettingsPage;

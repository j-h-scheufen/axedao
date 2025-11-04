'use client';

import { Accordion, AccordionItem } from '@heroui/react';
import { useTheme } from 'next-themes';
import { Mail } from 'lucide-react';

import PageHeading from '@/components/PageHeading';
import { ThemeSwitch } from '@/components/settings/ThemeSwitch';
import AuthenticationManagement from '@/components/settings/AuthenticationManagement';
import { useFetchAuthMethods } from '@/query/currentUser';

const SettingsPage = () => {
  const { theme } = useTheme();
  const isDarkMode = theme === 'dark';

  // Fetch auth methods to get contact email
  const { data: authMethods } = useFetchAuthMethods();

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

        <Accordion className="w-full" variant="bordered">
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
        </Accordion>
      </div>
    </>
  );
};

export default SettingsPage;

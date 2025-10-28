'use client';

import { Accordion, AccordionItem } from '@heroui/react';
import { useTheme } from 'next-themes';
import PageHeading from '@/components/PageHeading';
import { ThemeSwitch } from '@/components/settings/ThemeSwitch';
import AuthenticationManagement from '@/components/settings/AuthenticationManagement';

const SettingsPage = () => {
  const { theme } = useTheme();
  const isDarkMode = theme === 'dark';

  return (
    <>
      <PageHeading>Settings</PageHeading>
      <div className="flex flex-col items-start px-2 mt-3">
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

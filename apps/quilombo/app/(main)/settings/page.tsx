import PageHeading from '@/components/PageHeading';
import { ThemeSwitch } from '@/components/ThemeSwitch';
import AuthenticationManagement from '@/components/AuthenticationManagement';

const SettingsPage = () => {
  return (
    <>
      <PageHeading>Settings</PageHeading>
      <div className="flex flex-col items-start px-2 mt-3 gap-6">
        <div className="flex w-full gap-3">
          <h2 className="text-lg font-semibold">Light or Dark?</h2>
          <ThemeSwitch />
        </div>

        <AuthenticationManagement />
      </div>
    </>
  );
};

export default SettingsPage;

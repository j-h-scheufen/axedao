import PageHeading from '@/components/PageHeading';
import { ThemeSwitch } from '@/components/ThemeSwitch';

const SettingsPage = () => {
  return (
    <>
      <PageHeading>Settings</PageHeading>
      <div className="flex flex-col items-start px-2 mt-3 gap-3">
        <div className="flex w-full gap-3">
          <h2 className="text-lg font-semibold">Light or Dark?</h2>
          <ThemeSwitch />
        </div>
      </div>
    </>
  );
};

export default SettingsPage;

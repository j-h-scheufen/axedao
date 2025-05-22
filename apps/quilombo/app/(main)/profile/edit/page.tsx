import PageHeading from '@/components/PageHeading';
import { ProfileEdit } from '@/components/forms/profile';
import { PATHS } from '@/config/constants';

const page = () => {
  return (
    <div className="flex flex-col">
      <PageHeading backUrl={PATHS.profile}>Edit profile</PageHeading>
      <ProfileEdit />
    </div>
  );
};
export default page;

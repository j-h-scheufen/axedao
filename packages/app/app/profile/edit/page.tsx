import PageHeading from '@/components/PageHeading';
import ProfileForm from '@/components/ProfileForm';
import { PATHS } from '@/config/constants';

const page = () => {
  return (
    <>
      <PageHeading back={PATHS.profile}>Edit profile</PageHeading>
      <ProfileForm />
    </>
  );
};
export default page;

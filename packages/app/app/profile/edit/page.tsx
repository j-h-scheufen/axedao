import PageHeading from '@/components/PageHeading';
import ProfileForm from '../_components/ProfileForm';

const page = () => {
  return (
    <>
      <PageHeading back="/dashboard/profile">Edit profile</PageHeading>
      <ProfileForm />
    </>
  );
};
export default page;

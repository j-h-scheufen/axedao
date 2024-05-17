import PageHeading from '@/components/PageHeading';
import ProfileForm from '@/components/ProfileForm';

const page = () => {
  return (
    <>
      <PageHeading back="/dashboard/profile">Create profile</PageHeading>
      <ProfileForm />
    </>
  );
};
export default page;

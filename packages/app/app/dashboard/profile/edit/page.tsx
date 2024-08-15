import ProfileForm from '@/app/dashboard/profile/_components/ProfileForm';
import PageHeading from '@/components/PageHeading';

const page = () => {
  return (
    <>
      <PageHeading back="/dashboard/profile">Edit profile</PageHeading>
      <ProfileForm />
    </>
  );
};
export default page;

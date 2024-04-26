import PageHeading from '@/components/PageHeading';
import ProfileForm from '@/components/ProfileForm';

type Props = {};
const page = (props: Props) => {
  return (
    <>
      <PageHeading back="/dashboard/profile">Edit profile</PageHeading>
      <ProfileForm />
    </>
  );
};
export default page;

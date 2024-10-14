import ImageUpload from '@/components/forms/ImageUpload';
import PageHeading from '@/components/PageHeading';
import ProfileForm from '@/components/ProfileForm';
import { PATHS } from '@/config/constants';

const page = () => {
  return (
    <div className="flex flex-col">
      <PageHeading back={PATHS.profile}>Edit profile</PageHeading>
      <ImageUpload />
      <ProfileForm />
    </div>
  );
};
export default page;

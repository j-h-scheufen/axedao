import RegistrationForm from '@/components/RegistrationForm';

type Props = {};
const page = (props: Props) => {
  return (
    <div className="flex min-h-[calc(100vh-100px)] flex-col text-center">
      <div className="mb-5">
        <h1 className="text-lg font-semibold text-neutral-400">Register</h1>
        <p className="text-neutral-500">You only have to do this once</p>
      </div>
      <RegistrationForm />
    </div>
  );
};
export default page;

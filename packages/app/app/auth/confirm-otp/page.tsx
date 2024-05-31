import ConfirmationForm from '@/components/ConfirmationForm';

const page = () => {
  return (
    <div className="flex min-h-[calc(100vh-100px)] flex-col text-center">
      <div className="mb-5">
        <h1 className="text-lg font-semibold text-neutral-400">Confirm your email</h1>
        <p className="text-neutral-500">We have sent an One Time Passoword (OTP) to your email</p>
      </div>
      <ConfirmationForm />
    </div>
  );
};
export default page;

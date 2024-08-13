import AuthForms from '@/components/AuthForms';
import { getServerSession } from 'next-auth';
import { redirect } from 'next/navigation';

const page = async () => {
  const session = await getServerSession();

  if (session) {
    redirect('/dashboard/profile');
  }

  return (
    <div className="flex min-h-[calc(100vh-100px)] flex-col text-center">
      <AuthForms />
    </div>
  );
};
export default page;

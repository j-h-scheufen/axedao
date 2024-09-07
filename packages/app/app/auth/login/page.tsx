import Login from '@/components/Login';
import PersonalSign from '@/components/PersonalSign';

const LoginPage = () => {
  return (
    <div className="flex min-h-[calc(100vh-100px)] flex-col text-center gap-5">
      <Login />
      <PersonalSign />
    </div>
  );
};
export default LoginPage;

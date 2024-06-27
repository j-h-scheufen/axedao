'use client';

import { RegistrationFormType, registrationFormSchema } from '@/constants/schemas';
import {
  useAuthActions,
  useIsAuthenticated,
  useIsAuthenticating,
  useIsRegistering,
  useRegistrationError,
  useSilk,
} from '@/store/auth.store';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Spinner } from '@nextui-org/react';
import { SubmitHandler, useForm } from 'react-hook-form';

const RegistrationForm = () => {
  const silk = useSilk();
  const authActions = useAuthActions();
  const isRegistering = useIsRegistering();
  const registrationError = useRegistrationError();
  const isAuthenticating = useIsAuthenticating();
  const isAuthenticated = useIsAuthenticated();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<RegistrationFormType>({
    resolver: yupResolver(registrationFormSchema),
    defaultValues: {
      email: '',
    },
  });

  const emailErrorMessage = errors.email?.message;
  const nameErrorMessage = errors.name?.message;

  return (
    <form
      className="m-auto flex h-fit w-full max-w-sm flex-col gap-3"
      onSubmit={handleSubmit(authActions.register as SubmitHandler<RegistrationFormType>)}
    >
      <Input
        {...register('name')}
        label="Full name"
        className="w-full"
        classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
        color={nameErrorMessage ? 'danger' : undefined}
        isInvalid={!!nameErrorMessage}
        errorMessage={nameErrorMessage}
      />
      <Input
        {...register('email')}
        label="Email"
        type="email"
        className="w-full"
        classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
        color={emailErrorMessage ? 'danger' : undefined}
        isInvalid={!!emailErrorMessage}
        errorMessage={emailErrorMessage}
      />
      {registrationError && <div className="my-2 text-center text-small text-danger">{registrationError}</div>}
      <Button
        key="register-button"
        type="submit"
        className="mt-5 w-full"
        isLoading={isRegistering || isAuthenticating}
        spinner={<Spinner size="sm" />}
        disabled={!silk || isAuthenticated}
      >
        Register
      </Button>
    </form>
  );
};

// const RegistrationForm = () => {
//   const [step, setStep] = useState<0 | 1>(0);
//   const router = useRouter();

//   return (
//     <div className="mx-auto w-full max-w-lg">
//       {step === 0 && <PersonalInfo next={() => (step ? router.push('/dashboard/profile') : setStep(1))} />}
//       {step === 1 && (
//         <JoinGroup
//           secondaryButton={
//             <Button variant="light" onPress={() => setStep(0)} isIconOnly>
//               <ArrowLeft className="h-5 w-5 text-default-500" />
//             </Button>
//           }
//           // onSubmit={() => router.push('/dashboard/profile')}
//         />
//       )}
//       <div className="mt-5 flex justify-center gap-2">
//         {[...Array(2)].map((_, i) => {
//           const active = i === step;
//           return (
//             <span
//               key={i}
//               className={clsx('inline-block h-4 w-4 cursor-pointer rounded-full bg-default-200 hover:bg-default-500', {
//                 'bg-default-500': active,
//               })}
//               onClick={() => setStep(i as 0 | 1)}
//             ></span>
//           );
//         })}
//       </div>
//     </div>
//   );
// };

// const PersonalInfo = ({ next }: { next: () => null | void }) => {
//   return (
//     <div className="flex flex-col gap-5">
//       <h2 className="font-semibold">Create your profile</h2>
//       <Input label="Full name" placeholder="Enter your full name" />
//       <Input label="Nickname" placeholder="Enter your nick name" />
//       <Input label="Email" type="email" placeholder="Enter your email" />
//       <div className="mt-5 flex justify-between gap-3">
//         <Button className="ml-auto flex-1" onPress={next}>
//           Create profile
//         </Button>
//       </div>
//     </div>
//   );
// };

export default RegistrationForm;

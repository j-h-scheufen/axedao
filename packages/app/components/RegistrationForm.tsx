'use client';

import { useMutation } from '@tanstack/react-query';
import { useForm, SubmitHandler } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { RegistrationFormType, registrationFormSchema } from '@/constants/schemas';
import { Link, Spinner } from '@nextui-org/react';
import useSilk from '@/hooks/useSilk';

const RegistrationForm = () => {
  const silk = useSilk();

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

  const submit = async (data: RegistrationFormType) => {
    console.log(data);
    // await axios.post('/register/api', data);
    silk.login();
  };

  const registrationMutation = useMutation({
    mutationKey: ['register'],
    mutationFn: submit,
    onSuccess: () => {
      // router.push('/register/confirm');
    },
  });

  const isInvalid = !!errors.email?.message;

  return (
    <form
      className="m-auto h-fit w-full max-w-sm"
      onSubmit={handleSubmit(registrationMutation.mutate as SubmitHandler<RegistrationFormType>)}
    >
      <Input
        {...register('email')}
        label="Email"
        type="email"
        placeholder="Enter your email"
        className="w-full"
        classNames={{ inputWrapper: '!min-h-14', errorMessage: 'text-left' }}
        color={isInvalid ? 'danger' : undefined}
        isInvalid={isInvalid}
        errorMessage={errors.email?.message}
      />
      <Button
        type="submit"
        className="mt-5 w-full"
        isLoading={registrationMutation.isPending || !silk.isInitialized}
        spinner={<Spinner size="sm" />}
        // onPress={next}
      >
        Register
      </Button>
      <div className="mt-3 flex items-center justify-center gap-2 text-sm">
        <span>Already registered?</span>
        <Link href="/sign-in" className="text-sm font-medium">
          Sign in
        </Link>
      </div>
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

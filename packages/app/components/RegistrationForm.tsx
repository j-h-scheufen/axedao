'use client';

import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { ArrowLeft } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { useState } from 'react';
import JoinGroup from './JoinGroup';
import clsx from 'clsx';

const groups = [...Array(10)].map((_, i) => ({
  name: `Group ${i + 1}`,
  id: i,
}));

type Props = {};
const RegistrationForm = (props: Props) => {
  const [step, setStep] = useState<0 | 1>(0);
  const router = useRouter();

  return (
    <div className="mx-auto w-full max-w-lg">
      {step === 0 && <PersonalInfo next={() => (step ? router.push('/dashboard/profile') : setStep(1))} />}
      {step === 1 && (
        <JoinGroup
          secondaryButton={
            <Button variant="light" onPress={() => setStep(0)} isIconOnly>
              <ArrowLeft className="h-5 w-5 text-default-500" />
            </Button>
          }
          onSubmit={() => router.push('/dashboard/profile')}
        />
      )}
      <div className="mt-5 flex justify-center gap-2">
        {[...Array(2)].map((_, i) => {
          const active = i === step;
          return (
            <span
              key={i}
              className={clsx('inline-block h-4 w-4 cursor-pointer rounded-full bg-default-200 hover:bg-default-500', {
                'bg-default-500': active,
              })}
              onClick={() => setStep(i as 0 | 1)}
            ></span>
          );
        })}
      </div>
    </div>
  );
};

const PersonalInfo = ({ next }: { next: () => null | void }) => {
  return (
    <div className="flex flex-col gap-5">
      <h2 className="font-semibold">Create your profile</h2>
      <Input label="Full name" placeholder="Enter your full name" />
      <Input label="Nickname" placeholder="Enter your nick name" />
      <Input label="Email" type="email" placeholder="Enter your email" />
      <div className="mt-5 flex justify-between gap-3">
        <Button className="ml-auto flex-1" onPress={next}>
          Create profile
        </Button>
      </div>
    </div>
  );
};

export default RegistrationForm;

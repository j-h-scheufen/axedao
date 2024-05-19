'use client';

import { useMutation } from '@tanstack/react-query';
import { useForm, SubmitHandler } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { useRouter } from 'next/navigation';
import axios from 'axios';
import { ConfirmationFormType, confirmationFormSchema } from '@/constants/schemas';
import { Spinner } from '@nextui-org/react';

const ConfirmationForm = () => {
  const router = useRouter();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<ConfirmationFormType>({
    resolver: yupResolver(confirmationFormSchema),
    defaultValues: { otp: '' },
  });

  const submit = async (data: ConfirmationFormType) => {
    await axios.post('/register/confirm/api', data);
  };

  const confirmationMutation = useMutation({
    mutationKey: ['register'],
    mutationFn: submit,
    onSuccess: () => {
      router.push('/dashboard/profile/create');
    },
  });
  const isInvalid = !!errors.otp?.message;
  return (
    <form
      className="m-auto h-fit w-full max-w-sm"
      onSubmit={handleSubmit(confirmationMutation.mutate as SubmitHandler<ConfirmationFormType>)}
    >
      <Input
        {...register('otp')}
        type="number"
        label="OTP"
        placeholder="Enter your OTP"
        className="w-full"
        classNames={{ inputWrapper: 'min-h-14', errorMessage: 'text-left' }}
        color={isInvalid ? 'danger' : undefined}
        isInvalid={isInvalid}
        errorMessage={errors.otp?.message}
      />
      <div className="mt-3 flex w-full justify-end">
        <Button type="button" variant="flat" size="sm" color="secondary">
          Resend OTP
        </Button>
      </div>
      <Button
        type="submit"
        className="mt-5 w-full"
        isLoading={confirmationMutation.isPending}
        spinner={<Spinner size="sm" />}
        // onPress={next}
      >
        Confirm
      </Button>
    </form>
  );
};

export default ConfirmationForm;

import { ReactNode } from 'react';
import { Autocomplete, AutocompleteItem } from '@nextui-org/autocomplete';
import { Button } from '@nextui-org/button';
import { Circle, MapPin, Search } from 'lucide-react';
import { useForm, Controller } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { JoinGroupFormType, joinGroupFormSchema } from '@/constants/schemas';
import { useMutation } from '@tanstack/react-query';
import axios from 'axios';
import { Spinner } from '@nextui-org/react';

const groups = [...Array(10)].map((_, i) => ({
  name: `Group ${i + 1}`,
  id: i,
}));

type Props = { secondaryButton?: ReactNode; onSubmit?: () => void | null };
const JoinGroupForm = ({ secondaryButton, onSubmit }: Props) => {
  const { control, handleSubmit } = useForm({
    resolver: yupResolver(joinGroupFormSchema),
  });

  const { mutate, isPending } = useMutation({
    mutationKey: ['join-group' /*{ userId }*/],
    mutationFn: async (gropuData: JoinGroupFormType) => {
      const { data } = await axios.patch('/dashboard/profile/api/group-association', gropuData);
      return data;
    },
    onSuccess: (data) => {
      onSubmit && onSubmit();
      if (!data?.id) return;
      // optimistically update profile
    },
  });

  const submit = (data: JoinGroupFormType) => mutate(data);

  return (
    <form className="mb-3" onSubmit={handleSubmit(submit)}>
      <Controller
        control={control}
        name="id"
        render={({ field: { value, onChange, onBlur, ref }, fieldState: { error } }) => {
          const isInvalid = !!error;
          return (
            <Autocomplete
              ref={ref}
              label="Join a group"
              placeholder="Search groups by name"
              startContent={<Search className="h-4 w-4" strokeWidth={1.4} />}
              value={value}
              onSelectionChange={onChange}
              onBlur={onBlur}
              errorMessage={error?.message}
              isInvalid={isInvalid}
              color={isInvalid ? 'danger' : undefined}
            >
              {groups.map(({ name, id }) => (
                <AutocompleteItem key={id} value={id} textValue={name}>
                  <div className="mb-1">{name}</div>
                  <div className="flex items-center gap-2 text-xs text-neutral-400">
                    <span className="flex items-center gap-1">
                      <MapPin className="h-3 w-3" />
                      SP, São Paulo
                    </span>
                    <Circle className="relative top-[2px] h-[5px] w-[5px] fill-neutral-500 stroke-none" />
                    <span>75 members</span>
                    <Circle className="relative top-[2px] h-[5px] w-[5px] fill-neutral-500 stroke-none" />
                    <span>Founded by John Doe</span>
                  </div>
                </AutocompleteItem>
              ))}
            </Autocomplete>
          );
        }}
      />
      <div className="mt-5 flex justify-between gap-3">
        {secondaryButton && secondaryButton}
        <Button type="submit" className="w-full flex-1" isLoading={isPending} spinner={<Spinner size="sm" />}>
          Submit
        </Button>
      </div>
    </form>
  );
};

export default JoinGroupForm;

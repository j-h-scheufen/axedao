'use client';
import { useProfile } from '@/app/dashboard/profile/store';
import { GroupFormType } from '@/constants/schemas';
import { SiX } from '@icons-pack/react-simple-icons';
import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { Facebook, Instagram, LinkIcon, LinkedinIcon, Mail, PlusIcon, XIcon } from 'lucide-react';
import { useCallback } from 'react';
import { Control, Controller, UseFormSetValue, UseFormWatch, useFieldArray } from 'react-hook-form';

const linkBaseUrls = [
  {
    type: 'twitter',
    baseUrls: ['twitter.com', 'twitter.co', 'x.com', 'twitterinc.com'],
  },
  {
    type: 'facebook',
    baseUrls: ['facebook.com', 'facebook.co', 'facebook.net', 'fb.com', 'fb.me'],
  },
  {
    type: 'instagram',
    baseUrls: ['instagram.com', 'ig.me'],
  },
  {
    type: 'linkedin',
    baseUrls: ['linkedin.com', 'linkedin.cn'],
  },
];

type Props = {
  control: Control<GroupFormType>;
  setValue: UseFormSetValue<GroupFormType>;
  watch: UseFormWatch<GroupFormType>;
};
const LinkInputs = ({ control, setValue, watch }: Props) => {
  const { id: userId } = useProfile();
  const { fields, append, remove } = useFieldArray({ control, name: 'links' });

  const getLinkIcon = useCallback(
    (index: number) => {
      const type = watch(`links.${index}.type`);
      switch (type) {
        case 'facebook':
          return <Facebook className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
        case 'instagram':
          return <Instagram className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
        case 'linkedin':
          return <LinkedinIcon className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
        case 'twitter':
          return <SiX className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
        default:
          return <LinkIcon className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />;
      }
    },
    [watch],
  );

  const getLinkType = useCallback((url: string) => {
    const baseUrl = url.replace('https://', '').replace('http://', '').replace('www.', '').split('/')[0];
    let type = null;
    for (let i = 0; i < linkBaseUrls.length; i++) {
      const { type: linkType, baseUrls } = linkBaseUrls[i];
      let match = false;
      for (let j = 0; j < baseUrls.length; j++) {
        const url = baseUrls[j];
        if (url === baseUrl) {
          match = true;
          type = linkType;
          break;
        }
      }
      if (match) break;
    }
    return type;
  }, []);

  return (
    <div>
      <div className="grid h-fit w-full grid-cols-1 gap-x-3 gap-y-3 text-small text-default-500 sm:grid-cols-2">
        <Controller
          control={control}
          name="email"
          render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
            const errorMessage = error?.message;
            return (
              <Input
                ref={ref}
                type="email"
                size="sm"
                placeholder="you@example.com"
                value={value || ''}
                onBlur={onBlur}
                onChange={onChange}
                classNames={{ inputWrapper: 'h-10' }}
                errorMessage={errorMessage}
                isInvalid={!!errorMessage}
                color={!!errorMessage ? 'danger' : undefined}
                startContent={<Mail className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
                disabled
              />
            );
          }}
        />
        {fields.map((field, index) => {
          return (
            <Controller
              key={field.id}
              control={control}
              name={`links.${index}.url`}
              render={({ field: { onChange, value, onBlur, ref }, fieldState: { error } }) => {
                const errorMessage = error?.message;
                return (
                  <Input
                    ref={ref}
                    size="sm"
                    value={value || ''}
                    onBlur={onBlur}
                    onChange={(e) => {
                      const linkType = getLinkType(e.target.value);
                      if (linkType !== watch(`links.${index}.type` as const)) setValue(`links.${index}.type`, linkType);
                      onChange(e);
                    }}
                    classNames={{ inputWrapper: 'h-10' }}
                    errorMessage={errorMessage}
                    isInvalid={!!errorMessage}
                    color={!!errorMessage ? 'danger' : undefined}
                    startContent={getLinkIcon(index)}
                    endContent={
                      <Button
                        size="sm"
                        variant="light"
                        className="mt-0.5 !px-1 text-default-500"
                        onPress={() => remove(index)}
                        isIconOnly
                      >
                        <XIcon size={16} strokeWidth={1} />
                      </Button>
                    }
                  />
                );
              }}
            />
          );
        })}
      </div>
      <div className="mt-3 flex justify-end gap-3">
        <Button
          variant="bordered"
          size="sm"
          className="ml-auto w-fit"
          onPress={() => append({ url: '', ownerId: userId, type: null })}
        >
          <PlusIcon className="h-4 w-4" strokeWidth={1.25} /> Add link
        </Button>
      </div>
    </div>
  );
};
export default LinkInputs;

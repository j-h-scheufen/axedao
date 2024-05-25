import { Input } from '@nextui-org/input';
import { Facebook, Instagram, Mail, Phone, Twitter } from 'lucide-react';
import { ReactNode } from 'react';
import { FieldErrors, UseFormRegister } from 'react-hook-form';

type ContactInfoFieldKeyType =
  | 'email'
  | 'phone'
  | 'links'
  | 'links.website'
  | 'links.instagram'
  | 'links.twitter'
  | 'links.facebook';

export type ContactInfoField = {
  email: string;
  phone: string;
  links: {
    website?: string | undefined;
    instagram?: string | undefined;
    facebook?: string | undefined;
    twitter?: string | undefined;
  };
};

const links: {
  linkType: 'website' | 'instagram' | 'twitter' | 'facebook';
  startContent: ReactNode;
  label: string;
  placeholder: string;
}[] = [
  {
    linkType: 'website',
    startContent: (
      <div className="pointer-events-none flex items-center">
        <span className="text-small text-default-400">https://</span>
      </div>
    ),
    label: 'Website',
    placeholder: 'personalwebsite.com',
  },
  {
    linkType: 'instagram',
    startContent: <Instagram className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />,
    label: 'Instagram',
    placeholder: 'Instagram username',
  },
  {
    linkType: 'facebook',
    startContent: <Facebook className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />,
    label: 'Facebook',
    placeholder: 'Facebook username',
  },
  {
    linkType: 'twitter',
    startContent: <Twitter className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />,
    label: 'Twitter',
    placeholder: 'Twitter username',
  },
];

type Props = {
  register: UseFormRegister<ContactInfoField & { [key: string]: unknown }>;
  errors: FieldErrors<ContactInfoField & { [key: string]: unknown }>;
};
const ContactInfoInputs = ({ register, errors }: Props) => {
  return (
    <div className="grid h-fit w-full grid-cols-1 gap-x-3 gap-y-3 text-small text-default-500 sm:grid-cols-2">
      <Input
        {...register('email')}
        size="sm"
        classNames={{ inputWrapper: 'h-10' }}
        isInvalid={!!errors?.email}
        color={errors?.email ? 'danger' : undefined}
        type="email"
        placeholder="you@example.com"
        startContent={<Mail className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
        errorMessage={errors?.email?.message}
      />
      <Input
        {...register('phone')}
        size="sm"
        classNames={{ inputWrapper: 'h-10' }}
        isInvalid={!!errors?.phone}
        color={errors?.phone ? 'danger' : undefined}
        type="phone"
        placeholder="+XXXX XXX XXXX"
        startContent={<Phone className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
        errorMessage={errors?.phone?.message}
      />
      {links.map(({ linkType, startContent, placeholder }) => {
        const name = `links.${linkType}` as ContactInfoFieldKeyType;
        const isInvalid = errors?.links ? !!errors.links[linkType] : false;
        return (
          <Input
            key={linkType}
            {...register(name)}
            size="sm"
            classNames={{ inputWrapper: 'h-10' }}
            isInvalid={isInvalid}
            color={isInvalid ? 'danger' : undefined}
            type="url"
            placeholder={placeholder}
            startContent={startContent}
            errorMessage={errors?.links && errors.links[linkType]?.message}
          />
        );
      })}
    </div>
  );
};
export default ContactInfoInputs;

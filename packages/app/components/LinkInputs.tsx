import { Input } from '@nextui-org/input';
import { Facebook, Instagram, Twitter } from 'lucide-react';
import { ReactNode } from 'react';
import { FieldErrors, UseFormRegister } from 'react-hook-form';

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
    placeholder: 'profile url',
  },
  {
    linkType: 'facebook',
    startContent: <Facebook className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />,
    label: 'Facebook',
    placeholder: 'profile url',
  },
  {
    linkType: 'twitter',
    startContent: <Twitter className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />,
    label: 'Instagram',
    placeholder: 'profile url',
  },
];

type LinksType = { links: { website: string; instagram: string; facebook: string; twitter: string } };
type Props = {
  register: UseFormRegister<LinksType>;
  errors: FieldErrors<LinksType>;
};
const LinkInputs = ({ register, errors }: Props) => {
  return (
    <div className="grid h-fit w-full grid-cols-1 gap-x-4 gap-y-2 text-small text-default-500 sm:grid-cols-2">
      {links.map(({ linkType, startContent, label, placeholder }) => {
        const name = `links.${linkType}` as any;
        const isInvalid = errors?.links ? !!(errors as any).links[linkType] : false;
        return (
          <Input
            key={linkType}
            {...register(name)}
            isInvalid={isInvalid}
            color={isInvalid ? 'danger' : undefined}
            type="url"
            label={label}
            placeholder={placeholder}
            labelPlacement="outside"
            startContent={startContent}
            errorMessage={errors?.links && (errors.links as any)[linkType].message}
          />
        );
      })}
    </div>
  );
};
export default LinkInputs;

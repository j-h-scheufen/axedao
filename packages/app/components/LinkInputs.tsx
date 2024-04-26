import { Input } from '@nextui-org/input';
import { Facebook, Globe, Instagram, Mail, Phone, Twitter } from 'lucide-react';

type Props = {};
const LinkInputs = (props: Props) => {
  return (
    <div className="grid h-fit w-full max-w-lg grid-cols-2 gap-x-4 gap-y-2 text-small text-default-500">
      <Input
        type="url"
        label="Website"
        placeholder="nextui.org"
        labelPlacement="outside"
        startContent={
          <div className="pointer-events-none flex items-center">
            <span className="text-small text-default-400">https://</span>
          </div>
        }
      />
      <Input
        type="email"
        label="Email"
        placeholder="you@example.com"
        labelPlacement="outside"
        startContent={<Mail className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
      />
      <Input
        label="Phone number"
        placeholder="+XXX XXX XXX"
        labelPlacement="outside"
        startContent={<Phone className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
      />
      <Input
        label="Instagram"
        placeholder="profile url"
        labelPlacement="outside"
        startContent={<Instagram className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
      />
      <Input
        label="Facebook"
        placeholder="profile url"
        labelPlacement="outside"
        startContent={<Facebook className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
      />
      <Input
        label="Twitter"
        placeholder="profile url"
        labelPlacement="outside"
        startContent={<Twitter className="pointer-events-none h-4 w-4 flex-shrink-0 text-default-400" />}
      />
    </div>
  );
};
export default LinkInputs;

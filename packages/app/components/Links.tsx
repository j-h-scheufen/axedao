import { Facebook, Globe, Instagram, Mail, Phone, Twitter } from 'lucide-react';

type Props = {};
const Links = (props: Props) => {
  return (
    <div className="grid h-fit w-fit grid-cols-2 gap-x-4 gap-y-2 text-small text-default-500">
      <div className="flex items-center gap-1">
        <Globe className="h-4 w-4" strokeWidth={1.4} /> www.johndoe.com
      </div>
      <div className="flex items-center gap-1">
        <Mail className="h-4 w-4" strokeWidth={1.4} /> example@example.com
      </div>
      <div className="flex items-center gap-1">
        <Phone className="h-4 w-4" strokeWidth={1.4} /> +XXX XXX XXX
      </div>
      <div className="flex items-center gap-1">
        <Instagram className="h-4 w-4" strokeWidth={1.4} /> RealJohnDoe
      </div>
      <div className="flex items-center gap-1">
        <Facebook className="h-4 w-4" strokeWidth={1.4} /> JohnDoeOfficial
      </div>
      <div className="flex items-center gap-1">
        <Twitter className="h-4 w-4" strokeWidth={1.4} /> TheRealJohnDoe
      </div>
    </div>
  );
};
export default Links;

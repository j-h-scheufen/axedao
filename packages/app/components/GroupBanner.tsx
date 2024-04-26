'use client';
import { Button } from '@nextui-org/button';
import { Link } from '@nextui-org/link';
import { Mail, Phone, Edit } from 'lucide-react';

type Props = { banner?: string; email?: string; phone?: string };
const GroupBanner = ({ banner = '', email, phone }: Props) => {
  return (
    <div className="relative bottom-5 h-[200px] w-full rounded-xl bg-gradient-to-t from-neutral-900">
      <Button
        startContent={<Edit className="h-4 w-4" />}
        size="sm"
        variant="bordered"
        className="absolute right-5 top-5"
      >
        Edit group
      </Button>
    </div>
  );
};
export default GroupBanner;

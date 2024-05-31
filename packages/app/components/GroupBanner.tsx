'use client';
import { usePathname } from 'next/navigation';
import Image from 'next/image';
import { Button } from '@nextui-org/button';
import { Edit } from 'lucide-react';
import Link from 'next/link';

type Props = { banner: string | null };
const GroupBanner = ({ banner }: Props) => {
  const pathname = usePathname();

  return (
    <div className="relative bottom-5 h-[200px] w-full rounded-xl bg-gradient-to-t from-neutral-900">
      {banner && <Image src={banner} objectFit="cover" className="h-full w-full" alt="Group banner" />}
      <Button
        href={`${pathname}/edit`}
        as={Link}
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

'use client';

import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { Button } from '@nextui-org/button';
import clsx from 'clsx';
import { ArrowLeft } from 'lucide-react';

interface Props extends React.HTMLAttributes<HTMLHeadingElement> {
  children: React.ReactNode;
  back?: string | boolean;
}
const PageHeading = ({ children, className = '', back, ...props }: Props) => {
  const router = useRouter();

  let backButton = null;
  if (typeof back === 'string') {
    backButton = (
      <Link href={back} replace>
        <Button variant="light" isIconOnly>
          <ArrowLeft className="h-5 w-5" />
        </Button>
      </Link>
    );
  } else if (back === true && typeof window !== 'undefined' && window?.history && window.history.length > 1) {
    backButton = (
      <Button variant="light" isIconOnly onPress={() => router.back()} className="p-0">
        <ArrowLeft className="h-5 w-5" />
      </Button>
    );
  }
  return (
    <div className="relative z-[1] mb-10 flex items-center gap-3">
      {backButton}
      <h1 className={clsx('text-2xl font-bold', className)} {...props}>
        {children}
      </h1>
    </div>
  );
};
export default PageHeading;

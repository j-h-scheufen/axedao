'use client';

import { Button } from '@nextui-org/button';
import clsx from 'clsx';
import { useAtomValue } from 'jotai';
import { ArrowLeft } from 'lucide-react';
import { useRouter } from 'next/navigation';

import { backUrlFromBreadcrumbsAtom } from '@/hooks/state/app';

interface Props extends React.HTMLAttributes<HTMLHeadingElement> {
  children: React.ReactNode;
  backUrl?: string | boolean;
}

const PageHeading = ({ children, className = '', backUrl, ...props }: Props) => {
  const router = useRouter();
  const backUrlFromBreadcrumbs = useAtomValue(backUrlFromBreadcrumbsAtom);

  return (
    <div className="relative z-[1] mb-3 flex items-center gap-3">
      {(backUrl || backUrlFromBreadcrumbs) && (
        <Button
          variant="light"
          onPress={() => {
            if (backUrl && typeof backUrl === 'string') {
              router.push(backUrl);
            } else if (backUrlFromBreadcrumbs) {
              router.push(backUrlFromBreadcrumbs);
            } else {
              router.back();
            }
          }}
          className="!min-w-[unset] !px-0"
          isIconOnly
        >
          <ArrowLeft className="h-5 w-5" />
        </Button>
      )}
      <h1 className={clsx('text-2xl font-bold', className)} {...props}>
        {children}
      </h1>
    </div>
  );
};

export default PageHeading;

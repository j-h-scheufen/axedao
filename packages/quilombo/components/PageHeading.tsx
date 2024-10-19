'use client';

import { Button } from '@nextui-org/button';
import clsx from 'clsx';
import { atom, useAtom, useAtomValue } from 'jotai';
import { ArrowLeft } from 'lucide-react';
import { useRouter } from 'next/navigation';
import { useEffect } from 'react';

import { breadcrumbsHistoryAtom } from '@/hooks/state/app';

const backCrumbAtom = atom<string | undefined>(undefined);
interface Props extends React.HTMLAttributes<HTMLHeadingElement> {
  children: React.ReactNode;
  back?: string | boolean;
}
const PageHeading = ({ children, className = '', back, ...props }: Props) => {
  const router = useRouter();
  const [backCrumb, setBackCrumb] = useAtom(backCrumbAtom);
  const crumbs = useAtomValue(breadcrumbsHistoryAtom);

  useEffect(() => {
    // The current page is the last crumb, the second to last is the target for the back button
    const newTarget = crumbs.length > 1 ? crumbs[crumbs.length - 2] : undefined;
    if (newTarget !== backCrumb) {
      setBackCrumb(newTarget);
    }
  }, [backCrumb, crumbs, setBackCrumb]);

  return (
    <div className="relative z-[1] mb-3 flex items-center gap-3">
      {(back || backCrumb) && (
        <Button
          variant="light"
          onPress={() => {
            if (back && typeof back === 'string') {
              router.push(back);
            } else if (backCrumb) {
              router.push(backCrumb);
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

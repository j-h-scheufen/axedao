import Link from 'next/link';
import { Button } from '@nextui-org/button';
import clsx from 'clsx';
import { ArrowLeft } from 'lucide-react';

interface Props extends React.HTMLAttributes<HTMLHeadingElement> {
  children: React.ReactNode;
  back?: string;
}
const PageHeading = ({ children, className = '', back, ...props }: Props) => {
  return (
    <div className="relative z-[1] mb-10 flex items-center gap-3">
      {back && (
        <Link href={back}>
          <Button variant="light" isIconOnly>
            <ArrowLeft className="h-5 w-5" />
          </Button>
        </Link>
      )}
      <h1 className={clsx('text-2xl font-bold', className)} {...props}>
        {children}
      </h1>
    </div>
  );
};
export default PageHeading;

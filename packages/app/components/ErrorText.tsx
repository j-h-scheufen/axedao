import clsx from 'clsx';
import { CircleAlertIcon } from 'lucide-react';
import { HTMLAttributes, ReactNode } from 'react';

type Props = HTMLAttributes<HTMLDivElement> & { message: ReactNode };
const ErrorText = ({ message, className = '', ...props }: Props) => {
  if (!message) return null;
  return (
    <div className={clsx('flex items-center gap-3 my-3 text-danger text-small', className)} {...props}>
      <CircleAlertIcon className="h-5 w-5" />
      {message}
    </div>
  );
};
export default ErrorText;

import { cn } from '@/utils/tailwind';

interface Props extends React.HTMLAttributes<HTMLHeadingElement> {
  children: React.ReactNode;
}
const SubsectionHeading = ({ children, className = '', ...props }: Props) => {
  return (
    <h3 className={cn('mb-2 mt-3 text-lg font-semibold', className)} {...props}>
      {children}
    </h3>
  );
};
export default SubsectionHeading;

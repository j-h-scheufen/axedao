import clsx from 'clsx';

interface Props extends React.HTMLAttributes<HTMLHeadingElement> {
  children: React.ReactNode;
  back?: boolean | string;
}
const SubsectionHeading = ({ children, className = '', back = false, ...props }: Props) => {
  return (
    <h3 className={clsx('mb-3 mt-5 text-lg font-semibold', className)} {...props}>
      {children}
    </h3>
  );
};
export default SubsectionHeading;

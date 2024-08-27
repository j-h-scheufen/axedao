import clsx from 'clsx';

interface Props extends React.HTMLAttributes<HTMLHeadingElement> {
  children: React.ReactNode;
}
const SectionHeading = ({ children, className = '', ...props }: Props) => {
  return (
    <h2 className={clsx('mb-5 mt-8 text-xl font-semibold', className)} {...props}>
      {children}
    </h2>
  );
};
export default SectionHeading;

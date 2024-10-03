import { PropsWithChildren } from 'react';

type BaseSectionProps = PropsWithChildren & {
  title: string;
};

const BaseSection = ({ title, children }: BaseSectionProps) => {
  return (
    <section className="flex flex-col gap-3 px-2 sm:gap-5 sm:px-3">
      <h2 className="text-center text-4xl sm:text-5xl">{title}</h2>
      {children}
    </section>
  );
};

export default BaseSection;

import { ReactNode } from 'react';

type Props = { children: ReactNode };
const layout = ({ children }: Props) => {
  return <main className="container mx-auto flex max-w-7xl flex-grow flex-col px-6">{children}</main>;
};
export default layout;

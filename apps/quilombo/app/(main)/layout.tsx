import { PropsWithChildren } from 'react';

/**
 * This layout provides a full-width frame with padding. It is the first layout to be nested inside the root layout
 * to control margins and padding for the majority of the app's pages. Any pages requiring the full width or height
 * of the screen should be placed outside of this layout.
 */
const MainLayout = ({ children }: PropsWithChildren) => {
  return <main className="container flex-grow w-full px-3">{children}</main>;
};
export default MainLayout;

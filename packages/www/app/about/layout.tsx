import { PageLayout } from '@/components/primitives';

export default function AboutLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return <PageLayout>{children}</PageLayout>;
}

import type { Metadata } from 'next';
import { Divider } from '@nextui-org/divider';
import { Link } from '@nextui-org/link';

import {
  SupportedLanguage,
  fallbackLng,
  isSupportedLanguage,
} from '../i18n/settings';
import { NextPageProps } from './layout';
import { siteConfig } from '@/config/site';
import Heading from '@/sections/Heading';
import HomeSection from '@/components/home/HomeSection';
import ImageSection from '@/components/home/ImageSection';
import GoalsTable from '@/components/home/Goals';

export const metadata: Metadata = {
  title: 'Axé DAO Homepage',
};

export default async function Home({ params: { locale } }: NextPageProps) {
  const lang = isSupportedLanguage(locale)
    ? (locale as SupportedLanguage)
    : fallbackLng;

  return (
    <div className="relative flex flex-col items-center justify-center p-2 text-xl sm:p-6 md:p-8">
      <main className="my-2 flex w-full flex-col gap-5 sm:gap-7 md:my-3">
        <Heading locale={lang} />
        <Divider />

        <ImageSection
          src="/images/pandeiro-agogo-lawn.jpg"
          alt="Pandeiro and Agogo"
        />
        <Divider />
        <HomeSection contentKey="about" numParagraphs={4} locale={lang} />
        <Divider />
        <ImageSection
          src="/images/capoeira-painting.jpg"
          alt="Capoeira Painting"
        />
        <Divider />
        <HomeSection contentKey="dao" numParagraphs={1} locale={lang} />
        <Divider />
        <ImageSection src="/images/Berimbaus-Street.jpg" alt="Berimbaus" />
        <Divider />
        <GoalsTable locale={lang} />
        <div className="flex w-full flex-col items-center p-4 text-center">
          <div className="text-base">
            To get involved or join Axé DAO, please send us an{' '}
            <Link href={`mailto:${siteConfig.links.email}`}>email</Link> or join
            our <Link href={siteConfig.links.discord}>group chat</Link> on
            Discord.
          </div>
        </div>
      </main>
    </div>
  );
}

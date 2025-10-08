'use client';

import { Divider, Link } from '@heroui/react';

import type { SupportedLanguage } from '@/app/i18n/settings';
import Heading from '@/sections/Heading';
import ImageSection from './ImageSection';
import HomeSection from './HomeSection';
import GoalsTable from './Goals';
import { siteConfig } from '@/config/site';

export default function Home({ locale }: { locale: SupportedLanguage }) {
  return (
    <>
      <Heading locale={locale} />
      <Divider />

      <ImageSection src="/images/pandeiro-agogo-lawn.jpg" alt="Pandeiro and Agogo" />
      <Divider />
      <HomeSection contentKey="about" numParagraphs={4} locale={locale} />
      <Divider />
      <ImageSection src="/images/capoeira-painting.jpg" alt="Capoeira Painting" />
      <Divider />
      <HomeSection contentKey="dao" numParagraphs={1} locale={locale} />
      <Divider />
      <ImageSection src="/images/Berimbaus-Street.jpg" alt="Berimbaus" />
      <Divider />
      <GoalsTable locale={locale} />
      <div className="flex w-full flex-col items-center p-4 text-center">
        <div className="text-base">
          To get involved or join Axé DAO, please send us an{' '}
          <Link href={`mailto:${siteConfig.links.email}`}>email</Link> or join our{' '}
          <Link href={siteConfig.links.common_ground}>group chat</Link> on Common Ground.
        </div>
      </div>
    </>
  );
}

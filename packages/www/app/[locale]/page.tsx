import Head from 'next/head';
import { Image, Link } from '@nextui-org/react';

import {
  SupportedLanguage,
  fallbackLng,
  isSupportedLanguage,
} from '../i18n/settings';
import { NextPageProps } from './layout';
import { siteConfig } from '@/config/site';
import Heading from '@/sections/Heading';
import HomeSection from '@/components/home';
import ListSection from '@/components/home/ListSection';

export default async function Home({ params: { locale } }: NextPageProps) {
  const lang = isSupportedLanguage(locale)
    ? (locale as SupportedLanguage)
    : fallbackLng;
  return (
    <div className="relative flex flex-col items-center justify-center gap-4 text-xl">
      <Head>
        <title>Axé DAO Homepage</title>
      </Head>
      <main className="mt-2 md:mt-3">
        <Heading locale={lang} />
        <div className="flex items-center justify-center">
          <Image
            src="/images/pandeiro-agogo-lawn.jpg"
            alt="Pandeiry and Agogo"
            className="centerrounded-none my-4 max-w-3xl md:rounded-3xl"
          />
        </div>
        <HomeSection contentKey="about" numParagraphs={2} locale={lang} />
        <div className="flex items-center justify-center">
          <Image
            src="/images/Berimbaus-Street.jpg"
            alt="Berimbaus"
            className="mb-4 mt-6 max-w-3xl rounded-none md:mx-4 md:rounded-3xl"
          />
        </div>
        <HomeSection contentKey="dao" numParagraphs={1} locale={lang} />
        <div className="flex items-center justify-center">
          <Image
            src="/images/capoeira-painting.jpg"
            alt="Pandeiry and Agogo"
            className="my-4 max-w-3xl rounded-none md:mx-4 md:rounded-3xl"
          />
        </div>
        <ListSection contentKey="goals" numParagraphs={2} locale={lang} />
        <div className="flex w-full flex-col items-center p-2">
          <div className="mt-6 text-center sm:mt-14">
            To support or join our efforts, please email us at{' '}
            <Link href={`mailto:${siteConfig.links.email}`}>
              axe-dao (at) protonmail.com
            </Link>{' '}
            or join our <Link href={siteConfig.links.discord}>discord</Link>{' '}
            server.
          </div>
        </div>
      </main>
    </div>
  );
}

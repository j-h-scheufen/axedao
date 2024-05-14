import Heading from '@/sections/Heading';
import Head from 'next/head';
import { Image, Link } from '@nextui-org/react';

import {
  SupportedLanguage,
  fallbackLng,
  isSupportedLanguage,
} from '../i18n/settings';
import { createTranslation } from '../i18n/server';
import { NextPageProps } from './layout';
import { siteConfig } from '@/config/site';

export default async function Home({ params: { locale } }: NextPageProps) {
  const lang = isSupportedLanguage(locale)
    ? (locale as SupportedLanguage)
    : fallbackLng;
  const { t } = await createTranslation(lang, 'home');
  return (
    <div className="relative flex flex-col items-center justify-center gap-4">
      <Head>
        <title>Axé DAO Homepage</title>
      </Head>
      <main className="mt-2 md:mt-3">
        <Heading locale={lang} />
        <Image
          src="/images/pandeiro-agogo-lawn.jpg"
          alt="Pandeiry and Agogo"
          className="my-4 rounded-none md:mx-4 md:rounded-3xl"
        />
        <section className="mx-2 sm:mx-3">
          <h3>{t('about.title')}</h3>
          <p>{t('about.content')}</p>
        </section>
        <Image
          src="/images/pandeiro-agogo-lawn.jpg"
          alt="Pandeiry and Agogo"
          className="my-4 rounded-none md:mx-4 md:rounded-3xl"
        />
        <section className="px-2 sm:px-3">
          <h3>{t('dao.title')}</h3>
          <p>{t('dao.content')}</p>
        </section>
        <Image
          src="/images/pandeiro-agogo-lawn.jpg"
          alt="Pandeiry and Agogo"
          className="my-4 rounded-none md:mx-4 md:rounded-3xl"
        />
        <section className="px-2 sm:px-3">
          <h3>{t('goals.title')}</h3>
          {/* <Trans t={t} i18nKey="goals.content" /> */}
        </section>
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

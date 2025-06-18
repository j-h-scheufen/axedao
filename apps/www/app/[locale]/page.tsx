import { type SupportedLanguage, fallbackLng, isSupportedLanguage } from '../i18n/settings';
import type { NextPageProps } from './layout';

import Home from '@/components/home/Home';

export default async function HomePage({ params }: NextPageProps) {
  const { locale } = await params;
  const lang = isSupportedLanguage(locale) ? (locale as SupportedLanguage) : fallbackLng;

  return (
    <div className="relative flex flex-col items-center justify-center p-2 text-xl sm:p-6 md:p-8">
      <main className="my-2 flex w-full flex-col gap-5 sm:gap-7 md:my-3">
        <Home locale={lang} />
      </main>
    </div>
  );
}

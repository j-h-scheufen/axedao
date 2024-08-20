'use client';

import { Trans } from 'react-i18next';

import { useTranslation } from '@/app/i18n/client';
import { SupportedLanguage } from '@/app/i18n/settings';

interface HomeSectionProps {
  contentKey: string;
  numParagraphs: number;
  locale: SupportedLanguage;
}

const HomeSection = ({
  contentKey,
  numParagraphs,
  locale,
}: HomeSectionProps) => {
  const { t } = useTranslation(locale, 'home');
  const paragraphs = [];
  for (let i = 1; i <= numParagraphs; i++) {
    paragraphs.push(
      <p key={`p-${contentKey}-${i}`}>
        <Trans
          t={t}
          key={`trans-${contentKey}-${i}`}
          i18nKey={`${contentKey}.content.p${i}`}
        />
      </p>
    );
  }
  return (
    <section className="flex flex-col gap-3 px-2 sm:gap-5 sm:px-3">
      <h2 className="text-center text-4xl sm:text-5xl">
        {t(`${contentKey}.title`)}
      </h2>
      <div className="flex flex-col gap-3 sm:gap-4">{paragraphs}</div>
    </section>
  );
};

export default HomeSection;

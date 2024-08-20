'use client';

import { Trans } from 'react-i18next';

import { useTranslation } from '@/app/i18n/client';
import { SupportedLanguage } from '@/app/i18n/settings';
import BaseSection from './BaseSection';

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
    <BaseSection title={t(`${contentKey}.title`)}>
      <div className="flex flex-col gap-3 sm:gap-4 sm:text-center">
        {paragraphs}
      </div>
    </BaseSection>
  );
};

export default HomeSection;

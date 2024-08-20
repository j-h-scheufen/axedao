'use client';

import { Trans } from 'react-i18next';

import { useTranslation } from '@/app/i18n/client';
import { SupportedLanguage } from '@/app/i18n/settings';

interface ListSectionProps {
  contentKey: string;
  numParagraphs: number;
  locale: SupportedLanguage;
}

const ListSection = ({
  contentKey,
  numParagraphs,
  locale,
}: ListSectionProps) => {
  const { t } = useTranslation(locale, 'home');
  const paragraphs = [];
  for (let i = 1; i <= numParagraphs; i++) {
    paragraphs.push(
      <p key={`p-${contentKey}-${i}`}>
        <Trans
          t={t}
          key={`trans-${contentKey}-${i}`}
          i18nKey={`${contentKey}.content.p${i}`}
          components={{
            ul: <ul className="ml-5 list-disc md:ml-7" />,
            li: <li className="list-item" />,
          }}
        />
      </p>
    );
  }
  return (
    <section className="flex flex-col gap-3 px-2 sm:gap-4 sm:px-3">
      <h2 className="text-center text-3xl md:text-5xl">
        {t(`${contentKey}.title`)}
      </h2>
      <div className="flex flex-col gap-6 sm:gap-8">{paragraphs}</div>
    </section>
  );
};

export default ListSection;

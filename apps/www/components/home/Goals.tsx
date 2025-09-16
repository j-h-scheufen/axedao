'use client';

import { CheckCircleIcon, ChevronRightIcon } from '@heroicons/react/24/outline';
import { Spacer } from '@heroui/react';

import { useTranslation } from '@/app/i18n/client';
import type { SupportedLanguage } from '@/app/i18n/settings';
import BaseSection from './BaseSection';

interface Props {
  locale: SupportedLanguage;
}

const GoalRow = ({ goalKey, completed, t }: { goalKey: string; completed?: boolean; t: (key: string) => string }) => (
  <div className="flex flex-row items-start gap-2">
    {completed ? (
      <CheckCircleIcon
        width={30}
        height={30}
        className="min-h-[25px] min-w-[25px] stroke-primary sm:min-h-[30px] sm:min-w-[30px]"
      />
    ) : (
      <ChevronRightIcon width={25} height={25} className="min-h-[20px] min-w-[20px] sm:min-h-[25px] sm:min-w-[25px]" />
    )}

    <span>{t(`goals.${goalKey}`)}</span>
  </div>
);

const GoalsTable = ({ locale }: Props) => {
  const { t } = useTranslation(locale, 'home');

  return (
    <BaseSection title={t('goals.title')}>
      <div className="sm:px-3">
        <p>{t('goals.intro')}</p>
        <h2 className="my-3 text-2xl sm:text-3xl">{t('goals.2024')}</h2>
        <div className="flex w-full flex-col gap-1 sm:gap-2">
          <GoalRow goalKey="24g1" t={t} completed />
          <GoalRow goalKey="24g2" t={t} completed />
          <GoalRow goalKey="24g3" t={t} completed />
        </div>
        <Spacer y={4} />
        <h2 className="my-3 text-2xl sm:text-3xl">{t('goals.2025')}</h2>
        <div className="flex w-full flex-col justify-start gap-1">
          <GoalRow goalKey="25g1" t={t} completed />
          <GoalRow goalKey="25g2" t={t} completed />
          <GoalRow goalKey="25g3" t={t} />
        </div>
        <Spacer y={4} />
        <h2 className="my-3 text-2xl sm:text-3xl">{t('goals.long-term')}</h2>
        <div className="flex w-full flex-col justify-start gap-1">
          <GoalRow goalKey="lg1" t={t} />
          <GoalRow goalKey="lg2" t={t} />
          <GoalRow goalKey="lg3" t={t} />
          <GoalRow goalKey="lg4" t={t} />
        </div>
      </div>
    </BaseSection>
  );
};

export default GoalsTable;

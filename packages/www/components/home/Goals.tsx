'use client';

import { CheckCircleIcon, ChevronRightIcon } from '@heroicons/react/24/outline';
import { Spacer } from '@nextui-org/spacer';

import { useTranslation } from '@/app/i18n/client';
import { SupportedLanguage } from '@/app/i18n/settings';
import BaseSection from './BaseSection';

interface Props {
  locale: SupportedLanguage;
}

const GoalsTable = ({ locale }: Props) => {
  const { t } = useTranslation(locale, 'home');

  const GoalRow = ({
    goalKey,
    completed,
  }: {
    goalKey: string;
    completed?: boolean;
  }) => (
    <div className="flex flex-row items-start gap-2">
      {completed ? (
        <CheckCircleIcon
          width={30}
          height={30}
          className="min-h-[25px] min-w-[25px] stroke-primary sm:min-h-[30px] sm:min-w-[30px]"
        />
      ) : (
        <ChevronRightIcon
          width={25}
          height={25}
          className="min-h-[20px] min-w-[20px] sm:min-h-[25px] sm:min-w-[25px]"
        />
      )}

      <span>{t(`goals.${goalKey}`)}</span>
    </div>
  );

  return (
    <BaseSection title={t('goals.title')}>
      <div className="sm:px-3">
        <p>{t('goals.intro')}</p>
        <h2 className="my-3 text-2xl sm:text-3xl">{t('goals.short-term')}</h2>
        <div className="flex w-full flex-col gap-1 sm:gap-2">
          <GoalRow goalKey="sg1" completed />
          <GoalRow goalKey="sg2" completed />
          <GoalRow goalKey="sg3" />
        </div>
        <Spacer y={4} />
        <h2 className="my-3 text-2xl sm:text-3xl">{t('goals.long-term')}</h2>
        <div className="flex w-full flex-col justify-start gap-1">
          <GoalRow goalKey="lg1" />
          <GoalRow goalKey="lg2" />
          <GoalRow goalKey="lg3" />
          <GoalRow goalKey="lg4" />
          <GoalRow goalKey="lg5" />
        </div>
      </div>
    </BaseSection>
  );
};

export default GoalsTable;

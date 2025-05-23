import { BadgeCheck, Crown } from 'lucide-react';

import { cn } from '@/utils/tailwind';

type MemberProps = {
  isMember: boolean;
};

type CouncilProps = {
  isCouncil: boolean;
};

const getActivatedIconClassName = (isActivated: boolean) => {
  return cn(
    'fill-transparent dark:fill-slate-400 stroke-gray-500 dark:stroke-gray-300 min-w-[25px] min-h-[25px] sm:min-h-[32px] sm:min-w-[32px]',
    {
      'fill-primary dark:fill-primary dark:stroke-slate-500': isActivated,
    }
  );
};

export const MemberBadge: React.FC<MemberProps> = ({ isMember }) => {
  return <BadgeCheck className={getActivatedIconClassName(isMember)} />;
};

export const CouncilBadge: React.FC<CouncilProps> = ({ isCouncil }) => {
  return <Crown className={getActivatedIconClassName(isCouncil)} />;
};

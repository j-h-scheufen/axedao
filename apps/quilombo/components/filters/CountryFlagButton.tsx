'use client';

import { cn } from '@heroui/react';

import { getFlagEmoji } from '@/utils';

type CountryFlagButtonProps = {
  countryCode: string;
  isSelected: boolean;
  onToggle: (countryCode: string) => void;
  size?: 'sm' | 'md'; // sm for mobile, md for desktop
};

const CountryFlagButton = ({ countryCode, isSelected, onToggle, size = 'md' }: CountryFlagButtonProps) => {
  const sizeClasses = size === 'sm' ? 'w-16 h-16' : 'w-20 h-20'; // 64px × 64px for mobile, 80px × 80px for desktop

  const flagSize = size === 'sm' ? 'text-3xl' : 'text-4xl';

  return (
    <button
      type="button"
      onClick={() => onToggle(countryCode)}
      className={cn(
        'flex flex-col items-center justify-center gap-1 rounded-lg transition-all duration-150',
        sizeClasses,
        isSelected
          ? 'bg-primary-50/20 border-2 border-primary shadow-md ring-2 ring-primary/30 scale-110 -translate-y-0.5'
          : 'bg-default-100 border border-default-200 hover:bg-default-200 hover:border-default-300 hover:shadow-sm hover:scale-105'
      )}
      aria-label={`${isSelected ? 'Deselect' : 'Select'} ${countryCode}`}
      aria-pressed={isSelected}
    >
      <span className={flagSize} role="img" aria-label={`${countryCode} flag`}>
        {getFlagEmoji(countryCode)}
      </span>
      <span className={cn('text-xs', isSelected ? 'text-primary font-semibold' : 'text-default-500')}>
        {countryCode}
      </span>
    </button>
  );
};

export default CountryFlagButton;

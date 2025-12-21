'use client';

import { Switch } from '@heroui/react';

/** Supported languages for bilingual content. */
export type Language = 'en' | 'pt';

interface LanguageSwitchProps {
  /** Current language */
  language: Language;
  /** Callback when language changes */
  onLanguageChange: (lang: Language) => void;
  /** Optional className for the container */
  className?: string;
}

/**
 * A language toggle switch for bilingual content (English/Portuguese).
 * Shows flag emojis and a switch to toggle between languages.
 */
export function LanguageSwitch({ language, onLanguageChange, className = '' }: LanguageSwitchProps) {
  return (
    <div className={`flex items-center gap-2 ${className}`}>
      <span className="text-base" title="English">
        🇬🇧
      </span>
      <Switch
        size="sm"
        isSelected={language === 'pt'}
        onValueChange={(selected) => onLanguageChange(selected ? 'pt' : 'en')}
        aria-label="Toggle language between English and Portuguese"
      />
      <span className="text-base" title="Português">
        🇧🇷
      </span>
    </div>
  );
}

export default LanguageSwitch;

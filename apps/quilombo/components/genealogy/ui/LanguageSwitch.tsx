'use client';

import { Switch } from '@heroui/react';

import type { GenealogyLanguage } from '@/components/genealogy/state';

// Re-export for backwards compatibility
export type Language = GenealogyLanguage;

interface LanguageSwitchProps {
  /** Current language */
  language: GenealogyLanguage;
  /** Callback when language changes */
  onLanguageChange: (lang: GenealogyLanguage) => void;
  /** Optional label to show before the switch */
  label?: string;
  /** Optional className for the container */
  className?: string;
}

/**
 * A language toggle switch for bilingual content (English/Portuguese).
 * Shows flag emojis and a switch to toggle between languages.
 */
export function LanguageSwitch({ language, onLanguageChange, label, className = '' }: LanguageSwitchProps) {
  return (
    <div className={`flex items-center gap-2 ${className}`}>
      {label && <span className="text-small">{label}</span>}
      <div className="flex items-center gap-2">
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
    </div>
  );
}

export default LanguageSwitch;

import { getFlagEmoji } from './index';

/**
 * Format country filter chip label.
 * Shows up to maxVisible flags/codes, with +N for remaining.
 *
 * @param countryCodes - Array of selected country codes
 * @param maxVisible - Maximum number of flags to show (default: 3)
 * @param useFlags - Use emoji flags (true) or country codes (false)
 * @returns Formatted label parts { visible, remaining }
 *
 * @example
 * formatCountryChipLabel(['BR', 'US', 'PT'])
 * // Returns { visible: ['🇧🇷', '🇺🇸', '🇵🇹'], remaining: 0 }
 *
 * formatCountryChipLabel(['BR', 'US', 'PT', 'FR', 'DE'], 3, false)
 * // Returns { visible: ['BR', 'US', 'PT'], remaining: 2 }
 */
export const formatCountryChipLabel = (
  countryCodes: string[],
  maxVisible: number = 3,
  useFlags: boolean = true
): { visible: string[]; remaining: number } => {
  const visible = countryCodes.slice(0, maxVisible);
  const remaining = Math.max(0, countryCodes.length - maxVisible);

  return {
    visible: useFlags ? visible.map(getFlagEmoji) : visible,
    remaining,
  };
};

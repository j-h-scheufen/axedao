import { useParams } from 'next/navigation';

import { type SupportedLanguage, fallbackLng, isSupportedLanguage } from '@/app/i18n/settings';

export function useLocale(): SupportedLanguage {
  const params = useParams();
  return isSupportedLanguage(params.locale as string) ? (params.locale as SupportedLanguage) : fallbackLng;
}

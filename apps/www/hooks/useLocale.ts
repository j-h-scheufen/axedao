import { useParams } from 'next/navigation';

import {
  SupportedLanguage,
  isSupportedLanguage,
  fallbackLng,
} from '@/app/i18n/settings';

export function useLocale(): SupportedLanguage {
  const params = useParams();
  return isSupportedLanguage(params.locale as string)
    ? (params.locale as SupportedLanguage)
    : fallbackLng;
}

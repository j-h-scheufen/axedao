'use client';

import { useEffect } from 'react';
import i18next, { i18n } from 'i18next';
import {
  initReactI18next,
  useTranslation as useTransAlias,
} from 'react-i18next';
import resourcesToBackend from 'i18next-resources-to-backend';
import LanguageDetector from 'i18next-browser-languagedetector';
import { type SupportedLanguage, getOptions, ALL_LOCALES } from './settings';

const runsOnServerSide = typeof window === 'undefined';

// Initialize i18next for the client side
i18next
  .use(initReactI18next)
  .use(LanguageDetector)
  .use(
    resourcesToBackend(
      (language: SupportedLanguage, namespace: string) =>
        import(`./locales/${language}/${namespace}.json`)
    )
  )
  .init({
    ...getOptions(),
    lng: undefined, // detect the language on the client
    detection: {
      order: ['path'],
    },
    preload: runsOnServerSide ? ALL_LOCALES : [],
  });

export function useTranslation(lng: SupportedLanguage, ns: string) {
  const translator = useTransAlias(ns);
  const { i18n } = translator;

  // Run when content is rendered on server side
  if (runsOnServerSide && lng && i18n.resolvedLanguage !== lng) {
    i18n.changeLanguage(lng);
  } else {
    // Use our custom implementation when running on client side
    // eslint-disable-next-line react-hooks/rules-of-hooks
    useCustomTranslationImpl(i18n, lng);
  }
  return translator;
}

function useCustomTranslationImpl(i18n: i18n, lng: SupportedLanguage) {
  // This effect changes the language of the application when the lng prop changes.
  useEffect(() => {
    if (!lng || i18n.resolvedLanguage === lng) return;
    i18n.changeLanguage(lng);
  }, [lng, i18n]);
}

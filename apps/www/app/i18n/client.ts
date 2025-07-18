'use client';

import { useEffect, useState } from 'react';
import i18next from 'i18next';
import { type UseTranslationOptions, initReactI18next, useTranslation as useTranslationOrg } from 'react-i18next';
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
      (language: SupportedLanguage, namespace: string) => import(`./locales/${language}/${namespace}.json`)
    )
  )
  .init({
    ...getOptions(),
    lng: undefined, // detect the language on the client
    detection: {
      order: ['path'], // only using the path option. ['path', 'htmlTag', 'cookie', 'navigator'].
    },
    preload: runsOnServerSide ? ALL_LOCALES : [],
  });

export function useTranslation(lng: SupportedLanguage, ns: string, options?: UseTranslationOptions<undefined>) {
  const instance = useTranslationOrg(ns, options);
  const { i18n } = instance;

  const [activeLng, setActiveLng] = useState(i18n.resolvedLanguage);

  useEffect(() => {
    if (runsOnServerSide) return;
    if (activeLng === i18n.resolvedLanguage) return;
    setActiveLng(i18n.resolvedLanguage);
  }, [activeLng, i18n.resolvedLanguage]);

  useEffect(() => {
    if (runsOnServerSide) return;
    if (!lng || i18n.resolvedLanguage === lng) return;
    i18n.changeLanguage(lng);
  }, [lng, i18n]);

  if (runsOnServerSide && lng && i18n.resolvedLanguage !== lng) {
    i18n.changeLanguage(lng);
  }

  return instance;
}

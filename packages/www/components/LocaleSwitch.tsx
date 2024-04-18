'use client';

import { ChangeEvent } from 'react';
import {
  useRouter,
  useParams,
  useSelectedLayoutSegments,
} from 'next/navigation';
import { Select, SelectItem } from '@nextui-org/react';
import { useAtom } from 'jotai';

import {
  localeAtom,
  isSupportedLanguage,
  SupportedLanguage,
} from '../app/i18n/settings';

function getFlagEmoji(countryCode: string) {
  const codePoints = countryCode
    .toUpperCase()
    .split('')
    .map((char) => 127397 + char.charCodeAt(0));
  return String.fromCodePoint(...codePoints);
}

const LocaleSwitch = () => {
  const router = useRouter();
  const params = useParams();
  const urlSegments = useSelectedLayoutSegments();
  const [locale, setLocale] = useAtom(localeAtom);
  if (params.locale && isSupportedLanguage(params.locale as string)) {
    setLocale(params.locale as SupportedLanguage);
  }

  const handleLocaleChange = (event: ChangeEvent<HTMLSelectElement>) => {
    const newLocale = event.target.value;
    if (isSupportedLanguage(newLocale)) {
      setLocale(newLocale as SupportedLanguage);
      // NOTE:
      // This component is used by the Header component which sits in `app/[locale]/layout.tsx` file,
      // Therefore, urlSegments will contain the segments after the locale.
      // We replace the URL with the new locale and the rest of the segments.
      // This only works so simply due to the location of the layout in the path.
      router.push(`/${newLocale}/${urlSegments.join('/')}`);
    }
  };

  return (
    <Select
      onChange={handleLocaleChange}
      selectedKeys={[locale]}
      aria-label="Select a language"
      className="max-w-xs"
    >
      <SelectItem key="en" value="en">
        {getFlagEmoji('gb')}
      </SelectItem>
      <SelectItem key="de" value="de">
        {getFlagEmoji('de')}
      </SelectItem>
      <SelectItem key="pt" value="pt">
        {getFlagEmoji('br')}
      </SelectItem>
    </Select>
  );
};

export default LocaleSwitch;

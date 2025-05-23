'use client';

import { Key, useMemo, useState } from 'react';
import { useRouter, useSelectedLayoutSegments } from 'next/navigation';
import { Button } from "@heroui/button";
import {
  Dropdown,
  DropdownItem,
  DropdownMenu,
  DropdownTrigger,
} from "@heroui/dropdown";

import { isSupportedLanguage, SupportedLanguage } from '../app/i18n/settings';
import { useLocale } from '@/hooks/useLocale';

function getFlagEmoji(countryCode: string) {
  const codePoints = countryCode
    .toUpperCase()
    .split('')
    .map((char) => 127397 + char.charCodeAt(0));
  return String.fromCodePoint(...codePoints);
}

const LocaleSwitch = () => {
  const router = useRouter();
  const initLocale = useLocale();
  const urlSegments = useSelectedLayoutSegments();
  const [locale, setLocale] = useState<SupportedLanguage>(initLocale);
  const [selectedKeys, setSelectedKeys] = useState(new Set([locale]));

  const selectedFlag = useMemo((): string => {
    let mappedCode: string;
    switch (locale) {
      case 'en':
        mappedCode = 'gb';
        break;
      case 'pt':
        mappedCode = 'br';
        break;
      default:
        mappedCode = locale;
    }
    return getFlagEmoji(mappedCode);
  }, [locale]);

  const handleLocaleChange = (key: Key) => {
    const newLocale = key as string;
    if (!isSupportedLanguage(newLocale))
      throw new Error(
        'Unexpected value: The selectedValue for locale is not a supported language'
      );
    setLocale(newLocale as SupportedLanguage);
    setSelectedKeys(new Set([newLocale]));
    // NOTE:
    // This component is used by the Header component which sits in `app/[locale]/layout.tsx` file,
    // Therefore, urlSegments will contain the segments after the locale.
    // We replace the URL with the new locale and the rest of the segments.
    // This only works so simply due to the location of the layout in the path.
    router.push(`/${newLocale}/${urlSegments.join('/')}`);
  };

  return (
    <Dropdown>
      <DropdownTrigger>
        <Button variant="bordered" className="capitalize">
          {selectedFlag}
        </Button>
      </DropdownTrigger>
      <DropdownMenu
        aria-label="Language Selection"
        variant="flat"
        disallowEmptySelection
        selectionMode="single"
        selectedKeys={selectedKeys}
        onAction={handleLocaleChange}
      >
        <DropdownItem key="en">{getFlagEmoji('gb')}</DropdownItem>
        <DropdownItem key="de">{getFlagEmoji('de')}</DropdownItem>
        <DropdownItem key="pt">{getFlagEmoji('br')}</DropdownItem>
      </DropdownMenu>
    </Dropdown>
  );
  // return (
  //   <Select
  //     onChange={handleLocaleChange}
  //     selectedKeys={[locale]}
  //     aria-label="Select a language"
  //     className="max-w-xs"
  //   >
  //     <SelectItem key="en" value="en">
  //       {getFlagEmoji('gb')}
  //     </SelectItem>
  //     <SelectItem key="de" value="de">
  //       {getFlagEmoji('de')}
  //     </SelectItem>
  //     <SelectItem key="pt" value="pt">
  //       {getFlagEmoji('br')}
  //     </SelectItem>
  //   </Select>
  // );
};

export default LocaleSwitch;

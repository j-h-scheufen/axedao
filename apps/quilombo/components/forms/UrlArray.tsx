'use client';

import { Button, Input } from '@heroui/react';
import { atom, useAtom } from 'jotai';
import { PlusIcon, XIcon } from 'lucide-react';
import { useCallback } from 'react';

import { isValidUrl } from '@/config/validation-schema';

type Props = {
  urls: string[];
  actions?: { remove?: (index: number) => void; add: (url: string) => void };
  placeholder?: string;
};

const inputUrlAtom = atom<string>('');
const isValidUrlAtom = atom<boolean>(true);

const UrlItem = ({ url, index, actions }: { url: string; index: number; actions?: Props['actions'] }) => (
  <div className="flex flex-row gap-1 sm:gap-2 justify-between rounded-lg border-divider bg-content1 items-center">
    <div className="flex flex-row gap-2 sm:gap-3 items-center p-2 pl-3">
      <span className="text-sm break-all">{url}</span>
    </div>
    <Button
      size="sm"
      variant="light"
      onPress={() => {
        if (actions?.remove) actions.remove(index);
      }}
      isIconOnly
    >
      {actions?.remove && <XIcon className="h-4 w-4" strokeWidth={1} />}
    </Button>
  </div>
);

const UrlArray = ({ urls, actions, placeholder = 'https://example.com/article-or-video' }: Props) => {
  const [url, setUrl] = useAtom(inputUrlAtom);
  const [urlValid, setUrlValid] = useAtom(isValidUrlAtom);

  const validateUrl = useCallback(() => {
    const isValid = isValidUrl(url);
    setUrlValid(isValid);
    return isValid;
  }, [url, setUrlValid]);

  return (
    <div className="flex flex-col">
      {!!urls.length && (
        <div className="flex flex-col gap-1 sm:gap-2 w-full mb-2 sm:mb-3">
          {urls.map((url, index) => (
            // biome-ignore lint/suspicious/noArrayIndexKey: Safe to use index as key
            <UrlItem key={`url-item-${index}`} url={url} index={index} actions={actions} />
          ))}
        </div>
      )}
      {actions?.add && (
        <div className="flex flex-col gap-1 sm-gap-2">
          <span className="text-wrap text-small sm:text-medium">
            To add a URL, enter it below and hit &apos;+&apos;
          </span>
          <div className="flex flex-row gap-1 sm:gap-2 items-start justify-end">
            <Input
              placeholder={placeholder}
              type="text"
              isInvalid={!urlValid}
              value={url}
              onChange={(e) => {
                setUrlValid(true);
                setUrl(e.target.value);
              }}
              errorMessage="Please enter a valid URL incl. https://"
            />
            <Button
              variant="solid"
              onPress={() => {
                if (!validateUrl()) return;
                actions.add(url);
                setUrl('');
              }}
              isIconOnly
            >
              <PlusIcon className="h-6 w-6 sm:h-8 sm:w-8" strokeWidth={1} />
            </Button>
          </div>
        </div>
      )}
    </div>
  );
};

export default UrlArray;

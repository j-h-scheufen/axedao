'use client';

import { Button, Dropdown, DropdownItem, DropdownMenu, DropdownTrigger, Input } from '@heroui/react';
import { atom, useAtom } from 'jotai';
import { PlusIcon, XIcon } from 'lucide-react';
import { useCallback, useMemo, type ReactNode } from 'react';

import { linkTypes } from '@/config/constants';
import { isValidUrl, type Link, linkSchema } from '@/config/validation-schema';
import type { LinkType, SocialLink } from '@/db/schema';
import { getLinkIcon } from '../_utils';

type LinkTypeSelection = { icon: ReactNode; key: string; label: string };
type Props = { links: SocialLink[]; actions?: { remove?: (index: number) => void; add: (link: SocialLink) => void } };

const defaultTypeOption: LinkTypeSelection = { key: 'other', icon: getLinkIcon(undefined), label: 'Other' };
const selectedTypeAtom = atom<LinkTypeSelection>(defaultTypeOption);
const inputUrlAtom = atom<string>('');
const isValidUrlAtom = atom<boolean>(true);

const LinkItem = ({ link, index, actions }: { link: Link; index: number; actions?: Props['actions'] }) => (
  <div className="flex flex-row gap-1 sm:gap-2 justify-between rounded-lg border-divider bg-content1 items-center">
    <div className="flex flex-row gap-2 sm:gap-3 items-center p-2 pl-3">
      {getLinkIcon(link.type)}
      <span>{link.url}</span>
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

const LinksArray = ({ links, actions }: Props) => {
  const [typeSelection, setTypeSelection] = useAtom(selectedTypeAtom);
  const [url, setUrl] = useAtom(inputUrlAtom);
  const [urlValid, setUrlValid] = useAtom(isValidUrlAtom);
  const linkTypeOptions: LinkTypeSelection[] = useMemo(() => {
    const knownTypes = linkTypes.map((type) => ({ icon: getLinkIcon(type), key: type, label: type.toUpperCase() }));
    return [defaultTypeOption, ...knownTypes];
  }, []);
  const validateUrl = useCallback(() => {
    const isValid = isValidUrl(url);
    setUrlValid(isValid);
    return isValid;
  }, [url, setUrlValid]);

  return (
    <div className="flex flex-col">
      {!!links.length && (
        <div className="flex flex-col gap-1 sm:gap-2 w-full mb-2 sm:mb-3">
          {links.map((link, index) => (
            // biome-ignore lint/suspicious/noArrayIndexKey: Safe to use index as key
            <LinkItem key={`link-item-${index}`} link={link} index={index} actions={actions} />
          ))}
        </div>
      )}
      {actions?.add && (
        <div className="flex flex-col gap-1 sm-gap-2">
          <span className="text-wrap text-small sm:text-medium">
            To add a link, enter a URL, select an icon, and hit &apos;+&apos;
          </span>
          <div className="flex flex-row gap-1 sm:gap-2 items-start justify-end">
            <Input
              placeholder="https://facebook.com/my-handle"
              type="text"
              isInvalid={!urlValid}
              value={url}
              onChange={(e) => {
                setUrlValid(true);
                setUrl(e.target.value);
              }}
              errorMessage="Please enter a valid URL incl. https://"
            />
            <Dropdown>
              <DropdownTrigger>
                <Button variant="bordered">{typeSelection.icon}</Button>
              </DropdownTrigger>
              <DropdownMenu
                aria-label="Select Link Icon"
                items={linkTypeOptions}
                selectedKeys={[typeSelection.key]}
                onAction={(key) => {
                  const selectedOption = linkTypeOptions.find((option) => option.key === key);
                  setTypeSelection(selectedOption || defaultTypeOption);
                }}
              >
                {(items) => (
                  <DropdownItem key={items.key} startContent={items.icon}>
                    {items.label}
                  </DropdownItem>
                )}
              </DropdownMenu>
            </Dropdown>
            <Button
              variant="solid"
              onPress={() => {
                if (!validateUrl()) return;

                const newLink: Link = {
                  url,
                  type: typeSelection.key === defaultTypeOption.key ? undefined : (typeSelection.key as LinkType),
                };
                linkSchema.validateSync(newLink);
                actions.add(newLink);
                setUrl('');
                setTypeSelection(defaultTypeOption);
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

export default LinksArray;

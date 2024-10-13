'use client';

import { Button } from '@nextui-org/button';
import { Dropdown, DropdownItem, DropdownMenu, DropdownTrigger } from '@nextui-org/dropdown';
import { atom, useAtom } from 'jotai';
import { PlusIcon, XIcon } from 'lucide-react';
import { useCallback, useMemo, useRef } from 'react';

import { linkTypes } from '@/config/constants';
import { isValidUrl, Link, linkSchema } from '@/config/validation-schema';
import { LinkType, SocialLink } from '@/db/schema';
import { Input } from '@nextui-org/input';
import { getLinkIcon } from '../_utils';

type LinkTypeSelection = { icon: JSX.Element; key: string; label: string };
type Props = { links: SocialLink[]; actions?: { remove?: (index: number) => void; add: (link: SocialLink) => void } };

const defaultTypeOption: LinkTypeSelection = { key: 'other', icon: getLinkIcon(undefined), label: 'Other' };
const selectedTypeAtom = atom<LinkTypeSelection>(defaultTypeOption);
const isLinkUrlError = atom<boolean>(false);

const LinksArray = ({ links, actions }: Props) => {
  const urlRef = useRef<HTMLInputElement>(null);
  const [typeSelection, setTypeSelection] = useAtom(selectedTypeAtom);
  const [isUrlError, setIsUrlError] = useAtom(isLinkUrlError);
  const isNewUrlValid = useCallback(() => isValidUrl(urlRef.current?.value), [urlRef]);
  const linkTypeOptions: LinkTypeSelection[] = useMemo(() => {
    const knownTypes = linkTypes.map((type) => ({ icon: getLinkIcon(type), key: type, label: type.toUpperCase() }));
    return [defaultTypeOption, ...knownTypes];
  }, []);

  const LinkItem = ({ link, index }: { link: Link; index: number }) => {
    return (
      <div className="flex flex-row gap-1 sm:gap-2 justify-between rounded-lg border-divider bg-content1 items-center">
        <div className="flex flex-row gap-2 sm:gap-3 items-center p-2 pl-3">
          {getLinkIcon(link.type)}
          <span>{link.url}</span>
        </div>
        <Button
          size="sm"
          variant="light"
          // className="!px-1 text-default-500"
          onPress={() => {
            if (actions?.remove) actions.remove(index);
          }}
          isIconOnly
        >
          {actions?.remove && <XIcon className="h-4 w-4" strokeWidth={1} />}
        </Button>
      </div>
    );
  };

  return (
    <div className="flex flex-col gap-2 sm:gap-4">
      <div className="flex flex-col gap-1 sm:gap-2 w-full">
        {links.map((link, index) => (
          <LinkItem key={`link-item-${index}`} link={link} index={index} />
        ))}
      </div>
      {actions?.add && (
        <div className="flex flex-col gap-1 sm-gap-2">
          <span className="text-wrap text-sm sm:text-lg">
            Too add a link, enter a URL, select an icon, and hit &apos;+&apos;
          </span>
          <div className="flex flex-row gap-1 sm:gap-2 items-start justify-end">
            <Input
              placeholder="https://facebook.com/my-handle"
              type="text"
              ref={urlRef}
              isInvalid={isUrlError}
              onChange={() => setIsUrlError(false)}
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
                if (!isNewUrlValid()) {
                  setIsUrlError(true);
                  return;
                }
                const newLink: Link = {
                  url: urlRef.current?.value || '',
                  type: typeSelection.key === defaultTypeOption.key ? undefined : (typeSelection.key as LinkType),
                };
                linkSchema.validateSync(newLink);
                actions.add(newLink);
                urlRef.current!.value = '';
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

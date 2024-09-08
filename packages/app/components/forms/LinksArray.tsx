import { Button } from '@nextui-org/button';
import { Input } from '@nextui-org/input';
import { ArrayHelpers, Field } from 'formik';
import { PlusIcon, XIcon } from 'lucide-react';
import { ChangeEvent } from 'react';

import { linkTypes } from '@/config/constants';
import { LinksCollection } from '@/config/validation-schema';
import { getHostname } from '@/utils';
import { getLinkIcon } from '../_utils';

type Props = ArrayHelpers & {
  links: LinksCollection;
  ownerId: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  setFieldValue: (field: string, value: any) => void;
};

const LinksArray = ({ links, ownerId, setFieldValue, remove, push }: Props) => {
  return (
    <div>
      <div className="grid h-fit w-full grid-cols-1 gap-x-3 gap-y-3 text-small text-default-500 sm:grid-cols-2">
        {links.length > 0 ? (
          links.map((link, index) => (
            <Field
              name={`links.${index}`}
              key={index}
              as={Input}
              size="sm"
              value={link.url}
              onChange={(e: ChangeEvent<HTMLInputElement>) => {
                const domain = getHostname(e.target.value);
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                if (domain && linkTypes.includes(domain as any)) {
                  setFieldValue(`links.${index}.type`, domain);
                }
                setFieldValue(`links.${index}.url`, e.target.value);
              }}
              classNames={{ inputWrapper: 'h-10' }}
              startContent={getLinkIcon(link.type?.toString())}
              endContent={
                <Button
                  size="sm"
                  variant="light"
                  className="mt-0.5 !px-1 text-default-500"
                  onPress={() => remove(index)}
                  isIconOnly
                >
                  <XIcon className="h-4 w-4" strokeWidth={1} />
                </Button>
              }
            />
          ))
        ) : (
          <></>
        )}
      </div>
      <div className="mt-3 flex justify-end gap-3">
        <Button
          variant="bordered"
          size="sm"
          className="ml-auto w-fit"
          onPress={() => {
            push({ url: '', ownerId, type: null });
          }}
        >
          <PlusIcon className="h-4 w-4" strokeWidth={1.25} /> Add link
        </Button>
      </div>
    </div>
  );
};

export default LinksArray;

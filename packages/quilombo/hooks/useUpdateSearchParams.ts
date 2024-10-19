import { usePathname, useRouter } from 'next/navigation';
import { ReadonlyURLSearchParams } from 'next/navigation';
import { useCallback } from 'react';

const useUpdateSearchParams = (searchParams: ReadonlyURLSearchParams) => {
  const router = useRouter();
  const pathname = usePathname();

  // Get a new searchParams string by merging the current
  // searchParams with a provided key/value pair
  const updater = useCallback(
    (name: string, value: string) => {
      const params = new URLSearchParams(searchParams.toString());
      params.set(name, value);
      router.push(`${pathname}?${params.toString()}`);
    },
    [searchParams],
  );

  return updater;
};

export default useUpdateSearchParams;

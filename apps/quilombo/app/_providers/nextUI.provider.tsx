'use client';

import * as React from 'react';
import { HeroUIProvider } from "@heroui/system";
import { useRouter } from 'next/navigation';
import { ThemeProvider as NextThemesProvider } from 'next-themes';
import { ThemeProviderProps } from 'next-themes/dist/types';

export type ProviderProps = {
  children: React.ReactNode;
  themeProps?: ThemeProviderProps;
};

export default function Provider({ children, themeProps }: ProviderProps) {
  const router = useRouter();

  return (
    <HeroUIProvider navigate={router.push}>
      <NextThemesProvider {...themeProps}>{children}</NextThemesProvider>
    </HeroUIProvider>
  );
}

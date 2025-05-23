'use client';

import { Switch, SwitchProps } from "@heroui/switch";
import { useIsSSR } from '@react-aria/ssr';
import clsx from 'clsx';
import { useTheme } from 'next-themes';
import { FC } from 'react';

import { MoonFilledIcon, SunFilledIcon } from '@/components/icons';

export type ThemeSwitchProps = {
  className?: string;
  classNames?: SwitchProps['classNames'];
};

export const ThemeSwitch: FC<ThemeSwitchProps> = ({ className, classNames }): JSX.Element => {
  const { theme, setTheme } = useTheme();
  const isSSR = useIsSSR();

  const onChange = () => {
    if (theme === 'light') setTheme('dark');
    else setTheme('light');
  };

  return (
    <Switch
      isSelected={theme === 'dark' || isSSR}
      aria-label={`Switch to ${theme === 'light' || isSSR ? 'dark' : 'light'} mode`}
      size="sm"
      startContent={<MoonFilledIcon size={12} />}
      endContent={<SunFilledIcon size={12} />}
      onChange={onChange}
      className={clsx('transition-opacity hover:opacity-80 [&>span]:mr-0', className, classNames?.base)}
    />
  );
};

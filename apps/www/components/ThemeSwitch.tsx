'use client';

import { Switch, type SwitchProps } from '@heroui/react';
import { useIsSSR } from '@react-aria/ssr';
import clsx from 'clsx';
import { useTheme } from 'next-themes';
import type { FC } from 'react';

import { MoonFilledIcon, SunFilledIcon } from '@/components/icons';

export type ThemeSwitchProps = {
  className?: string;
  classNames?: SwitchProps['classNames'];
};

const ThemeSwitch: FC<ThemeSwitchProps> = ({ className, classNames }) => {
  const { theme, setTheme } = useTheme();
  const isSSR = useIsSSR();

  const onChange = () => {
    if (theme === 'light') setTheme('dark');
    else setTheme('light');
  };

  return (
    <Switch
      isSelected={theme === 'light' || isSSR}
      aria-label={`Switch to ${theme === 'light' || isSSR ? 'dark' : 'light'} mode`}
      size="md"
      startContent={<SunFilledIcon size={16} />}
      endContent={<MoonFilledIcon size={16} />}
      onChange={onChange}
      className={clsx('transition-opacity hover:opacity-80', className, classNames?.base)}
    />
  );
};

export default ThemeSwitch;

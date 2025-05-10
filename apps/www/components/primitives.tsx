import { PropsWithChildren } from 'react';
import { tv } from 'tailwind-variants';

export const Title = tv({
  base: 'tracking-tight inline font-semibold',
  variants: {
    color: {
      violet: 'from-[#FF1CF7] to-[#b249f8]',
      yellow: 'from-[#FF705B] to-[#FFB457]',
      blue: 'from-[#5EA2EF] to-[#0072F5]',
      cyan: 'from-[#00b7fa] to-[#01cfea]',
      green: 'from-[#A0E361] to-[#68A430]',
      pink: 'from-[#FF72E1] to-[#F54C7A]',
      foreground: 'dark:from-[#FFFFFF] dark:to-[#4B4B4B]',
    },
    size: {
      sm: 'text-3xl lg:text-4xl',
      md: 'text-[2.3rem] lg:text-5xl leading-9',
      lg: 'text-4xl lg:text-6xl',
      xl: 'text-6xl lg:text-7xl xl:8xl',
    },
    fullWidth: {
      true: 'w-full block',
    },
  },
  defaultVariants: {
    size: 'md',
  },
  compoundVariants: [
    {
      color: [
        'violet',
        'yellow',
        'blue',
        'cyan',
        'green',
        'pink',
        'foreground',
      ],
      class: 'bg-clip-text text-transparent bg-gradient-to-b',
    },
  ],
});

export const Subtitle = tv({
  base: 'w-full text-2xl md:text-3xl text-default-500 dark:text-default-600 block max-w-full',
  variants: {
    fullWidth: {
      true: '!w-full',
    },
  },
  defaultVariants: {
    fullWidth: true,
  },
});

export const TextSection: React.FC<PropsWithChildren> = ({ children }) => (
  <p className="mx-3 my-5 text-left text-lg lg:text-xl">{children}</p>
);

export const PageContainer: React.FC<PropsWithChildren> = ({ children }) => (
  <section className="flex flex-col items-center justify-center gap-4 py-8 md:py-10">
    <div className="inline-block justify-center text-center">{children}</div>
  </section>
);

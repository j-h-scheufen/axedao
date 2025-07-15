import { Fira_Code, Inter, Open_Sans } from 'next/font/google';

export const fontInter = Inter({
  subsets: ['latin'],
  variable: '--font-inter',
});

// monospace
export const fontFiraCode = Fira_Code({
  subsets: ['latin'],
  variable: '--font-fira-code',
});

// export const fontNunito = Nunito({
//   subsets: ['latin'],
//   variable: '--font-nunito',
// });

// export const fontLato = Lato({
//   weight: '400',
//   subsets: ['latin'],
//   variable: '--font-lato',
// });

export const fontOpenSans = Open_Sans({
  subsets: ['latin'],
  variable: '--font-open-sans',
});

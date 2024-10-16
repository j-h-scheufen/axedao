import { nextui } from '@nextui-org/theme';
import { withTV } from 'tailwind-variants/transformer';

/** @type {import('tailwindcss').Config} */
module.exports = withTV({
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './sections/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './node_modules/@nextui-org/theme/dist/**/*.{js,ts,jsx,tsx}',
    // required for hoisted dependencies
    '../../node_modules/@nextui-org/theme/dist/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: 'var(--font-open-sans)',
        inter: 'var(--font-inter)',
      },
    },
  },
  darkMode: 'class',
  plugins: [
    nextui({
      themes: {
        dark: {
          colors: { primary: '#CCD5AEff', secondary: '#D4A373ff' },
        },
        light: {
          colors: { primary: '#8abc6b', secondary: '#FAEDCDff' },
        },
      },
      textColors: { primary: '#000000' },
    }),
  ],
});

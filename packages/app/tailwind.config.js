import { nextui } from '@nextui-org/theme';
import { withTV } from 'tailwind-variants/transformer';
const defaultTheme = require('tailwindcss/defaultTheme');

/** @type {import('tailwindcss').Config} */
module.exports = withTV({
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './node_modules/@nextui-org/theme/dist/**/*.{js,ts,jsx,tsx}',
    // required for hoisted dependencies
    '../../node_modules/@nextui-org/theme/dist/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    screens: {
      xs: '480px',
      ...defaultTheme.screens,
    },
    extend: {},
  },
  darkMode: 'class',
  plugins: [
    nextui({
      layout: {
        height: {
          small: '10px',
          medium: '12px',
          large: '14px',
        },
      },
      themes: {
        dark: { colors: { primary: '#BF36BA', secondary: '#D4A373ff' } },
        light: { colors: { primary: '#BF36BA', secondary: '#FAEDCDff' } },
      },
    }),
  ],
});

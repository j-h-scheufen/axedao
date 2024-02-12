import { nextui } from '@nextui-org/theme';

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './sections/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './node_modules/@nextui-org/theme/dist/**/*.{js,ts,jsx,tsx}',
    // required for hoisted dependencies
    '../node_modules/@nextui-org/theme/dist/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {},
  },
  darkMode: 'class',
  plugins: [
    nextui({
      themes: {
        dark: { colors: { primary: '#CCD5AEff', secondary: '#D4A373ff' } },
        light: { colors: { primary: '#E9EDC9ff', secondary: '#FAEDCDff' } },
      },
    }),
  ],
};

// --beige: #E9EDC9ff;
// --tea-green: #CCD5AEff;
// --cornsilk: #FEFAE0ff;
// --buff: #D4A373ff;
// --papaya-whip: #FAEDCDff;

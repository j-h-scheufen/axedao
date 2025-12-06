import defaultTheme from 'tailwindcss/defaultTheme';
import { heroui } from '@heroui/react';

/**
 * TAILWIND V4 + HEROUI CONFIGURATION
 *
 * This config file is loaded via @config directive in globals.css.
 * We use this approach instead of HeroUI's recommended @plugin CSS-first
 * approach because @plugin doesn't properly generate dark theme CSS variables.
 *
 * Key requirement: darkMode: 'class' must be set here for HeroUI to generate
 * both :root (light) and .dark (dark) CSS variable sets.
 *
 * See globals.css for full explanation of why @plugin approach doesn't work.
 */
export default {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    screens: {
      xs: '480px',
      ...defaultTheme.screens, // 'sm': '640px', 'md': '768px', 'lg': '1024px', 'xl': '1280px', '2xl': '1536px'
    },
    extend: {
      fontFamily: {
        sans: ['var(--font-sans)', ...defaultTheme.fontFamily.sans],
        inter: ['var(--font-inter)', ...defaultTheme.fontFamily.sans],
        'fira-code': ['var(--font-fira-code)', ...defaultTheme.fontFamily.mono],
      },
    },
  },
  darkMode: 'class',
  plugins: [
    heroui({
      themes: {
        dark: {
          // Extend the default dark theme to inherit background, foreground, default, etc.
          extend: 'dark',
          colors: {
            primary: {
              DEFAULT: '#79D91F',
              50: '#4A9107',
              100: '#4F960D',
              200: '#59A116',
              300: '#66AE23',
              400: '#71B92E',
              500: '#7DC639',
              600: '#8FD84B',
              700: '#A3E664',
              800: '#B7F180',
              900: '#D3FAAE',
              foreground: '#000000',
            },
            secondary: {
              DEFAULT: '#aa825c',
              50: '#15100b',
              100: '#2a2117',
              200: '#55412e',
              300: '#947251',
              400: '#aa825c',
              500: '#bf9368',
              600: '#d8ac81',
              700: '#e1bf9d',
              800: '#ead1b9',
              900: '#f2e3d5',
              foreground: '#000000',
            },
          },
        },
        light: {
          // Extend the default light theme to inherit background, foreground, default, etc.
          extend: 'light',
          colors: {
            primary: {
              DEFAULT: '#7FD92A',
              50: '#1F3A06',
              100: '#2D520A',
              200: '#3E6F11',
              300: '#538F1B',
              400: '#69AE29',
              500: '#7DC639',
              600: '#8FD84B',
              700: '#A3E664',
              800: '#B7F180',
              900: '#D3FAAE',
              foreground: '#000000',
            },
            secondary: {
              DEFAULT: '#D4A373',
              50: '#15100b',
              100: '#2a2117',
              200: '#55412e',
              300: '#947251',
              400: '#aa825c',
              500: '#bf9368',
              600: '#d8ac81',
              700: '#e1bf9d',
              800: '#ead1b9',
              900: '#f2e3d5',
              foreground: '#000000',
            },
          },
        },
      },
    }),
  ],
};

export default {
  semi: true,
  trailingComma: 'all',
  singleQuote: true,
  printWidth: 120,
  tabWidth: 2,
  bracketSpacing: true,
  overrides: [
    {
      files: '**/*.sol',
      options: {
        printWidth: 120,
        singleQuote: false,
      },
    },
  ],
  plugins: ['prettier-plugin-solidity'],
};

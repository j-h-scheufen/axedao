# Axé DAO Public Website

**Marketing and informational website for Axé DAO**

The public-facing website for the Axé DAO project, providing information about the project, community, and onboarding new users to the ecosystem.

## Features

- **Multilingual Support**: Full i18next internationalization with browser language detection
- **Responsive Design**: Mobile-first design with HeroUI and Tailwind CSS
- **Dark/Light Mode**: Theme switching with next-themes
- **Static Site Generation**: Fast, SEO-friendly pages with Next.js App Router
- **Smooth Animations**: Framer Motion for engaging user experience

## Quick Start

### Prerequisites

- **Node.js**: >=20.0.0 (see root `package.json`)
- **pnpm**: Latest (see root `package.json`)

> **Note**: For current package versions, refer to the `package.json` file.

### Installation

```bash
# From monorepo root
pnpm install

# Or from www directory
cd apps/www
pnpm install
```

### Development

```bash
# Start development server (default port 3000)
pnpm dev

# Or from monorepo root
pnpm dev:www
```

Visit http://localhost:3000

### Building

```bash
# Build for production
pnpm build

# Start production server
pnpm start
```

## Technology Stack

- **Framework**: Next.js App Router with React
- **UI Library**: HeroUI
- **Styling**: Tailwind CSS
- **Internationalization**: i18next with browser language detection
- **Animations**: Framer Motion
- **Theme**: next-themes
- **Analytics**: Vercel Analytics

## Project Structure

```
apps/www/
├── app/                 # Next.js App Router pages
│   ├── [locale]/       # Internationalized routes
│   └── ...
├── components/         # Reusable React components
├── config/             # Configuration files
├── public/             # Static assets
│   └── locales/       # Translation files
└── package.json
```

## Internationalization

The website supports multiple languages using i18next:

### Adding Translations

1. Add translation files to `public/locales/[locale]/common.json`
2. Configure supported locales in i18n configuration
3. Use translation keys in components:

```tsx
import { useTranslation } from 'react-i18next';

export function MyComponent() {
  const { t } = useTranslation();
  return <h1>{t('welcome.title')}</h1>;
}
```

### Supported Languages

- English (en)
- Portuguese (pt)
- Spanish (es)
- _Add more as needed_

## Styling

Uses Tailwind CSS with HeroUI component library:

- **Mobile-First**: Design for mobile, enhance for desktop
- **Dark Mode**: Automatic theme switching
- **Consistent Design**: HeroUI components ensure consistency

## Testing

```bash
# Run tests
pnpm test

# Run with coverage
pnpm test:coverage
```

## Building and Deployment

### Production Build

```bash
# Build optimized production bundle
pnpm build

# Preview production build locally
pnpm start
```

### Deployment Platforms

- **Vercel** (recommended): Zero-config deployment
- **Netlify**: Full support for Next.js
- **Self-hosted**: Node.js server required

## Contributing

We welcome contributions! Please see the main [Contributing Guide](../../README.md#contributing).

### Website-Specific Guidelines

1. **Content Changes**:
   - Update translation files for all supported languages
   - Follow writing style guide
   - Ensure accessibility (WCAG 2.1 AA)

2. **Components**:
   - Use HeroUI components
   - Follow mobile-first design
   - Add proper TypeScript types
   - Ensure responsive design

3. **Internationalization**:
   - Add translations for all languages
   - Test language switching
   - Use semantic keys for translations

## Linting and Formatting

```bash
# Lint
pnpm lint

# Format
pnpm format
```

## Documentation

- **Main Repository**: [Root README](../../README.md)
- **Quilombo DApp**: [Quilombo README](../quilombo/README.md)
- **Smart Contracts**: [Contracts README](../../packages/contracts/README.md)
- **Next.js Docs**: [https://nextjs.org/docs](https://nextjs.org/docs)
- **i18next Docs**: [https://www.i18next.com/](https://www.i18next.com/)

## License

MIT License - see [LICENSE](../../LICENSE) for details.

## Support

- ⭐ Star the repository
- 🐛 Report bugs via GitHub issues
- 💡 Suggest features
- 🤝 Submit pull requests

---

**Part of the Axé DAO ecosystem**

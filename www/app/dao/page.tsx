import { Link } from '@nextui-org/link';
import { button as buttonStyles } from '@nextui-org/theme';
import { siteConfig } from '@/config/site';
import { GithubIcon } from '@/components/icons';

import { title } from '@/components/primitives';

export default function AboutPage() {
  return (
    <div>
      <h1 className={title()}>About</h1>

      <div className="flex gap-3">
        <Link
          isExternal
          className={buttonStyles({ variant: 'bordered', radius: 'full' })}
          href={siteConfig.links.github}
        >
          <GithubIcon size={20} />
          GitHub
        </Link>
      </div>
    </div>
  );
}

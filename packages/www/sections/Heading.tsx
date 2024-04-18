'use client';

import { useRef } from 'react';
import { useScroll, useTransform, motion } from 'framer-motion';
import { Card, CardBody, Link } from '@nextui-org/react';
import { useAtomValue } from 'jotai';

import Reveal from '@/components/motion/Reveal';
import { subtitle, title } from '@/components/primitives';
import { siteConfig } from '@/config/site';
import { useTranslation } from '../app/i18n/client';
import { localeAtom } from '../app/i18n/settings';

const Heading = () => {
  const locale = useAtomValue(localeAtom);
  const { t } = useTranslation(locale, 'home');
  const targetRef = useRef<HTMLDivElement | null>(null);
  const { scrollYProgress } = useScroll({
    target: targetRef,
    offset: ['start -300px', 'end 0.1'],
  });
  // const opacity = useTransform(scrollYProgress, [0.25, 1], [1, 0]);
  const scale = useTransform(scrollYProgress, [0.25, 1], [1, 0.8]);
  // const position = useTransform(scrollYProgress, (pos) =>
  //   pos >= 1 ? 'relative' : 'fixed'
  // );

  return (
    // <motion.section
    //   id="HeadingSection"
    //   style={{ opacity }}
    //   ref={targetRef}
    //   className="relative mt-[5%] h-full sm:h-[67vh]"
    // >
    <motion.div
      style={{ scale }}
      // style={{ scale, x: '-50%' }}
      className="relative z-10 flex w-full max-w-6xl flex-col items-center"
    >
      <Reveal delay={0.2} className="text-center">
        <h1 className={title()}>{t('title')}</h1>
      </Reveal>
      <br />
      <Reveal delay={0.6}>
        <h2 className={subtitle({ class: 'mt-4 text-center' })}>
          A digital organization for the global Capoeira Community : {locale}
        </h2>
        <p className="mt-7 p-3 text-xl">
          The advent of <i>crypto/web3</i> has given the world a new set of
          tools. We are Capoeiristas from different corners of the world
          bringing these tools to the Capoeira community to create shared value.
          It is time for Capoeira to build its own open infrastructure and
          participate in the digital asset economy while giving every member a
          voice in shaping the future of this art form we love.
          <br />
          <br />
          Like Capoeira, the cypherpunk culture from which <i>
            crypto/web3
          </i>{' '}
          originates is rooted in the spirit of autonomy, resistance, freedom
          and self-determination. Axé DAO is a pioneering effort by Capoeiristas
          for Capoeiristas to channel collective resources into efforts that
          benefit Capoeira guided by the principles of decentralization and
          collective action.
        </p>
        <div className="flex w-full flex-col items-center p-2">
          <Card className="mt-6 max-w-[400px] sm:mt-14">
            <CardBody className=" items-center text-lg">
              Stay tuned for updates ...
            </CardBody>
          </Card>
          <div className="mt-6 text-center sm:mt-14">
            To get involved, email us at{' '}
            <Link href={`mailto:${siteConfig.links.email}`}>
              axe-dao (at) protonmail.com
            </Link>{' '}
            or join our <Link href={siteConfig.links.discord}>discord</Link>{' '}
            server.
          </div>
        </div>
      </Reveal>
    </motion.div>
    // </motion.section>
  );
};

export default Heading;

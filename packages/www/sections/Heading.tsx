'use client';

// import { useRef } from 'react';
// import { useScroll, useTransform, motion } from 'framer-motion';
import { motion } from 'framer-motion';
import { Card, CardBody, Link } from '@nextui-org/react';

import Reveal from '@/components/motion/Reveal';
import { subtitle, title } from '@/components/primitives';
import { siteConfig } from '@/config/site';
import { useTranslation } from '../app/i18n/client';
import { SupportedLanguage } from '@/app/i18n/settings';
import { Trans } from 'react-i18next';

const Heading = ({ locale }: { locale: SupportedLanguage }) => {
  const { t } = useTranslation(locale, 'home');
  // const targetRef = useRef<HTMLDivElement | null>(null);
  // const { scrollYProgress } = useScroll({
  //   target: targetRef,
  //   offset: ['start -300px', 'end 0.1'],
  // });
  // const opacity = useTransform(scrollYProgress, [0.25, 1], [1, 0]);
  // const scale = useTransform(scrollYProgress, [0.25, 1], [1, 0.8]);
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
      // style={{ scale, x: '-50%' }}
      className="relative z-10 flex w-full max-w-6xl flex-col items-center"
    >
      <Reveal delay={0.2} className="text-center">
        <h1 className={title()}>{t('heading.title')}</h1>
      </Reveal>
      <br />
      <Reveal delay={0.6}>
        <h2 className={subtitle({ class: 'mt-4 text-center' })}>
          {t('heading.subtitle')}
        </h2>
        <p className="mt-7 p-3 text-xl">
          <Trans t={t} i18nKey="heading.introduction" />
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

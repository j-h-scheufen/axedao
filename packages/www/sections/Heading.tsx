'use client';

// import { useRef } from 'react';
// import { useScroll, useTransform, motion } from 'framer-motion';
import { motion } from 'framer-motion';

import Reveal from '@/components/motion/Reveal';
import { Subtitle, Title } from '@/components/primitives';
import { useTranslation } from '../app/i18n/client';
import { SupportedLanguage } from '@/app/i18n/settings';
import { Trans } from 'react-i18next';

type HeadingProps = {
  locale: SupportedLanguage;
};

const Heading = ({ locale }: HeadingProps) => {
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
      className="relative z-10 flex w-full flex-col items-center px-3 sm:px-4 md:px-5"
    >
      <h1 className={Title()}>{t('heading.title')}</h1>
      <br />
      <Reveal delay={0.5}>
        <h2 className={Subtitle({ class: 'mt-4 text-center' })}>
          {t('heading.subtitle')}
        </h2>
        <div className="text-l mt-4 flex flex-col gap-4 md:text-center md:text-xl">
          <p>
            <Trans t={t} i18nKey="heading.introduction.p1" />
          </p>
          <p>
            <Trans t={t} i18nKey="heading.introduction.p2" />
          </p>
          <p>
            <Trans t={t} i18nKey="heading.introduction.p3" />
          </p>
        </div>
      </Reveal>
    </motion.div>
    // </motion.section>
  );
};

export default Heading;

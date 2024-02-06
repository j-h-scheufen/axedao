'use client';

import {
  useScroll,
  useTransform,
  motion,
  useMotionValueEvent,
} from 'framer-motion';
import { useRef } from 'react';

import Reveal from '@/components/motion/Reveal';
import { subtitle, title } from '@/components/primitives';

const Heading = () => {
  const targetRef = useRef<HTMLDivElement | null>(null);
  const { scrollYProgress } = useScroll({
    target: targetRef,
    offset: ['start -300px', 'end 0.4'],
  });
  const opacity = useTransform(scrollYProgress, [0, 0.5], [1, 0]);
  const scale = useTransform(scrollYProgress, [0, 0.5], [1, 0.8]);
  const position = useTransform(scrollYProgress, (pos) =>
    pos >= 1 ? 'relative' : 'fixed'
  );

  useMotionValueEvent(scrollYProgress, 'change', (latest) => {
    console.log('Heading scroll: ', latest);
  });

  return (
    <motion.section
      id="HeadingSection"
      style={{ opacity }}
      ref={targetRef}
      className="relative h-[70vh]"
    >
      <motion.div
        style={{ position, scale, x: '-50%' }}
        className="relative left-1/2 z-10 flex flex-col items-center"
      >
        <Reveal delay={0.2} className="text-center">
          <h1 className={title()}>Axé DAO Capoeira Community</h1>
        </Reveal>
        <br />
        <Reveal delay={0.6} className="text-center">
          <h2 className={subtitle({ class: 'mt-4' })}>
            The web3 community project for Axé DAO and Axé Token
          </h2>
        </Reveal>
        <br />
        <br />
        more blabla to test
      </motion.div>
    </motion.section>
  );
};

export default Heading;

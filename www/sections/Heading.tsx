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
    offset: ['end end', 'end start'],
  });
  const opacity = useTransform(scrollYProgress, [0, 0.5], [1, 0]);
  const scale = useTransform(scrollYProgress, [0, 0.5], [1, 0.8]);
  const position = useTransform(scrollYProgress, (pos) =>
    pos >= 0.6 ? 'relative' : 'fixed'
  );

  useMotionValueEvent(scrollYProgress, 'change', (latest) => {
    console.log('Page scroll: ', latest);
  });

  return (
    <motion.section
      id="HeadingSection"
      style={{ opacity }}
      ref={targetRef}
      className="relative mb-[8rem] h-screen before:pointer-events-none before:fixed before:inset-0 before:z-0 before:bg-[radial-gradient(circle_farthest-side_at_var(--x,_100px)_var(--y,_100px),_var(--color-secondary)_0%,_transparent_100%)] before:opacity-40"
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

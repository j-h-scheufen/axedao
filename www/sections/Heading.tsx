'use client';

import { useScroll, useTransform, motion } from 'framer-motion';
import { useRef } from 'react';

import Reveal from '@/components/motion/Reveal';
import { subtitle, title } from '@/components/primitives';

const Heading = () => {
  const targetRef = useRef<HTMLDivElement | null>(null);
  const { scrollYProgress } = useScroll({
    target: targetRef,
    offset: ['start -300px', 'end 0.1'],
  });
  const opacity = useTransform(scrollYProgress, [0.25, 1], [1, 0]);
  const scale = useTransform(scrollYProgress, [0.25, 1], [1, 0.8]);
  const position = useTransform(scrollYProgress, (pos) =>
    pos >= 1 ? 'relative' : 'fixed'
  );

  return (
    <motion.section
      id="HeadingSection"
      style={{ opacity }}
      ref={targetRef}
      className="relative mt-[5%] h-[67vh]"
    >
      <motion.div
        style={{ position, scale, x: '-50%' }}
        className="relative left-1/2 z-10 flex flex-col items-center"
      >
        <Reveal delay={0.2} className="text-center">
          <h1 className={title()}>Axé DAO</h1>
        </Reveal>
        <br />
        <Reveal delay={0.6} className="text-center">
          <h2 className={subtitle({ class: 'mt-4' })}>
            The web3 community of Capoeira
          </h2>
          <p className="mt-7 p-3 text-xl">
            We are using exciting new technologies from the web3 space to create
            common digital tools and services for the global family that is
            Capoeira.
            <br />
            <br />
            Scroll down to learn more ...
          </p>
        </Reveal>
      </motion.div>
    </motion.section>
  );
};

export default Heading;

'use client';

import { PropsWithChildren } from 'react';
import { motion } from 'framer-motion';

type RevealSectionProps = PropsWithChildren & {
  initialScale?: number;
  delay?: number;
};

const RevealSection: React.FC<RevealSectionProps> = ({
  initialScale = 0.8,
  delay = 0.5,
  children,
}) => {
  return (
    <motion.div
      initial={{
        scale: initialScale,
        opacity: 0,
      }}
      animate={{
        scale: 1,
        opacity: 1,
        transition: {
          delay,
          duration: 1.8,
        },
      }}
    >
      {children}
    </motion.div>
  );
};

export default RevealSection;

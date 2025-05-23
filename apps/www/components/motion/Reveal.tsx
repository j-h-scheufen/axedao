'use client';

import { motion } from 'framer-motion';
import type { PropsWithChildren } from 'react';

type RevealProps = PropsWithChildren & {
  initialScale?: number;
  delay?: number;
  className?: string;
};

const Reveal: React.FC<RevealProps> = ({ initialScale = 0.8, delay = 0.5, className = '', children }) => {
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
      className={className}
    >
      {children}
    </motion.div>
  );
};

export default Reveal;

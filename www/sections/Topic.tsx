'use client';

import { Card, CardBody, CardHeader } from '@nextui-org/react';
import { useTransform, useScroll, motion } from 'framer-motion';
import { useRef } from 'react';

type CardProps = {
  height?: string;
  width?: string;
  xOffset?: string;
  yOffset?: string;
};

type TopicProps = {
  title: string;
  bgImg: string;
  text: string;
  animateFrom?: 'left' | 'right';
  card?: CardProps;
};

const Topic: React.FC<TopicProps> = ({
  title,
  bgImg,
  text,
  animateFrom = 'left',
  card = {
    height: '300px',
    width: '500px',
    xOffset: '10%',
    yOffset: '15%',
  },
}) => {
  const targetRef = useRef<HTMLDivElement | null>(null);
  const extendedRef = useRef<HTMLDivElement | null>(null);
  const { scrollYProgress } = useScroll({
    target: targetRef,
    offset: ['start start', 'end 0.4'],
  });
  const { scrollYProgress: scrollYProgressIncludingOverlap } = useScroll({
    target: extendedRef,
    offset: ['start end', 'start start'],
  });

  const x = useTransform(
    scrollYProgressIncludingOverlap,
    [0, 0.75],
    animateFrom === 'left' ? ['-95vw', '0vw'] : ['95vw', '0vw']
  );

  const xCard = useTransform(
    scrollYProgressIncludingOverlap,
    [0.1, 0.9],
    animateFrom === 'left' ? ['25vw', '-30vw'] : ['-90vw', '-10vw']
  );

  const opacity = useTransform(scrollYProgress, [0.4, 0.8], [1, 0]);

  return (
    <section ref={targetRef} className="relative z-10 h-[60vh]">
      <div id="EXTENDED" ref={extendedRef} className="mb-5 h-2/3 w-full">
        <div className="sticky top-[10vh] flex flex-row">
          <motion.div style={{ x }} className="origin-top">
            <motion.img
              style={{ opacity }}
              src={bgImg}
              className="h-auto max-h-none w-[70vw]"
            />
          </motion.div>
          <motion.div style={{ x: xCard, opacity }} className={`mt-[25%]`}>
            <Card
              className={`z-20 h-[300px] w-[400px] bg-gradient-to-tl from-green-100 to-green-300`}
            >
              <CardHeader className="text-center">{title}</CardHeader>
              <CardBody>
                <p>{text}</p>
              </CardBody>
            </Card>
          </motion.div>
        </div>
      </div>
    </section>
  );
};

export default Topic;

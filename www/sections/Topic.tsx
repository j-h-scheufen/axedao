'use client';

import { Card, CardBody, CardHeader } from '@nextui-org/react';
import { useTransform, useScroll, motion } from 'framer-motion';
import { useRef } from 'react';

type TopicProps = {
  title: string;
  bgImg: string;
  text: string;
  animateFrom?: 'left' | 'right';
};

const Topic: React.FC<TopicProps> = ({
  title,
  bgImg,
  text,
  animateFrom = 'left',
}) => {
  const targetRef = useRef<HTMLDivElement | null>(null);
  const extendedRef = useRef<HTMLDivElement | null>(null);
  const { scrollYProgress } = useScroll({
    target: targetRef,
    offset: ['start end', 'end end'],
  });
  const { scrollYProgress: scrollYProgressIncludingOverlap } = useScroll({
    target: extendedRef,
    offset: ['start end', 'end end'],
  });

  const x = useTransform(
    scrollYProgressIncludingOverlap,
    [0, 0.75],
    animateFrom === 'left' ? ['-90vw', '0vw'] : ['90vw', '0vw']
  );

  const y = useTransform(
    scrollYProgressIncludingOverlap,
    [0, 0.75],
    ['-40vh', '0vh']
  );

  // const position = useTransform(scrollYProgress, (pos) => {
  //   console.log('POS:', pos);
  //   return pos;
  // });

  const opacity = useTransform(scrollYProgress, [0.9, 1], [1, 0]);

  return (
    <section
      id={`Topic-${title}`}
      ref={targetRef}
      className="relative z-10 h-screen"
    >
      <div
        id="EXTENDED"
        ref={extendedRef}
        className="mb-[-120vh] h-[420vh] w-full"
      >
        <div className="sticky top-[10vh]">
          <motion.div style={{ x, y }} className="origin-top">
            <motion.img
              style={{ opacity }}
              src={bgImg}
              className="h-auto max-h-none w-[70vw]"
            />
          </motion.div>
          <motion.div
            style={{ y }}
            className="right-[10%] top-[1.5%] flex gap-2"
          >
            <Card>
              {/* <CardHeader>Title</CardHeader> */}
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

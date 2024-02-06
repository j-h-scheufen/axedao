'use client';

import { useRef } from 'react';
import { Card, CardBody, CardHeader } from '@nextui-org/react';
import { useTransform, useScroll, motion } from 'framer-motion';

type TopicProps = {
  title: string;
  bgImg: string;
  text: string;
  imgEntryFrom?: 'left' | 'right';
  imgClasses?: string;
  imgMotionClasses?: string;
  cardClasses?: string;
  cardMotionClasses?: string;
};

/**
 *
 * @param param0
 * @returns
 */
const Topic: React.FC<TopicProps> = ({
  title,
  bgImg,
  text,
  imgEntryFrom = 'left',
  cardClasses = '',
  cardMotionClasses = '',
  imgClasses = '',
  imgMotionClasses = '',
}) => {
  const targetRef = useRef<HTMLDivElement | null>(null);

  const { scrollYProgress } = useScroll({
    target: targetRef,
    offset: ['start end', 'start start'],
  });

  const xImg = useTransform(
    scrollYProgress,
    [0, 0.75],
    imgEntryFrom === 'left' ? ['-120vw', '0vw'] : ['100vw', '0vw']
  );

  const xCard = useTransform(
    scrollYProgress,
    [0, 0.8],
    imgEntryFrom === 'left' ? ['90vw', '0vw'] : ['-90vw', '0vw']
  );

  // const opacity = useTransform(scrollYProgress, [0.4, 0.8], [1, 0]);

  return (
    <section ref={targetRef} className="relative z-10 my-[10%] h-[70vh]">
      <div className="sticky top-[10vh]">
        <div className="relative flex">
          <motion.div
            style={{ x: xImg }}
            className={`origin-top ${imgMotionClasses}`}
          >
            <motion.img
              src={bgImg}
              className={`h-auto max-h-none w-[90vw] rounded-2xl ${imgClasses}`}
            />
          </motion.div>
          <motion.div
            style={{ x: xCard }}
            className={`absolute right-9 top-10 origin-top ${cardMotionClasses}`}
          >
            <Card
              className={`z-20 bg-gradient-to-tl from-green-100 to-green-300 ${cardClasses}`}
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

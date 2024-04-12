'use client';

import { useRef } from 'react';
import {
  Button,
  Card,
  CardBody,
  CardFooter,
  CardHeader,
  Link,
} from '@nextui-org/react';
import { useTransform, useScroll, motion } from 'framer-motion';

type TopicProps = {
  title: string;
  bgImg: string;
  content: JSX.Element | string;
  url?: string;
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
  content,
  url,
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

  // const position = useTransform(scrollYProgress, (pos) =>
  //   pos >= 1 ? 'relative' : 'sticky'
  // );

  // style={{ position, top: '10vh' }}

  return (
    <section ref={targetRef} className="relative z-10 my-[10%] h-[70vh]">
      <motion.div className="sticky top-[10vh]">
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
              className={`z-20 border-2 bg-gradient-to-br from-amber-200 to-stone-300 ${cardClasses}`}
            >
              <CardHeader className=" text-center text-lg font-bold">
                {title}
              </CardHeader>
              <CardBody>{content}</CardBody>
              {url && (
                <CardFooter className=" justify-center">
                  <Button
                    color="primary"
                    as={Link}
                    href={url}
                    className="border-1 border-neutral-500 text-large"
                  >
                    Read more ...
                  </Button>
                </CardFooter>
              )}
            </Card>
          </motion.div>
        </div>
      </motion.div>
    </section>
  );
};

export default Topic;

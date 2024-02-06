import Heading from '@/sections/Heading';
import Topic from '@/sections/Topic';

export default function Home() {
  return (
    <div className="relative flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <Heading />

      <Topic
        title="Creating Axé"
        bgImg="/images/Chamada-Street.jpg"
        text="Coming together and creating Axé"
        cardClasses="w-[40vw] h-[300px]"
        cardMotionClasses="top-[60%] right-[8%]"
      />

      <Topic
        title="Creating Axé II"
        bgImg="/images/Roda-PedestrianZone.jpg"
        text="Coming together and creating Axé"
        imgEntryFrom="right"
        cardClasses="w-[40vw] h-[300px]"
        cardMotionClasses="top-[-10%] right-[8%]"
        imgClasses="w-[90vw]"
      />

      <Topic
        title="Music"
        bgImg="/images/Berimbaus-Street.jpg"
        text="Music we share"
        cardClasses="w-[35vw] h-[500px]"
        cardMotionClasses="top-[-3%] left-[-3%]"
        imgClasses="w-[90vw]"
      />
    </div>
  );
}

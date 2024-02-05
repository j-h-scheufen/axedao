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
      />
      {/* <div className="my-8">
        <Image src="/images/Chamada-Street.jpg" alt="Street Roda Chamada" />
      </div> */}

      <Topic
        title="Creating Axé II"
        bgImg="/images/Roda-PedestrianZone.jpg"
        text="Coming together and creating Axé"
        animateFrom="right"
      />
      {/* <div className="my-8">
        <Image
          src="/images/Roda-PedestrianZone.jpg"
          alt="Street Roda Pedestrian Zone"
        />
      </div> */}
    </div>
  );
}

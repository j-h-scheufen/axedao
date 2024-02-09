import Heading from '@/sections/Heading';
import Topic from '@/sections/Topic';

export default function Home() {
  return (
    <div className="relative flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <Heading />
      <Topic
        title="From Capoeira for Capoeira"
        bgImg="/images/chamada-street.jpg"
        text="This is all about liberating the Capoeira community digitally. The people behind this project want nothing but to give back and contribute to the prospering of this art form into the future."
        url="/about"
        cardClasses="w-[40vw] h-[300px]"
        cardMotionClasses="top-[60%] right-[8%]"
      />
      <Topic
        title="Axé DAO"
        bgImg="/images/roda-pedestrian-zone.jpg"
        text="Coordinating to fund and develop digital infrastructure for Capoeira. DAO stands for Decentralized Autonomous Organization. Simply put, it's a digital organization with a treasury and mechanism to manage funds aligned with the goals of the DAO's members.
        In our case, the goal is to advance Capoeira in the world and support its typically underfunded community. Teaching, maintaining its art form, and keeping the knowledge alive as a public good are examples of what this DAO could fund via spending proposals."
        url="/dao"
        imgEntryFrom="right"
        cardClasses="w-[50vw] h-[300px]"
        cardMotionClasses="top-[-7%] right-[-3%]"
        imgClasses="w-[90vw]"
      />
      <Topic
        title="Axé Tokens Fair Launch"
        bgImg="/images/berimbaus-street.jpg"
        text="The digital version of Axé and not an investment vehicle! They are not supposed to ever be worth any significant amount of money!
        This is not a shit coin, either! This token's utility is its symbolism. By sending it, one can express gratitude towards something or somebody in Capoeira. Its issuance and dispersement is overseen by the DAO and following the Fair Launch plan."
        url="/token"
        cardClasses="w-[35vw] h-[500px]"
        cardMotionClasses="top-[-3%] left-[-3%]"
        imgClasses="w-[90vw]"
      />
      {/* Todo
      - mobile version (pic is background and scrolls up, card slides in and is sticky for a sec.)
      - internationalization
      - color palette
      - Cards and background
      - Navbar (theme switch, Page links, App link). Contact or Impressum separate or on About?
      */}
    </div>
  );
}

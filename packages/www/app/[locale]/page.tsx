import Heading from '@/sections/Heading';

import {
  SupportedLanguage,
  fallbackLng,
  isSupportedLanguage,
} from '../i18n/settings';
import { createTranslation } from '../i18n/server';
import { NextPageProps } from '../layout';

export default async function Home({ params: { locale } }: NextPageProps) {
  const lang = isSupportedLanguage(locale)
    ? (locale as SupportedLanguage)
    : fallbackLng;
  const { t } = await createTranslation(lang, 'home');
  return (
    <div className="relative flex flex-col items-center justify-center gap-4 py-8 md:py-10">
      <Heading locale={lang} />
      <div className="my-6">{t('heading.title')}</div>

      {/* web3 allowing people to share in ownershipt and governance */}

      {/* <h3>What is this about?</h3>
      <p>
        Quilombo is not just a platform; it&apos;s a movement towards digitally
        empowering the Capoeira community.
        <br />
        Born from a deep appreciation for Capoeira&apos;s rich cultural
        tapestry, we&apos;re on a mission to elevate this art form into the
        digital realm. Our journey is driven by the spirit of Capoeira, blending
        tradition with innovation to serve those who live and breathe this art.
        <br />
        <br />
        At its core, Quilombo is crafted by Capoeiristas for Capoeiristas.
        We&apos;ve seen how Capoeira can transcend cultural boundaries, inspire
        communities, and foster a unique sense of belonging. Yet, despite its
        global influence, the guardians of this tradition face challenges in
        gaining the recognition and support they deserve. Quilombo aims to
        change this narrative by providing a digital platform that simplifies
        the organizational aspects of Capoeira groups and opens up new avenues
        for growth and collaboration.
        <br />
        <br />
        Our platform is a toolkit for the Capoeira community—a place to manage
        groups, connect with practitioners, and discover events. But more than
        that, it&apos;s a statement of our collective potential when we harness
        technology for the good of our art. Through Axé DAO, we&apos;re
        pioneering a new model of community-driven funding, empowering our
        members to directly influence the projects we undertake to support and
        sustain Capoeira across the globe. Quilombo is about more than just
        digital tools; it&apos;s about building a legacy. By joining hands with
        technology, we&apos;re ensuring that the essence and vibrancy of
        Capoeira not only endure but thrive.
        <br />
        <br />
        We invite you to be part of this journey, to contribute to a future
        where Capoeira continues to inspire and unite us all.
      </p>
      <h3>Self-Governance</h3>
      <p>
        Axé DAO stands as a pillar within the Quilombo platform, representing a
        significant leap forward in how the Capoeira community can collaborate,
        govern, and fund its collective aspirations. A Decentralized Autonomous
        Organization, or DAO, is a model of governance that relies on blockchain
        technology to facilitate transparent, equitable decision-making
        processes among its members. This model is particularly suited to our
        community&apos;s ethos of shared values and mutual support.
        <br />
        <br />
        The creation of Axé DAO is driven by the need for a structured,
        democratic way to manage the community&apos;s resources and direct them
        towards initiatives that benefit Capoeira as a whole. From funding local
        groups and events to preserving the cultural heritage of Capoeira
        through digital projects, Axé DAO empowers its members to make impactful
        decisions collectively.
        <br />
        <br />
        At its core, Axé DAO is about harnessing the collective power of the
        Capoeira community to support and sustain its growth. Members can
        propose projects, vote on the allocation of funds, and contribute to the
        strategic direction of the community&apos;s development. It&apos;s a
        platform where every member, regardless of their geographical location
        or rank within Capoeira, has a stake in the future of the art form.
        <br />
        <br />
        By participating in Axé DAO, members join a forward-thinking initiative
        that aims to ensure the longevity and prosperity of Capoeira. It offers
        a transparent mechanism for funding projects that align with the
        community&apos;s goals, such as enhancing global access to Capoeira,
        supporting educators and artists, and leveraging technology to document
        and share the rich history of this art form.
        <br />
        <br />
        Axé DAO is more than just a funding body; it&apos;s a community-driven
        effort to elevate Capoeira and ensure its relevance and vibrancy for
        generations to come. Join us in shaping the future of Capoeira, where
        every contribution moves us closer to our shared vision of a thriving
        global Capoeira community.
      </p>
      <h3>Goals</h3>
      <p>
        Quilombo, in collaboration with Axé DAO, is focused on practical
        advancements that cater directly to the needs and progress of the
        Capoeira community. Our aim is straightforward: to use technology to
        support, preserve, and enrich the practice of Capoeira. Here&apos;s how
        we plan to achieve this, broken down into concrete objectives and the
        features we&apos;re developing to meet them: **Providing Digital
        Identity and Web3 Access:** We’re setting up a digital foundation to
        give every Capoeirista and group a unique digital identity. This
        initiative not only positions Capoeira within the broader web3 landscape
        but also ensures our community&apos;s vibrant cultures and traditions
        gain the visibility they deserve. By embracing digital identities,
        we&apos;re opening up new avenues for interaction, recognition, and
        support within the global Capoeira community. Feature Bullet Points: -
        **User and Group Registry:** Create a detailed registry to map out the
        global Capoeira landscape, including the lineage of groups. This
        registry will serve as a comprehensive directory, enhancing connectivity
        and understanding among practitioners. - **Custom-Tailored Digital
        App:** Develop an app specifically designed for Capoeira practitioners,
        addressing our unique needs and allowing for community-driven evolution
        over time. - **Digital Base Infrastructure:** Establish a shared digital
        infrastructure that acts as a common good. This platform will enable the
        development of additional apps and services, such as class and event
        management tools, payment systems, and more, by and for the Capoeira
        community. - **Digital Assets and NFTs:** Introduce the Capoeira
        community to the world of digital assets. Beyond managing DAO funds,
        this includes the use of NFTs for digital badges and rewards,
        recognizing achievements, and contributing to the cultural fabric of
        Capoeira in the digital space. - **Activity and Value Flywheel:**
        Implement a strategy to continually build and develop our digital
        community infrastructure. By creating a cycle of activity and value, we
        aim to sustain and expand the digital capabilities of the Capoeira
        community, ensuring long-term growth and innovation. **Supporting the
        Community and Preserving Heritage:** Our initiatives are designed to
        provide tangible support to Capoeira practitioners and preserve the
        art&apos;s rich heritage. By funding projects that document the
        traditions of Capoeira and support its practitioners, we&apos;re
        investing in the future of this art form. **Fostering Innovation:** We
        encourage the exploration of new technologies and ideas that can enhance
        the practice of Capoeira. Through Axé DAO, we support projects that
        introduce innovative practices into the Capoeira experience. Quilombo
        and Axé DAO are committed to these tangible goals, leveraging technology
        to enhance the practice and preservation of Capoeira. By focusing on
        these objectives, we aim to create a robust digital ecosystem that
        supports the Capoeira community now and in the future.
      </p> */}
      {/* <Topic
        title="Axé Tokens Fair Launch"
        bgImg="/images/berimbaus-street.jpg"
        content="The digital version of Axé and not an investment vehicle! They are not supposed to ever be worth any significant amount of money!
        This is not a shit coin, either! This token's utility is its symbolism. By sending it, one can express gratitude towards something or somebody in Capoeira. Its issuance and dispersement is overseen by the DAO and following the Fair Launch plan."
        url="/token"
        cardClasses="w-[35vw] h-[500px]"
        cardMotionClasses="top-[-3%] left-[-3%]"
        imgClasses="w-[90vw]"
      /> */}
      {/* Todo
      - let AI summarize the rules around DAO voting / loot / planned representatives
      - mobile version (pic is background and scrolls up, card slides in and is sticky for a sec.)
      - internationalization
      - color palette
      - Cards and background
      - Page: Contact (with Impressum?)
      */}
    </div>
  );
}

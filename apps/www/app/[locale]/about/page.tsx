import { Card, Image, Link, button as buttonStyles } from '@heroui/react';

import { siteConfig } from '@/config/site';
import { GithubIcon } from '@/components/icons';
import { TextSection, Title } from '@/components/primitives';

export default function AboutPage() {
  return (
    <div>
      <div className="relative flex">
        <Image src="/images/angola-roda-bw.jpg" alt="Angola Roda Black-n-White" className="w-full lg:w-[80%]" />
        <Card className="absolute bottom-[5%] right-[5%] z-20 p-4 lg:p-5">
          <h1 className={Title({ size: 'xl' })}>About</h1>
        </Card>
      </div>
      <TextSection>
        <b>Capoeira</b> is one of the most fascinating microcosms and subcultures on this planet. With its origins in
        African culture and a history going back hundreds of years, Capoeira emerged as a reaction within Brazil&apos;s
        slavery system, survived in the jungle, and then took root in cities after slavery ended. It was outlawed to
        practice until 1936, when Mestre Bimba convinced the government to recongnize its cultural significance and
        allow the establishment of Capoeira sports academies. <br />
        Since the 1980s it has spread from Brazil all over the world creating a network of groups practicing its
        movements in different, evolving styles, its music and songs, with social networks and real world gatherings.
        <br />A whole economy involves events, courses, merchandize (clothes, instruments, multi-media) which supports
        those who dedicate their lives to Capoeira through teaching or other contributions that keep the culture alive
        and share in the joy it creates.
      </TextSection>
      <TextSection>
        And here&apos;s the point: The people keeping Capoeira alive are historically underpaid and underfunded and (for
        the most part) only make ends meet.
        <br />
        When it comes to &quot;digital&quot;, everyone is on their own leveraging freely available tools: social
        networks, YouTube, Amazon/Ebay, group management in Excel, payments? what payments?
      </TextSection>
      <TextSection>
        The term or concept of &quot;Axé&quot; &quot;appears simultaneously in Candomblé theology, Afro-Brazilian
        religious practices, and popular music&quot;
        (https://escholarship.org/content/qt9fz812sw/qt9fz812sw_noSplash_356e502eeb847ab88740b2c5f8b2202f.pdf). In
        Capoeira it losely has the meaning of &quot;good energy&quot; that can manifest in different ways, but usually
        when people get together to contribute and share into the same experience, e.g. when making music together. It
        is usually associated with the feeling of anticipation, heightened energy, and excitement you feel in the roda:
        The more the players, musicians, and participants in the roda feed off of each other&apos;s energy, the more
        Axé.
        <br />
        &quot;Axé é um conceito que pode ser definido como força invisível...axé é força vital, energia, a grande força
        inerente a todas as coisas... axé é a força contida em todos os elementos naturais e seres, porém que necessita
        de certos rituais e da palavra falada para ser detonado ou dinamizado&quot; REF
      </TextSection>
      <TextSection>
        An important thing about Capoeira is the mindset which is rooted in Liberation
        (https://www.amazon.com/-/en/J-Lowell-Lewis/dp/0226476839) and some Street-Smartness
        (https://www.amazon.com/Street-Smart-Song-Capoeira-Philosophy-Inner/dp/158394155X/ref=sr_1_1) sprinkled in
        later. A culture steeped in defiance and resistance matches well with the crypto&quot;s origins and ethos:
        digital & economic autonomy.
      </TextSection>
      <TextSection>
        AXÉ DAO exists to build digital community infrastructure for Capeira by using a decentralized organization to
        coordinate (otherwise this would never happen).
      </TextSection>
      <TextSection>
        References: 1. Ring of Liberation 2. Street-Smart 3. PLÍNIO TADEU DE GÓES, JR., Axé: Multiple Meanings with a
        Sole Essence Found in the Unity of Body, Nature and Spirit 4. Moura, Carlos Eugênio Marcondes de. Candomblé:
        religião do corpo e da alma - tipos psicológicos nas religiões afro-brasileiras. Rio de Janeiro: Pallas, 2000
      </TextSection>
      <div className="flex gap-3">
        <Link
          isExternal
          className={buttonStyles({ variant: 'bordered', radius: 'full' })}
          href={siteConfig.links.github}
        >
          <GithubIcon size={20} />
          GitHub
        </Link>
      </div>
    </div>
  );
}

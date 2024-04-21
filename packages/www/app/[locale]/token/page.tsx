import { TextSection, Title } from '@/components/primitives';
import { Card, Image } from '@nextui-org/react';

export default function AboutPage() {
  return (
    <div>
      <div className="relative flex">
        <Image
          src="/images/jogo-beach-silhouette.jpg"
          alt="Angola Roda Black-n-White"
          className="w-full lg:w-[80%]"
        />
        <Card className="absolute bottom-[5%] right-[5%] z-20 p-4 lg:p-5">
          <h1 className={Title({ size: 'xl' })}>AXÉ Token Fair Launch</h1>
        </Card>
      </div>

      <TextSection>
        {' '}
        Imagine, participants of a Capoeira event receiving some Axé tokens for
        showing up, for contributing. In turn, the participants can direct Axé
        tokens towards players whose games they liked. The NFT of a video-taped
        &apos;jogo&apos; at an event can be the recipient of Axé tokens to then
        distribute them to the players, the &apos;bateria&apos;, the event
        organizer, ... And in turn, they can give it away how they see fit. This
        digital flow of positive energy can be viewed as a heat map of where
        real &apos;Axé&apos; was created, where something worthwhile happened.
        And of course there are many other interesting use cases.
      </TextSection>

      <TextSection>
        Token Parameters Max Supply: 9,911,238,945 The initial thought was to
        make it an even 10 billion, a high number to make sure Axé would never
        be scarce. However, this number is close enough and honors M.
        Pastinha&apos;s and M. Bimba&apos;s birthdays. Even though Pastinha was
        born 10 years before Bimba, the reverse order gets us closer to the
        target of 10 bil (TODO: can be discussed!) 1899/11/23, 1889/04/05
      </TextSection>
      <TextSection>
        Initial Mint: 500,000,000 This initial mint follows a distribution plan
        (below) and is used for the Fair Launch. The DAO can set growth targets
        for the ecosystem and upon reaching them would have the right to mint
        more tokens up to the Max Supply, but this initial mint might be all
        that&apos;s ever needed. We&apos;ll see, the decision will be in the
        hands of the DAO
      </TextSection>
      <TextSection>
        Fair Launch Onboarding The majority of Axé tokens are reserved to be
        distributed over time to Capoeira groups and their members as they are
        onboarded. As incentives, each group or person who gets registered and
        verified automatically receives $AXÉ as follows: Mestre/Mestra: 5,000
        $AXÉ Individual group with local members: up to $25,000 $AXÉ depending
        on size, limited to 5000 groups Grants To reward contributors who
        perform tasks for the DAO, e.g. community management, programming tasks,
        support, etc. can be compensated via grants of $AXÉ. Founders and early
        contributors vesting The initiators of the project and people who
        contribute significantly to the early growth of the DAO and the
        ecosystem receive an allocation of $AXÉ that vests over 3 years. This
        creates skin in the game and ensures long-term commitment, a.k.a no rug.
        It is IMPORTANT to understand that the DAO plays a crucial role in how
        this distribution schedule is executed. The reserved tokens for
        Onboarding and Grants will be released via DAO proposals, meaning the
        DAO members will manually onboard and verify groups and mestres/mestras
        for them to receive their $AXÉ tokens. Please see the ⁠dao-explainer for
        further details!
      </TextSection>
    </div>
  );
}

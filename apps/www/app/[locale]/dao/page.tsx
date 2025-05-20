import { Card } from '@nextui-org/card';
import { Image } from '@nextui-org/image';

import { TextSection, Title } from '@/components/primitives';

export default function AboutPage() {
  return (
    <div>
      <div className="relative flex">
        <Image
          src="/images/pandeiro-agogo-lawn.jpg"
          alt="Angola Roda Black-n-White"
          className="w-full lg:w-[80%]"
        />
        <Card className="absolute bottom-[5%] right-[5%] z-20 p-4 lg:p-5">
          <h1 className={Title({ size: 'xl' })}>AXÉ Governance</h1>
        </Card>
      </div>

      <TextSection>
        DAO stands for Decentralized Autonomous Organization. Simply put,
        it&apos;s a digital organization with a treasury and mechanism to manage
        funds aligned with the goals of the DAO&apos;s members. In our case, the
        goal is to advance Capoeira in the world and support its typically
        underfunded community. Teaching, maintaining its art form, and keeping
        the knowledge alive as a public good are examples of what this DAO could
        fund via spending proposals. What the DAO gives us is a digital entity
        to manage members resources (funds) how funds are used The Axe DAO is
        the recipient of the majority of Axe Tokens and its purpose is to
        distribute the tokens according to the rules of the Fair Launch. But the
        DAO can also hold any other kinds of digital funds including digital
        fiat currencies like USD.
      </TextSection>
      <TextSection>
        Rules [DRAFT]: Existing members can propose a new member. Existing
        members of the DAO validate the new member&apos;s association to the
        Capoeira world, e.g. by asking for the membership in a group. Generally,
        DAO members can vote to accept anyone, but we&apos;re being selective to
        stay in control of the DAO&apos;s growth and make sure members are
        highly aligned with its early roadmap. By making a tribute to the
        treasury, a joining member can receive shares in the DAO which allow
        voting on proposals.
      </TextSection>
    </div>
  );
}

import { DaoMembership, Treasury } from '@/components/axe/dao';

const DaoPage = () => {
  return (
    <section className="flex flex-col items-center justify-center max-w-lg pt-2 sm:pt-4 w-full mx-auto">
      <div className="flex w-full flex-col gap-2 sm:gap-4 items-center">
        <h2 className="text-3xl font-bold text-center mb-1">Axé DAO</h2>
        <p className="text-center">The Axé DAO governs the community treasury and the Axé Safe.</p>
        <Treasury />
        <DaoMembership />
      </div>
    </section>
  );
};

export default DaoPage;

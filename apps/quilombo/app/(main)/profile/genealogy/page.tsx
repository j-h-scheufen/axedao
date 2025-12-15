import PageHeading from '@/components/PageHeading';
import { GenealogyProfileManager } from '@/components/genealogy/profile';
import { PATHS } from '@/config/constants';

const GenealogyProfilePage = () => {
  return (
    <div className="flex flex-col">
      <PageHeading backUrl={PATHS.profile}>Genealogy Profile</PageHeading>
      <GenealogyProfileManager />
    </div>
  );
};

export default GenealogyProfilePage;

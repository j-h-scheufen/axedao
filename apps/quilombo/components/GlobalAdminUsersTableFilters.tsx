import { Input } from "@heroui/input";
import { Search } from 'lucide-react';

type Props = {
  searchTerm: string | undefined;
  setSearchTerm: (searchTerm: string | undefined) => void;
};
const GlobalAdminUsersTableFilters = ({ searchTerm, setSearchTerm }: Props) => {
  return (
    <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
      <Input
        isClearable
        onClear={() => setSearchTerm(undefined)}
        className="w-full"
        placeholder="Search"
        startContent={<Search className="h-4 w-4" />}
        labelPlacement="outside"
        value={searchTerm || ''}
        onChange={(e) => setSearchTerm(e.target.value)}
      />
    </div>
  );
};
export default GlobalAdminUsersTableFilters;

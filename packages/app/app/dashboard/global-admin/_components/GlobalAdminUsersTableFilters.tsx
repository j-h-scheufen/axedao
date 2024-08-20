import { Input } from '@nextui-org/input';
import { Select, SelectItem } from '@nextui-org/react';
import { Search } from 'lucide-react';

type SearchOption = {
  value: string;
  label: string;
};

type Props = {
  searchTerm: string | null;
  setSearchTerm: (searchTerm: string) => void;
  searchBy: string | null;
  setSearchBy: (searchBy: string) => void;
  searchOptions: SearchOption[];
};
const GlobalAdminUsersTableFilters = ({ searchTerm, setSearchTerm, searchBy, setSearchBy, searchOptions }: Props) => {
  return (
    <div className="flex h-fit flex-col items-start justify-start gap-3 md:flex-row md:items-end">
      <Input
        isClearable
        onClear={() => setSearchTerm('')}
        className="w-full"
        placeholder="Search"
        startContent={<Search className="h-4 w-4" />}
        labelPlacement="outside"
        value={searchTerm || ''}
        onChange={(e) => setSearchTerm(e.target.value)}
      />
      <Select
        label={
          <span className="inline-block h-10 whitespace-nowrap text-small leading-10 text-default-500">Search by</span>
        }
        labelPlacement="outside-left"
        value={searchBy || 'name'}
        className="ml-auto w-48 md:ml-0 md:flex-col"
        classNames={{ value: '!text-default-500', listbox: '!text-default-500' }}
        defaultSelectedKeys={['name']}
        onChange={(e) => setSearchBy(e.target.value)}
      >
        {searchOptions.map(({ value, label }) => (
          <SelectItem key={value} value={value}>
            {label}
          </SelectItem>
        ))}
      </Select>
    </div>
  );
};
export default GlobalAdminUsersTableFilters;

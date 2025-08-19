import { Button } from '@heroui/react';
import { Filter } from 'lucide-react';

type Props = {
  onPress: () => void;
  className?: string;
};

const FilterButton = ({ onPress, className = '' }: Props) => {
  return (
    <Button isIconOnly variant="bordered" size="sm" onPress={onPress} className={`flex-1 sm:flex-none ${className}`}>
      <Filter className="h-4 w-4" />
    </Button>
  );
};

export default FilterButton;

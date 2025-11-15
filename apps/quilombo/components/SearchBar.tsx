'use client';

import { Input } from '@heroui/react';
import { Search } from 'lucide-react';
import { useState, useEffect } from 'react';
import type { ReactNode } from 'react';

type Props = {
  placeholder?: string;
  searchTerm?: string;
  onSearchChange: (value: string) => void;
  onClear: () => void;
  leftContent?: ReactNode; // NEW: content before search icon (e.g., country filter)
  filterContent?: ReactNode;
  rightContent?: ReactNode;
  className?: string;
};

const SearchBar = ({
  placeholder = 'Search...',
  searchTerm = '',
  onSearchChange,
  onClear,
  leftContent,
  filterContent,
  rightContent,
  className = '',
}: Props) => {
  const [inputValue, setInputValue] = useState(searchTerm);

  // Sync with external searchTerm changes
  useEffect(() => {
    setInputValue(searchTerm);
  }, [searchTerm]);

  const handleSearchChange = (value: string) => {
    setInputValue(value);
    onSearchChange(value);
  };

  const handleClear = () => {
    setInputValue('');
    onClear();
  };

  return (
    <div className={`flex gap-2 sm:gap-4 items-center ${className}`}>
      {/* Search Input Container */}
      <div className="flex-1 min-w-0">
        <Input
          isClearable
          onClear={handleClear}
          className="w-full"
          placeholder={placeholder}
          startContent={
            <div className="flex items-center gap-1">
              {leftContent}
              <Search className="h-4 w-4 text-default-400" />
            </div>
          }
          labelPlacement="outside"
          value={inputValue}
          onChange={(e) => handleSearchChange(e.target.value)}
        />
      </div>

      {/* Filter and Right Content */}
      {(filterContent || rightContent) && (
        <div className="flex gap-2 flex-shrink-0">
          {filterContent && <div>{filterContent}</div>}
          {rightContent && <div>{rightContent}</div>}
        </div>
      )}
    </div>
  );
};

export default SearchBar;

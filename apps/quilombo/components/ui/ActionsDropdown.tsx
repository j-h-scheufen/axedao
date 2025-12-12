'use client';

import { Button, Dropdown, DropdownTrigger, DropdownMenu, DropdownItem } from '@heroui/react';
import type { Key } from '@react-types/shared';
import { MoreVerticalIcon } from 'lucide-react';
import Link from 'next/link';
import type { ReactNode } from 'react';

/**
 * Configuration for a single dropdown menu item.
 */
export type ActionItem = {
  key: string;
  label: string;
  icon?: ReactNode;
  href?: string;
  color?: 'default' | 'primary' | 'secondary' | 'success' | 'warning' | 'danger';
  className?: string;
  /** If true, item is hidden from the menu */
  hidden?: boolean;
  /** Called when item is selected (for non-link items) */
  onAction?: () => void;
};

type ActionsDropdownProps = {
  /** Menu items to display */
  items: ActionItem[];
  /** Whether the dropdown is in a loading state */
  isLoading?: boolean;
  /** Aria label for accessibility */
  ariaLabel: string;
  /** Optional callback when any action is triggered */
  onAction?: (key: Key) => void;
};

/**
 * Reusable actions dropdown component.
 * Provides a consistent three-dot menu pattern used across Profile and Group views.
 *
 * @example
 * ```tsx
 * <ActionsDropdown
 *   ariaLabel="Profile actions"
 *   items={[
 *     { key: 'edit', label: 'Edit Profile', icon: <SettingsIcon />, href: '/profile/edit' },
 *     { key: 'delete', label: 'Delete', icon: <TrashIcon />, color: 'danger', onAction: handleDelete },
 *   ]}
 * />
 * ```
 */
const ActionsDropdown = ({ items, isLoading = false, ariaLabel, onAction }: ActionsDropdownProps) => {
  const visibleItems = items.filter((item) => !item.hidden);

  if (isLoading) {
    return (
      <Button isIconOnly variant="light" size="sm" isLoading>
        <MoreVerticalIcon className="h-4 w-4" />
      </Button>
    );
  }

  const handleAction = (key: Key) => {
    const item = items.find((i) => i.key === key);
    if (item?.onAction) {
      item.onAction();
    }
    onAction?.(key);
  };

  return (
    <Dropdown>
      <DropdownTrigger>
        <Button isIconOnly variant="light" size="sm">
          <MoreVerticalIcon className="h-4 w-4" />
        </Button>
      </DropdownTrigger>
      <DropdownMenu aria-label={ariaLabel} onAction={handleAction}>
        {visibleItems.map((item) =>
          item.href ? (
            <DropdownItem
              key={item.key}
              as={Link}
              href={item.href}
              color={item.color}
              className={item.color === 'danger' ? 'text-danger' : item.className}
              startContent={item.icon}
            >
              {item.label}
            </DropdownItem>
          ) : (
            <DropdownItem
              key={item.key}
              color={item.color}
              className={item.color === 'danger' ? 'text-danger' : item.className}
              startContent={item.icon}
            >
              {item.label}
            </DropdownItem>
          )
        )}
      </DropdownMenu>
    </Dropdown>
  );
};

export default ActionsDropdown;

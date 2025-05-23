'use client';

import { Button, Dropdown, DropdownItem, DropdownMenu, DropdownTrigger } from '@heroui/react';
import { useChainId, useSwitchChain } from 'wagmi';

import { configureChains } from '@/config/wagmi';

const chains = configureChains();

export default function ChainSwitch() {
  const chainId = useChainId();
  const { switchChain, isPending } = useSwitchChain();

  const currentChain = chains.find((chain) => chain.id === chainId);

  return (
    <div className="flex items-center">
      <Dropdown>
        <DropdownTrigger>
          <Button variant="bordered" className="capitalize" isLoading={isPending}>
            {currentChain?.name || 'Select Network'}
          </Button>
        </DropdownTrigger>
        <DropdownMenu
          aria-label="Select Network"
          onAction={(key) => {
            if (switchChain) {
              const chainId = Number(key);
              switchChain({ chainId });
            }
          }}
        >
          {chains.map((chain) => (
            <DropdownItem
              key={chain.id}
              className="capitalize"
              startContent={chain.id === chainId && <div className="w-2 h-2 rounded-full bg-success mr-2" />}
            >
              {chain.name}
            </DropdownItem>
          ))}
        </DropdownMenu>
      </Dropdown>
    </div>
  );
}

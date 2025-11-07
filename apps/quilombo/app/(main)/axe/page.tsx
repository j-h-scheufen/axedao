'use client';

import { Tab } from '@heroui/react';

import PageTabs from '@/components/PageTabs';
import { Swap, Transfer } from '@/components/axe';

/**
 * Axé Token Page
 *
 * Note: Web3 transaction buttons in child components (Transfer, Swap) should use
 * useWalletProtection() hook to protect actions that require a wallet.
 *
 * Example usage in a component:
 * ```tsx
 * const { protectAction, WalletModal } = useWalletProtection();
 *
 * const handleSwap = () => {
 *   protectAction(() => {
 *     // Swap logic here - only executes if wallet is connected
 *   });
 * };
 *
 * return (
 *   <>
 *     <Button onPress={handleSwap}>Swap Tokens</Button>
 *     <WalletModal />
 *   </>
 * );
 * ```
 */
const AxePage = () => {
  return (
    <PageTabs defaultTab="send">
      <Tab key="send" title="Send" className="tab-wrapper">
        <div className="tab-content">
          <h2 className="text-3xl font-bold text-center mb-1">Send Axé</h2>
          <p className="text-center">Send Axé to members of the community</p>
          <Transfer />
        </div>
      </Tab>
      <Tab key="trade" title="Trade" className="tab-wrapper">
        <div className="tab-content">
          <h2 className="text-3xl font-bold text-center mb-1">Buy / Sell Axé</h2>
          <p className="text-center">Buy and sell Axé with USD.</p>
          <Swap />
        </div>
      </Tab>
    </PageTabs>
  );
};

export default AxePage;

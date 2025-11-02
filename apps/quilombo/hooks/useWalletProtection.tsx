import { useState, useCallback } from 'react';
import { useSession } from 'next-auth/react';
import { useAccount } from 'wagmi';

import WalletRequiredModal from '@/components/WalletRequiredModal';

/**
 * Hook to protect web3 actions that require a linked AND connected Human Wallet.
 *
 * Instead of blocking entire pages, this hook allows you to protect individual
 * actions/buttons. If the user doesn't have a wallet linked OR if their wallet
 * is not currently connected via wagmi, a modal prompts them to connect before
 * the action executes.
 *
 * IMPORTANT: For web3 transactions to work, BOTH conditions must be true:
 * 1. Wallet is linked in database (checked via session.user.walletAddress)
 * 2. Wallet is actively connected via wagmi (isWalletConnected)
 *
 * This hook uses the session object to check wallet status, avoiding unnecessary
 * API calls. When a wallet is linked via the modal, the session is automatically
 * refreshed to include the new wallet address.
 *
 * @returns {Object} Wallet protection utilities
 * @property {Function} protectAction - Wraps an action to check wallet before executing
 * @property {JSX.Element} WalletModal - Modal component to render in your component
 * @property {boolean} hasWallet - Whether user has wallet in session (linked in DB)
 * @property {boolean} isWalletConnected - Whether wallet is actively connected via wagmi
 * @property {boolean} isReady - Whether wallet is both linked AND connected (ready for web3 txs)
 * @property {boolean} isLoading - Whether session is being loaded
 *
 * @example
 * ```tsx
 * const MyComponent = () => {
 *   const { protectAction, WalletModal } = useWalletProtection();
 *
 *   const handleJoinDao = () => {
 *     protectAction(() => {
 *       // This only runs if wallet is linked AND connected
 *       console.log('Joining DAO...');
 *       // ... DAO join logic
 *     });
 *   };
 *
 *   return (
 *     <>
 *       <Button onPress={handleJoinDao}>
 *         Join DAO
 *       </Button>
 *       <WalletModal />
 *     </>
 *   );
 * };
 * ```
 */
export const useWalletProtection = () => {
  const { data: session, status } = useSession();
  const { address: connectedAddress } = useAccount(); // Wagmi connection
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [_pendingAction, setPendingAction] = useState<(() => void) | null>(null);

  // Check if wallet is linked in session (no DB query needed)
  const hasWallet = !!session?.user?.walletAddress;
  const isWalletConnected = !!connectedAddress;

  // For web3 transactions, we need wallet linked AND connected
  // Optionally verify addresses match (but handle case where user might have multiple wallets)
  const isReady = hasWallet && isWalletConnected;
  const isLoading = status === 'loading';

  /**
   * Wraps an action to check for wallet before executing.
   * Checks both session (wallet linked in DB) AND active wagmi connection.
   *
   * @param action - The function to execute if wallet is ready
   */
  const protectAction = useCallback(
    (action: () => void) => {
      if (isReady) {
        // Wallet is linked AND connected, execute action immediately
        action();
      } else {
        // Either no wallet or not connected, store action and show modal
        setPendingAction(() => action);
        setIsModalOpen(true);
      }
    },
    [isReady]
  );

  /**
   * Called after successful wallet connection in modal.
   * Clears pending action without executing it - user must re-click button.
   */
  const handleWalletConnected = useCallback(() => {
    setPendingAction(null);
    setIsModalOpen(false);
  }, []);

  /**
   * Called when modal is closed without connecting wallet
   */
  const handleModalClose = useCallback(() => {
    setIsModalOpen(false);
    setPendingAction(null);
  }, []);

  // Render the modal with connection callback
  const WalletModal = (
    <WalletRequiredModal
      isOpen={isModalOpen}
      onClose={handleModalClose}
      onWalletConnected={handleWalletConnected}
      hasWallet={hasWallet}
    />
  );

  return {
    protectAction,
    WalletModal,
    hasWallet,
    isWalletConnected,
    isReady,
    isLoading,
  };
};
